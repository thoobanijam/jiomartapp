import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'pages/opening_page.dart';
import 'cart_page.dart';
import 'orders_page.dart';
import 'pages/jiomart_dashboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const JioMartApp());
}

class JioMartApp extends StatelessWidget {
  const JioMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JioMart',
      home: const OpeningPage(),
        routes: {
      '/home': (context) => const JioMartDashboard(),
      '/cart': (context) => const CartPage(),
      '/orders': (context) => const OrdersPage(),
    },
    );
  }
}