import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Retorna o usuário autenticado, se existir
  User? get currentUser => _auth.currentUser;

  // Escuta mudanças de autenticação em tempo real
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Login com e-mail e senha
  Future<String?> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return _handleAuthError(e);
    } catch (e) {
      return 'Erro inesperado: $e';
    }
  }

  // Registro de novo usuário
  Future<String?> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return _handleAuthError(e);
    } catch (e) {
      return 'Erro inesperado: $e';
    }
  }

  // Redefinição de senha
  Future<String?> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      return _handleAuthError(e);
    } catch (e) {
      return 'Erro inesperado: $e';
    }
  }

  // Logout do usuário atual
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Tratamento de erros comuns do FirebaseAuth
  String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'Usuário não encontrado.';
      case 'wrong-password':
        return 'Senha incorreta.';
      case 'email-already-in-use':
        return 'E-mail já está em uso.';
      case 'invalid-email':
        return 'E-mail inválido.';
      case 'weak-password':
        return 'A senha é muito fraca.';
      default:
        return 'Erro: ${e.message ?? 'desconhecido'}';
    }
  }
}
