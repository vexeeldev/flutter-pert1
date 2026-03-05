import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false, // ini buat biar pita debug di kanan hilan
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
        home: const SuhuModern(),// halaman pertaman yang bakal dibuka yaitu suhumodresn()
      );
}

class SuhuModern extends StatefulWidget {
  const SuhuModern({super.key});
  @override
  State<SuhuModern> createState() => _SuhuModernState();
}

class _SuhuModernState extends State<SuhuModern> {
  final TextEditingController _controller = TextEditingController();
  String _inputUnit = "Celsius";
  String _outputUnit = "Fahrenheit";
  double _result = 0;

  void _convert() {
    double input = double.tryParse(_controller.text) ?? 0;
    double tempInC;
    
    if (_inputUnit == "Fahrenheit") tempInC = (input - 32) * 5 / 9;
    else if (_inputUnit == "Kelvin") tempInC = input - 273.15;
    else if (_inputUnit == "Reamur") tempInC = input * 5 / 4;
    else tempInC = input;

    setState(() {
      if (_outputUnit == "Fahrenheit") _result = (tempInC * 9 / 5) + 32;
      else if (_outputUnit == "Kelvin") _result = tempInC + 273.15;
      else if (_outputUnit == "Reamur") _result = tempInC * 4 / 5;
      else _result = tempInC;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Suhu Converter", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        hintText: "0.0",
                        labelText: "Masukkan Nilai",
                        prefixIcon: const Icon(Icons.thermostat),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _unitPicker(_inputUnit, (v) => setState(() => _inputUnit = v!)),
                        const Icon(Icons.swap_horiz, color: Colors.indigo, size: 30),
                        _unitPicker(_outputUnit, (v) => setState(() => _outputUnit = v!)),
                      ],
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