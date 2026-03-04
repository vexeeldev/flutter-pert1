import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // Perbaikan: Tambahkan 'ColorScheme' sebelum '.fromSeed'
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Plus Minus'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // Fungsi Tambah
  void _incrementCounter() {
    setState(() {
      _counter++; // Menggunakan ++ untuk tambah
    });
  }

  // Fungsi Kurang (Baru)
  void _decrementCounter() {
    setState(() {
      _counter--; // Menggunakan -- untuk kurang
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Nilai counter sekarang:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      // --- PERBEDAAN UTAMA DI SINI ---
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end, // Agar tombol di kanan
        children: [
          // Tombol Minus Baru
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Kurangi',
            child: const Icon(Icons.remove),
          ),
          
          const SizedBox(width: 15), // Jarak antara dua tombol
          
          // Tombol Plus (Sama seperti tadi)
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Tambah',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}