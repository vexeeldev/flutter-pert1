import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../providers/temperature_provider.dart';
import '../widgets/input_section.dart';
import 'login_page.dart';

class ConverterScreen extends StatelessWidget {
  ConverterScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TemperatureProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Konversi Suhu"),
        centerTitle: true,

        actions: [

          IconButton(
            onPressed: () async {

              await FirebaseAuth.instance.signOut();

              if (!context.mounted) return;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginPage(),
                ),
              );
            },
            icon: const Icon(Icons.logout),
          ),

        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            InputSection(controller: controller),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {

                if (controller.text.isNotEmpty) {

                  provider.convertCtoF(
                    double.parse(controller.text),
                  );

                }
              },
              child: const Text("Celsius → Fahrenheit"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {

                if (controller.text.isNotEmpty) {

                  provider.convertFtoC(
                    double.parse(controller.text),
                  );

                }
              },
              child: const Text("Fahrenheit → Celsius"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {

                provider.reset();
                controller.clear();

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text("Reset"),
            ),

            const SizedBox(height: 30),

            Text(
              "Hasil: ${provider.result.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
    );
  }
}