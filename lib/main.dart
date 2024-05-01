import 'package:flutter/material.dart';
import 'package:venue/screens/splash_screen.dart';


void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter is initialized before async operations

  // Load certificates

  // Now you can run your app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}
