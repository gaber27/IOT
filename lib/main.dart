import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:soft/const/colors.dart';
import 'package:soft/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: HexColor("5D0A84"),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
          primary:primaryColor,
        ),
      backgroundColor: HexColor("5D0A84"),
      ),
      home: SplashScreen()
    );
  }
}

