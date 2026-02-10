extension StringExtension on String {
  String removeUnderlines() => this.replaceAll('_', ' ');
}
