import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_translator/Language_tanslator.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Language translator',
      debugShowCheckedModeBanner: false,
      home: LanguageTranslator(),
    );
  }
}

