import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/language_loader.dart';
import 'login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const ForgotPasswordScreen({super.key, required this.onLocaleChange});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  bool _loading = false;

  Future<void> _resetPassword() async {
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, insira seu e-mail')),
      );
      return;
    }

    setState(() => _loading = true);
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('E-mail de redefinição enviado!')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(onLocaleChange: widget.onLocaleChange),
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Erro ao enviar e-mail')),
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
      appBar: AppBar(
        title: Text(t['esqueceu_senha'] ?? 'Esqueceu sua senha?'),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Icon(Icons.lock_reset, size: 70, color: Colors.amber),
                const SizedBox(height: 30),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
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
                const SizedBox(height: 30),
                _loading
                    ? const CircularProgressIndicator(color: Colors.amber)
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
                        ),
                        onPressed: _resetPassword,
                        child: Text(t['esqueceu_senha'] ?? 'Redefinir senha'),
                      ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(onLocaleChange: widget.onLocaleChange),
                      ),
                    );
                  },
                  child: Text(
                    t['entrar'] ?? 'Entrar',
                    style: const TextStyle(color: Colors.amberAccent),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
