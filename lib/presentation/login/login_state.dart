//модель зберігання стану сторінки
class LoginState {
  final bool isLoading;
  final bool isLoginSuccess;
  final String error;
  final bool canSubmit;

  LoginState({
    required this.isLoading,
    this.isLoginSuccess = false,
    this.error = "",
    this.canSubmit = false,
  });

  LoginState copyWith({
    bool? isLoading,
    bool? isLoginSuccess,
    String? error,
    bool? canSubmit,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
      error: error ?? this.error,
      canSubmit: canSubmit ?? this.canSubmit,
    );
  }
}
