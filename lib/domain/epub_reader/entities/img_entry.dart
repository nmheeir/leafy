class ImgEntry {
  final String path;
  final double? yrel;

  ImgEntry(this.path, this.yrel);

  static ImgEntry? fromXmlString(String text) {
    // Regex cho format: <img src="path" yrel="1.5">
    final RegExp regex = RegExp(r'<img\s+src="([^"]+)"\s+yrel="([^"]+)">');
    final match = regex.firstMatch(text);

    if (match != null) {
      return ImgEntry(match.group(1)!, double.tryParse(match.group(2) ?? ''));
    }
    return null;
  }
}
