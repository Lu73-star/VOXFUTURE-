import 'package:flutter/material.dart';
import '../utils/language_loader.dart';

class HomeScreen extends StatelessWidget {
  final Function(Locale) onLocaleChange;

  const HomeScreen({Key? key, required this.onLocaleChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = LanguageLoader.of(context)?.translations ?? {};

    return Scaffold(
      appBar: AppBar(
        title: Text(t['bem_vindo'] ?? 'VoxFuture'),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF0A0E21),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                t['bem_vindo'] ?? 'Bem-vindo ao VoxFuture',
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                child: Text(t['entrar'] ?? 'Entrar'),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                child: Text(t['cadastro'] ?? 'Cadastrar-se'),
              ),
              const SizedBox(height: 40),
              DropdownButton<Locale>(
                value: const Locale('pt', 'BR'),
                iconEnabledColor: Colors.white,
                dropdownColor: Colors.black87,
                style: const TextStyle(color: Colors.white),
                items: const [
                  DropdownMenuItem(
                    value: Locale('pt', 'BR'),
                    child: Text('🇧🇷 Português'),
                  ),
                  DropdownMenuItem(
                    value: Locale('en', 'US'),
                    child: Text('🇺🇸 English'),
                  ),
                  DropdownMenuItem(
                    value: Locale('es', 'ES'),
                    child: Text('🇪🇸 Español'),
                  ),
                  DropdownMenuItem(
                    value: Locale('fr', 'FR'),
                    child: Text('🇫🇷 Français'),
                  ),
                  DropdownMenuItem(
                    value: Locale('de', 'DE'),
                    child: Text('🇩🇪 Deutsch'),
                  ),
                ],
                onChanged: (Locale? newLocale) {
                  if (newLocale != null) onLocaleChange(newLocale);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
