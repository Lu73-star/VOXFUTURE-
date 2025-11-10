import 'package:flutter/material.dart';
import '../services/language_loader.dart';
import 'home_screen.dart';
import 'register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const LoginScreen({super.key, required this.onLocaleChange});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;

  Future<void> _login() async {
    setState(() => _loading = true);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(onLocaleChange: widget.onLocaleChange),
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Erro ao entrar')),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = LanguageLoader.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 64, color: Colors.amber),
              const SizedBox(height: 24),
              Text(
                t['bem_vindo'] ?? 'Bem-vindo ao VoxFuture',
                style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: t['email'] ?? 'E-mail',
                  labelStyle: const TextStyle(color: Colors.amber),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: t['senha'] ?? 'Senha',
                  labelStyle: const TextStyle(color: Colors.amber),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _loading
                  ? const CircularProgressIndicator(color: Colors.amber)
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                      ),
                      onPressed: _login,
                      child: Text(t['entrar'] ?? 'Entrar'),
                    ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(onLocaleChange: widget.onLocaleChange),
                    ),
                  );
                },
                child: Text(
                  t['cadastro'] ?? 'Cadastrar-se',
                  style: const TextStyle(color: Colors.amberAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
