enum AIProvider {
  gemini,
  openAI,
  claude;

  static AIProvider fromString(String value) {
    return AIProvider.values.firstWhere(
      (e) => e.name == value,
      orElse: () => AIProvider.gemini,
    );
  }
}
