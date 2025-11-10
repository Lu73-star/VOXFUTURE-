import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/dashboard_screen.dart';
import '../screens/login_screen.dart';
import '../services/firebase_service.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseService = FirebaseService();

    return StreamBuilder<User?>(
      stream: firebaseService.authStateChanges,
      builder: (context, snapshot) {
        // Enquanto carrega o estado do usuário
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.amberAccent,
              ),
            ),
          );
        }

        // Usuário logado → vai pro Dashboard
        if (snapshot.hasData) {
          return const DashboardScreen();
        }

        // Usuário não logado → vai pro Login
        return const LoginScreen();
      },
    );
  }
}
