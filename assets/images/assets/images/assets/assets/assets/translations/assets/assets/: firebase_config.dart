import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class FirebaseConfig {
  static Future<void> initializeFirebase() async {
    try {
      if (kIsWeb) {
        // Configuração para Web
        await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "SUA_API_KEY",
            authDomain: "SEU_PROJETO.firebaseapp.com",
            projectId: "SEU_PROJETO",
            storageBucket: "SEU_PROJETO.appspot.com",
            messagingSenderId: "SEU_SENDER_ID",
            appId: "SUA_APP_ID",
          ),
        );
      } else {
        // Configuração para Android / iOS
        await Firebase.initializeApp();
      }

      debugPrint("✅ Firebase inicializado com sucesso");
    } catch (e) {
      debugPrint("❌ Erro ao inicializar o Firebase: $e");
      rethrow;
    }
  }
}
