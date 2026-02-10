import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../widgets/custom_bottom_nav.dart';
import 'client_details_screen.dart';

class ClientListScreen extends StatefulWidget {
  const ClientListScreen({super.key});

  @override
  State<ClientListScreen> createState() => _ClientListScreenState();
}

class _ClientListScreenState extends State<ClientListScreen> {
  final _searchController = TextEditingController();
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _categories = [
    {
      'name': 'Cats',
      'icon': Icons.catching_pokemon,
      'color': const Color(0xFFF0F0F0),
    },
    {'name': 'Dogs', 'icon': Icons.pets, 'color': const Color(0xFFFFF4E1)},
    {
      'name': 'Birds',
      'icon': Icons.airplanemode_active,
      'color': const Color(0xFFE1F5FE),
    },
    {'name': 'Fish', 'icon': Icons.water, 'color': const Color(0xFFE8F5E9)},
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Let\'s find a',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        Text(
                          'Little Friends',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: SearchBar(
                                controller: _searchController,
                                hintText: 'Search here...',
                                elevation: WidgetStateProperty.all(0),
                                backgroundColor: WidgetStateProperty.all(
                                  Colors.grey[100],
                                ),
                                leading: const Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                onChanged: (value) => setState(() {}),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1D1D1D),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                Icons.tune,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Category',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'View all',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _categories.length,
                            itemBuilder: (context, index) {
                              final cat = _categories[index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                        color: cat['color'],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(cat['icon'], size: 28),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      cat['name'],
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Consumer<AppState>(
                  builder: (context, appState, child) {
                    final filteredClients = appState.clients.where((client) {
                      return client.name.toLowerCase().contains(
                        _searchController.text.toLowerCase(),
                      );
                    }).toList();

                    if (filteredClients.isEmpty) {
                      return const SliverFillRemaining(
                        child: Center(child: Text('No friends found yet')),
                      );
                    }

                    return SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final client = filteredClients[index];
                          final pets = appState.getPetsForClient(client.id);
                          final color = index % 2 == 0
                              ? const Color(0xFFFFE5D9)
                              : const Color(0xFFD6EADF);

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ClientDetailsScreen(client: client),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 24),
                              height: 180,
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: -20,
                                    bottom: 0,
                                    child: Icon(
                                      Icons.pets,
                                      size: 150,
                                      color: Colors.white.withOpacity(0.3),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          client.name,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '${pets.length} pets registered',
                                          style: TextStyle(
                                            color: Colors.black.withOpacity(
                                              0.6,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Positioned(
                                    top: 20,
                                    left: 20,
                                    child: Icon(Icons.favorite_border),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }, childCount: filteredClients.length),
                      ),
                    );
                  },
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNavBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: FloatingActionButton(
          onPressed: () => _showAddClientDialog(context),
          backgroundColor: const Color(0xFF1D1D1D),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  void _showAddClientDialog(BuildContext context) {
    final nameController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Client'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                Provider.of<AppState>(
                  context,
                  listen: false,
                ).addClient(name: nameController.text);
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
