extension StringUtil on String {
  String capitalize() {
    try {
      return this[0].toUpperCase() + this.substring(1);
    } on FormatException {
      return this;
    }
  }
}
