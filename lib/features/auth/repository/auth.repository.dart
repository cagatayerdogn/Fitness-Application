import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider =
    Provider((ref) => AuthRepository(auth: FirebaseAuth.instance));

class AuthRepository {
  final FirebaseAuth auth;

  AuthRepository({
    required this.auth,
  });

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> SignUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

    Future<String> ResetPassword({
    required String email,
  }) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return 'Password reset email sent successfully.';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'Email is not registered';
      }
      return 'Failed to send password reset email: ${e.message}';
    } catch (error) {
      return 'An unexpected error occurred: $error';
    }
  }


  Future<void> SignOut() async {
    await auth.signOut();
  }
}
