import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // aktif hanya saat debug
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // WAJIB untuk DevicePreview
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Product layout demo home page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Listing")),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        children: const <Widget>[
          ProductBox(
            name: "iPhone",
            description: "iPhone is the stylist phone ever",
            price: 1000,
            image: "assets/laptop.jpg",
          ),
          ProductBox(
            name: "Pixel",
            description: "Pixel is the most featureful phone ever",
            price: 800,
            image: "assets/pixel.jpg",
          ),
          ProductBox(
            name: "Laptop",
            description: "Laptop is most productive development tool",
            price: 2000,
            image: "assets/iphone.jpg",
          ),
          ProductBox(
            name: "Tablet",
            description: "Tablet is the most useful device ever for meeting",
            price: 1500,
            image: null, // contoh null
          ),
          ProductBox(
            name: "Pendrive",
            description: "Pendrive is useful storage medium",
            price: 100,
            image: "assets/pendrive.jpg",
          ),
          ProductBox(
            name: "Floppy Drive",
            description: "Floppy drive is useful rescue storage medium",
            price: 20,
            image: null, // null lagi
          ),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    this.image,
  }) : super(key: key);

  final String name;
  final String description;
  final int price;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 120,
      child: Card(
        elevation: 3,
        child: Row(
          children: <Widget>[
            // HANDLE NULL IMAGE
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: image != null
                  ? Image.asset(
                      image!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.image_not_supported, size: 80),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(description),
                    const SizedBox(height: 5),
                    Text(
                      "Price: \$$price",
                      style: const TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 30),

            // TOMBOL GRADIENT
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Colors.indigo, Colors.blueAccent]),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ElevatedButton.icon(
                onPressed: _convert,
                icon: const Icon(Icons.bolt, color: Colors.white),
                label: const Text("KONVERSI SEKARANG", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),

            const SizedBox(height: 40),

            const Text("HASIL KONVERSI", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5)),
            const SizedBox(height: 10),
            
            // HASIL DENGAN ANIMASI
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
              ),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: const TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.w900, // FIX: Pakai w900
                  color: Colors.indigo,
                ),
                child: Text("${_result.toStringAsFixed(2)} $_outputUnit"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end, 
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Kurangi',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 15),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Tambah',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 15),
          FloatingActionButton(
            onPressed: _resetAngka,
            tooltip : 'Reset',
            child: const Icon(Icons.refresh)
          )
        ],
      ),
    );
  }

  Widget _unitPicker(String value, ValueChanged<String?> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(color: Colors.indigo[50], borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<String>(
        value: value,
        underline: const SizedBox(),
        items: ["Celsius", "Fahrenheit", "Kelvin", "Reamur"]
            .map((u) => DropdownMenuItem(value: u, child: Text(u))).toList(),
        onChanged: onChanged,
      ),
    );
  }
}