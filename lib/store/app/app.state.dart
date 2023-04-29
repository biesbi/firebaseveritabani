import '../auth/auth.state.dart';

class AppState {
  final AuthState auth;

  AppState({
    required this.auth,
  });

  factory AppState.initial() => AppState(auth: AuthState.initial());

  AppState copyWith({
    required AuthState auth,
  }) {
    return AppState(auth: auth);
  }
}

class AppPayload {
  dynamic type;
  dynamic payload;

  AppPayload({this.type, this.payload});
}
