import 'package:pro_s6/services/auth/user_model.dart';

abstract class AuthProviders {
  AuthUser? get currentUser;
  Future<AuthUser> logIn({
    required String email,
    required String password,
  });
  Future<AuthUser> createUser({
    required String email,
    required String password,
  });
  Future<void> logOut();
  Future<void> sendEmailVerification();
  Future<void> initialize();

  Future<void> sendPasswordReset({required String toEmail});
}
