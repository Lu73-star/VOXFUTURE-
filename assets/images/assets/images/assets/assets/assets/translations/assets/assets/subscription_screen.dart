import 'package:flutter/material.dart';
import '../services/language_loader.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = LanguageLoader.of(context);

    final plans = [
      {
        "nome": "Explorar (Free)",
        "valor": "R\$ 0 / mês",
        "descricao": "5 previsões/mês, gráficos simples.",
      },
      {
        "nome": "Orion Pro",
        "valor": "R\$ 49,90 / mês",
        "descricao": "50 previsões/mês, gráficos avançados e relatórios.",
      },
      {
        "nome": "Orion Master",
        "valor": "R\$ 139,90 / mês",
        "descricao": "200 previsões/mês, até 3 usuários e relatórios completos.",
      },
      {
        "nome": "Orion Ultra",
        "valor": "R\$ 289,90 / mês",
        "descricao": "Previsões ilimitadas, até 10 usuários e todos os recursos.",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(t['assinatura'] ?? 'Assinatura'),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: plans.length,
        itemBuilder: (context, index) {
          final plan = plans[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.amberAccent),
              borderRadius: BorderRadius.circular(14),
              gradient: const LinearGradient(
                colors: [Color(0xFF1E1E1E), Color(0xFF0D0D0D)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plan["nome"]!,
                    style: const TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    plan["valor"]!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    plan["descricao"]!,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {},
                      child: Text(
                        t['assinar'] ?? 'Assinar',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
