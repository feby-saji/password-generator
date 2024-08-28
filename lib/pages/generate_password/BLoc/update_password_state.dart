class GeneratePasswordState {
  final String password;
  final double length;
  final bool includeUppercase;
  final bool includeDigits;
  final bool includeSpecialChars;
  final bool includeLowercase;
  final String error;

  const GeneratePasswordState({
    required this.password,
    required this.length,
    this.error = '',
    this.includeUppercase = false,
    this.includeDigits = false,
    this.includeSpecialChars = false,
    this.includeLowercase = true,
  });

  GeneratePasswordState copyWith({
    String? password,
    double? length,
    bool? includeUppercase,
    bool? includeDigits,
    bool? includeSpecialChars,
    bool? includeLowercase,
    String? error,
  }) {
    return GeneratePasswordState(
      password: password ?? this.password,
      length: length ?? this.length,
      error: error ?? this.error,
      includeUppercase: includeUppercase ?? this.includeUppercase,
      includeDigits: includeDigits ?? this.includeDigits,
      includeSpecialChars: includeSpecialChars ?? this.includeSpecialChars,
      includeLowercase: includeLowercase ?? this.includeLowercase,
    );
  }
}
