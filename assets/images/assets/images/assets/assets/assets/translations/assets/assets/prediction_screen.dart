import 'package:flutter/material.dart';
import '../services/language_loader.dart';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  String? _predictionResult;
  late AnimationController _controller;
  late Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);
    _pulse = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _generatePrediction() async {
    setState(() {
      _isLoading = true;
      _predictionResult = null;
    });

    await Future.delayed(const Duration(seconds: 3)); // Simulação de análise IA

    setState(() {
      _isLoading = false;
      _predictionResult =
          "O sistema detecta um potencial positivo nas próximas interações.";
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = LanguageLoader.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(t['nova_previsao'] ?? 'Nova Previsão'),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _pulse,
              child: const Icon(Icons.auto_awesome, color: Colors.amber, size: 90),
            ),
            const SizedBox(height: 40),
            _isLoading
                ? const CircularProgressIndicator(color: Colors.amber)
                : ElevatedButton.icon(
                    onPressed: _generatePrediction,
                    icon: const Icon(Icons.psychology, color: Colors.black),
                    label: Text(
                      t['nova_previsao'] ?? 'Nova Previsão',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 22),
                    ),
                  ),
            const SizedBox(height: 40),
            if (_predictionResult != null)
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber, width: 1.2),
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1C1C1E), Color(0xFF101010)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Text(
                  _predictionResult!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
