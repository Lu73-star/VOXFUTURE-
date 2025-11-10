import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'utils/language_loader.dart';
import 'screens/home_screen.dart';
import 'services/auth_gate_v2.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const VoxFutureApp());
}

class VoxFutureApp extends StatefulWidget {
  const VoxFutureApp({Key? key}) : super(key: key);

  @override
  State<VoxFutureApp> createState() => _VoxFutureAppState();
}

class _VoxFutureAppState extends State<VoxFutureApp> {
  Locale _locale = const Locale('pt', 'BR');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VoxFuture',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFFFFA0E2),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFFFA0E2),
        ),
      ),
      locale: _locale,
      supportedLocales: LanguageLoader.supportedLocales,
      localizationsDelegates: const [
        LanguageLoader.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      home: const AuthGateV2(), // Autenticação Firebase
    );
  }
}
