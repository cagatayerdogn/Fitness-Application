import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/auth.repository.dart';

final authControllerProvider = Provider(
  (ref) => AuthController(
    authRepository: ref.watch(authRepositoryProvider),
  ),
);

class AuthController {
  final AuthRepository authRepository;

  AuthController({
    required this.authRepository,
  });

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> SignUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return authRepository.SignUpWithEmailAndPassword(
        email: email, password: password);
  }
Future<String> forgotPassword({required String email}) async {
    return authRepository.ResetPassword(email: email);
  }


  Future<void> signOut() async {
    return authRepository.SignOut();
  }
}
