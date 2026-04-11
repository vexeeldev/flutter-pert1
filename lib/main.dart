import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: const <Widget>[
          ProductBox(
            name: "iPhone",
            description: "iPhone is the stylist phone ever",
            price: 1000,
            image: "laptop.jpg",
          ),
          ProductBox(
            name: "Pixel",
            description: "Pixel is the most featureful phone ever",
            price: 800,
            image: "pixel.jpg",
          ),
          ProductBox(
            name: "Laptop",
            description: "Laptop is most productive development tool",
            price: 2000,
            image: "iphone.jpg",
          ),
          ProductBox(
            name: "Tablet",
            description: "Tablet is the most useful device ever for meeting",
            price: 1500,
            image: "tablet.jpg", // <-- ini contoh null
          ),
          ProductBox(
            name: "Pendrive",
            description: "Pendrive is useful storage medium",
            price: 100,
            image: "pendrive.jpg",
          ),
          ProductBox(
            name: "Floppy Drive",
            description: "Floppy drive is useful rescue storage medium",
            price: 20,
            image: "floppy.jpg", // <-- null lagi, hidup bebas
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
    this.image, // nullable
  }) : super(key: key);

  final String name;
  final String description;
  final int price;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // HANDLE NULL DI SINI
            image != null
                ? Image.asset(image!)
                : const Icon(Icons.image_not_supported, size: 50),

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(description),
                    Text("Price: $price"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}