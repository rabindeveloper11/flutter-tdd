class ListUniqueChecker {
  static bool isUnique<T>(List<T> list, T element) {
    for (var existingElement in list) {
      if (existingElement == element) {
        return false;
      }
    }
    return true;
  }
}
