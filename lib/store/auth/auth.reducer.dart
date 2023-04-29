import 'auth.state.dart';

enum AuthActions { SET_USER }

AuthState authReducer(AuthState state, dynamic action) {
  AuthState newState = state;

  switch (action.type) {
    case AuthActions.SET_USER:
      newState.user = action.payload;
      return newState;
  }

  return newState;
}
