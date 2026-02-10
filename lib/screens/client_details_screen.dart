import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/client.dart';
import '../models/pet.dart';
import '../providers/app_state.dart';
import '../widgets/custom_bottom_nav.dart';

class ClientDetailsScreen extends StatefulWidget {
  final Client client;

  const ClientDetailsScreen({super.key, required this.client});

  @override
  State<ClientDetailsScreen> createState() => _ClientDetailsScreenState();
}

class _ClientDetailsScreenState extends State<ClientDetailsScreen> {
  int _currentIndex = 1; // "Explore" tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFB),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Column(
          children: [
            const Text(
              'Explore Pets',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.location_on, size: 12, color: Colors.grey),
                Text(
                  widget.client.name,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          Consumer<AppState>(
            builder: (context, appState, child) {
              final pets = appState.getPetsForClient(widget.client.id);

              if (pets.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.pets, size: 64, color: Colors.grey[300]),
                      const SizedBox(height: 16),
                      const Text('No pets found for this client'),
                      ElevatedButton(
                        onPressed: () => _showAddPetDialog(context),
                        child: const Text('Add your first pet'),
                      ),
                    ],
                  ),
                );
              }

              return GridView.builder(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: pets.length,
                itemBuilder: (context, index) {
                  final pet = pets[index];
                  final colors = [
                    const Color(0xFFE5DEFF), // Lilac
                    const Color(0xFFFFDDE1), // Pink
                    const Color(0xFFD6EADF), // Green
                    const Color(0xFFE5E5E5), // Grey
                    const Color(0xFFFFF4E1), // Peach
                  ];
                  final bgColor = colors[index % colors.length];

                  return _buildPetGridCard(context, pet, bgColor, appState);
                },
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNavBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                if (index == 0) Navigator.pop(context);
                setState(() => _currentIndex = index);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: FloatingActionButton(
          onPressed: () => _showAddPetDialog(context),
          backgroundColor: const Color(0xFFFFA07A),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildPetGridCard(
    BuildContext context,
    Pet pet,
    Color bgColor,
    AppState appState,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Stack(
        children: [
          const Positioned(
            top: 12,
            left: 12,
            child: Icon(Icons.favorite_border, size: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Center(
                  child: Icon(
                    _getPetIcon(pet.species),
                    size: 80,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ),
                const Spacer(),
                Text(
                  pet.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${pet.age} years old',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                Text(
                  pet.breed,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: IconButton(
              icon: const Icon(Icons.close, size: 16, color: Colors.grey),
              onPressed: () => appState.deletePet(pet.id),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getPetIcon(String species) {
    final s = species.toLowerCase();
    if (s.contains('perro') || s.contains('dog')) return Icons.pets;
    if (s.contains('gato') || s.contains('cat')) return Icons.catching_pokemon;
    return Icons.pets;
  }

  void _showAddPetDialog(BuildContext context) {
    final nameController = TextEditingController();
    final speciesController = TextEditingController();
    final breedController = TextEditingController();
    final ageController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Pet'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: speciesController,
              decoration: const InputDecoration(labelText: 'Species'),
            ),
            TextField(
              controller: breedController,
              decoration: const InputDecoration(labelText: 'Breed'),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                Provider.of<AppState>(context, listen: false).addPet(
                  clientId: widget.client.id,
                  name: nameController.text,
                  species: speciesController.text,
                  breed: breedController.text,
                  age: int.tryParse(ageController.text) ?? 0,
                );
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
