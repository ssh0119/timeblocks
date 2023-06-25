class TimeblockValidator {
  static String? isValidName(String? name) {
    if (name == null) return "Can't be null";
    if (name.isEmpty) return "Can't be empty";

    int nameLength = name.trim().length;

    if (nameLength <= 1 || nameLength > 50) {
      return 'Must be between 1 and 50 characters';
    }

    return null;
  }
}
