import 'package:flutter/material.dart';
import '../services/language_loader.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<Map<String, String>> _history = [
    {
      "data": "10/11/2025",
      "previsao":
          "Mudanças sutis estão se aproximando, observe os sinais e confie no processo."
    },
    {
      "data": "05/11/2025",
      "previsao":
          "Uma oportunidade inesperada surgirá — esteja pronto para agir com calma e foco."
    },
    {
      "data": "01/11/2025",
      "previsao":
          "O equilíbrio emocional será a chave para o avanço em decisões importantes."
    },
  ];

  @override
  Widget build(BuildContext context) {
    final t = LanguageLoader.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(t['historico'] ?? 'Histórico de Análises'),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _history.length,
        itemBuilder: (context, index) {
          final item = _history[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.amber, width: 1.1),
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [Color(0xFF1C1C1E), Color(0xFF101010)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["data"]!,
                  style: const TextStyle(
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item["previsao"]!,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
