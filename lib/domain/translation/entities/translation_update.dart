sealed class TranslationUpdate {
  const TranslationUpdate();
}

class TranslationUpdateData extends TranslationUpdate {
  final String id;
  final String text;

  const TranslationUpdateData({required this.id, required this.text});
}

class TranslationUpdateSummary extends TranslationUpdate {
  final String summary;

  const TranslationUpdateSummary({required this.summary});
}
