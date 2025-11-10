import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/language_loader.dart';
import 'subscription_screen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final t = LanguageLoader.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(t['perfil'] ?? 'Perfil'),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.amberAccent,
              child: Icon(Icons.person, color: Colors.black, size: 50),
            ),
            const SizedBox(height: 20),
            Text(
              user?.displayName ?? 'Usuário VoxFuture',
              style: const TextStyle(
                color: Colors.amberAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              user?.email ?? 'sem_email@voxfuture.app',
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const Divider(height: 40, color: Colors.white24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.workspace_premium, color: Colors.amberAccent),
                const SizedBox(width: 8),
                Text(
                  t['assinatura'] ?? 'Assinatura',
                  style: const TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              t['plano_atual'] ?? 'Plano atual: Orion Pro',
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 25),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amberAccent,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SubscriptionScreen()),
                );
              },
              icon: const Icon(Icons.upgrade),
              label: Text(t['alterar_plano'] ?? 'Alterar plano'),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if (mounted) {
                  Navigator.pop(context);
                }
              },
              icon: const Icon(Icons.logout),
              label: Text(t['sair'] ?? 'Sair'),
            ),
          ],
        ),
      ),
    );
  }
}
