import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'converter_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool obscurePassword = true;

  Future signIn() async {

    setState(() {
      isLoading = true;
    });

    try {

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ConverterScreen(),
        ),
      );

    } on FirebaseAuthException catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message ?? "Login gagal",
          ),
        ),
      );

    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Icon(
                Icons.thermostat,
                size: 80,
                color: Colors.blue,
              ),

              const SizedBox(height: 20),

              const Text(
                "Konversi Suhu",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              TextField(
                controller: emailController,

                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: passwordController,
                obscureText: obscurePassword,

                decoration: InputDecoration(
                  labelText: "Password",
                  border: const OutlineInputBorder(),

                  prefixIcon: const Icon(Icons.lock),

                  suffixIcon: IconButton(
                    onPressed: () {

                      setState(() {
                        obscurePassword = !obscurePassword;
                      });

                    },
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  onPressed: isLoading ? null : signIn,

                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}