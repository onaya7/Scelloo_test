class Validators {
  Validators._();

  static String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return '● Title is required';
    }
    return null;
  }


  static String? validateBody(String? value) {
    if (value == null || value.isEmpty) {
      return '● Body is required';
    }
    return null;
  }
}
