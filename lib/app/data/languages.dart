class Language {
  final String langCode;
  final String language;
  bool isSelected;

  Language(this.langCode, this.language, this.isSelected);

  Language copyWith({
    String? langCode,
    String? language,
    bool? isSelected,
  }) {
    return Language(langCode ?? this.langCode, language ?? this.language,
        isSelected ?? this.isSelected);
  }
}
