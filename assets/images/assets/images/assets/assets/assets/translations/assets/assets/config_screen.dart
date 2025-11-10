import 'package:flutter/material.dart';
import '../utils/language_loader.dart';

class ConfigScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  const ConfigScreen({Key? key, required this.onLocaleChange}) : super(key: key);

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  Locale _selectedLocale = const Locale('pt', 'BR');
  bool _isDarkTheme = true;

  @override
  Widget build(BuildContext context) {
    final t = LanguageLoader.of(context)?.translations ?? {};

    return Scaffold(
      appBar: AppBar(
        title: Text(t['configuracoes'] ?? 'Configurações'),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      backgroundColor: _isDarkTheme ? const Color(0xFF0A0E21) : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t['idioma'] ?? 'Idioma',
              style: TextStyle(
                color: _isDarkTheme ? Colors.amber : Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            DropdownButton<Locale>(
              value: _selectedLocale,
              dropdownColor: _isDarkTheme ? Colors.black87 : Colors.white,
              style: TextStyle(
                color: _isDarkTheme ? Colors.white : Colors.black,
              ),
              iconEnabledColor: _isDarkTheme ? Colors.white : Colors.black,
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
                if (newLocale != null) {
                  setState(() => _selectedLocale = newLocale);
                  widget.onLocaleChange(newLocale);
                }
              },
            ),
            const SizedBox(height: 40),
            Text(
              t['tema'] ?? 'Tema',
              style: TextStyle(
                color: _isDarkTheme ? Colors.amber : Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SwitchListTile(
              title: Text(
                _isDarkTheme ? "Modo Escuro" : "Modo Claro",
                style: TextStyle(
                  color: _isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
              value: _isDarkTheme,
              onChanged: (bool value) {
                setState(() {
                  _isDarkTheme = value;
                });
              },
              activeColor: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
