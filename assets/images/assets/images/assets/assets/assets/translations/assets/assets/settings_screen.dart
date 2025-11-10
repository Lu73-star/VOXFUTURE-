import 'package:flutter/material.dart';
import '../services/language_loader.dart';
import 'subscription_screen.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  const SettingsScreen({super.key, required this.onLocaleChange});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkTheme = true;

  @override
  Widget build(BuildContext context) {
    final t = LanguageLoader.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(t['configuracoes'] ?? 'Configurações'),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t['idioma'] ?? 'Idioma',
              style: const TextStyle(
                color: Colors.amberAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            DropdownButton<Locale>(
              dropdownColor: Colors.black,
              value: const Locale('pt', 'BR'),
              iconEnabledColor: Colors.amberAccent,
              onChanged: (Locale? newLocale) {
                if (newLocale != null) {
                  widget.onLocaleChange(newLocale);
                }
              },
              items: const [
                DropdownMenuItem(
                  value: Locale('pt', 'BR'),
                  child: Text('🇧🇷 Português', style: TextStyle(color: Colors.white)),
                ),
                DropdownMenuItem(
                  value: Locale('en', 'US'),
                  child: Text('🇺🇸 English', style: TextStyle(color: Colors.white)),
                ),
                DropdownMenuItem(
                  value: Locale('es', 'ES'),
                  child: Text('🇪🇸 Español', style: TextStyle(color: Colors.white)),
                ),
                DropdownMenuItem(
                  value: Locale('fr', 'FR'),
                  child: Text('🇫🇷 Français', style: TextStyle(color: Colors.white)),
                ),
                DropdownMenuItem(
                  value: Locale('de', 'DE'),
                  child: Text('🇩🇪 Deutsch', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t['tema'] ?? 'Tema',
                  style: const TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Switch(
                  value: _isDarkTheme,
                  onChanged: (value) {
                    setState(() {
                      _isDarkTheme = value;
                    });
                  },
                  activeColor: Colors.amberAccent,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
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
                    MaterialPageRoute(builder: (context) => const SubscriptionScreen()),
                  );
                },
                icon: const Icon(Icons.workspace_premium_outlined),
                label: Text(t['assinatura'] ?? 'Assinatura'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
