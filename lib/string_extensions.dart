extension StringExtensions on String {
  bool areAllLettersA() {
    for (int i = 0; i < length; i++) {
      final letter = this[i];
      if (letter != 'a') return false;
    }

    return true;
  }
}
