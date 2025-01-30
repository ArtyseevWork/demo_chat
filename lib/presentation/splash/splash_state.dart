//модель зберігання стану сторінки
class SplashState {
  final bool isLoading;
  final bool? isTokenRight;
  final String? error;

  SplashState({
    required this.isLoading,
    this.isTokenRight,
    this.error,
  });

  SplashState copyWith({
    bool? isLoading,
    bool? isTokenRight,
    String? error,
  }) {
    return SplashState(
      isLoading: isLoading ?? this.isLoading,
      isTokenRight: isTokenRight ?? this.isTokenRight,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'SplashState(isLoading: $isLoading, isTokenRight: $isTokenRight, error: $error)';
  }
}
