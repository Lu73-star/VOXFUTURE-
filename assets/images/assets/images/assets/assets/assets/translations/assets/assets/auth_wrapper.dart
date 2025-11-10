import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/firebase_service.dart';
import 'login_screen.dart';
import 'dashboard_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseService firebaseService = FirebaseService();

    return StreamBuilder<User?>(
      stream: firebaseService.authStateChanges,
      builder: (context, snapshot) {
        // Exibe uma tela de carregamento enquanto verifica o estado
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: CircularProgressIndicator(color: Colors.amberAccent),
            ),
          );
        }

        // Se o usuário está logado, vai para o Dashboard
        if (snapshot.hasData) {
          return const DashboardScreen();
        }

        // Caso contrário, mostra a tela de Login
        return const LoginScreen();
      },
    );
  }
}
