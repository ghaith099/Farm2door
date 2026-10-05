// ignore_for_file: unused_import

import 'package:farm2door/Cards/grociecry_cards.dart';
import 'package:farm2door/Screens/home.dart';
import 'package:farm2door/Screens/login_screen.dart';
import 'package:farm2door/Screens/product.dart';
import 'package:farm2door/sandbox.dart';
import 'package:farm2door/shared/slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textTheme: GoogleFonts.outfitTextTheme(),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF2E7D32),
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: const Color(0xFFF5F7F1),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFF5F7F1),
        foregroundColor: Color(0xFF1B1B1B),
        elevation: 0,
        centerTitle: false,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        indicatorColor: Color(0xFFC8E6C9),
        labelTextStyle: MaterialStatePropertyAll(
          TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    ),
    home: const LoginScreen(),
  ));
}
