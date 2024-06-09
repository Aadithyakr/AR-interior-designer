import 'package:pro_s6/services/auth/firebase_provider.dart';
import 'package:pro_s6/services/auth/provider.dart';
import 'package:pro_s6/services/auth/user_model.dart';

class AuthService implements AuthProviders {
  final AuthProviders provider;

  const AuthService(this.provider);

  factory AuthService.firebase() => AuthService(FireBaseAuthProvider());

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(
        email: email,
        password: password,
      );

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(
        email: email,
        password: password,
      );

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();

  @override
  Future<void> initialize() => provider.initialize();

  @override
  Future<void> sendPasswordReset({required String toEmail}) =>
      provider.sendPasswordReset(toEmail: toEmail);
}
