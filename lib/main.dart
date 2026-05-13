import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/temperature_provider.dart';
import 'screens/converter_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TemperatureProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Konversi Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConverterScreen(),
    );
  }
}