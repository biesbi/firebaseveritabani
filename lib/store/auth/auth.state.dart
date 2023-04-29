import 'package:firebase_auth/firebase_auth.dart';

class AuthState {
  User? user;

  AuthState({this.user});
  factory AuthState.initial() => AuthState(user: null);
}
