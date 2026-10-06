import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../footer.dart';

import 'login_page.dart';
import 'jiomart_dashboard.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  @override
  void initState() {
    super.initState();

    checkUser();
  }

  Future<void> checkUser() async {
    // Show opening page for 1 second
    await Future.delayed(const Duration(seconds: 8));

    if (!mounted) return;

    // Check Firebase login
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Existing user
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const JioMartDashboard(),
        ),
      );
    } else {
      // New user / no logged-in user
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'JioMart',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'JioMart App is opening!!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'Please wait',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 25),

              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}