import 'package:flutter/material.dart';
import 'utils/language_loader.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
      ),
      locale: _locale,
      supportedLocales: LanguageLoader.supportedLocales,
      localizationsDelegates: const [
        LanguageLoader.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      home: HomeScreen(onLocaleChange: setLocale),
    );
  }
}
