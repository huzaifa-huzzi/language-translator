import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class LanguageController extends GetxController {
  var originLanguage = 'From'.obs;
  var destinationLanguage = 'To'.obs;
  final List<String> languages = ['Urdu', 'English', 'Hindi'];
  final languageController = TextEditingController();
  var output = ''.obs;

  void translateLanguages() async {
    if (originLanguage.value == 'From' || destinationLanguage.value == 'To') {
      Get.snackbar('Error', 'Please select both languages');
      return;
    }

    if (languageController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter text to translate');
      return;
    }

    try {
      GoogleTranslator translator = GoogleTranslator();
      var srcCode = getLanguageCode(originLanguage.value);
      var destCode = getLanguageCode(destinationLanguage.value);
      var translation = await translator.translate(
        languageController.text.trim(),
        from: srcCode,
        to: destCode,
      );
      output.value = translation.text;
    } catch (e) {
      Get.snackbar('Error', 'Translation failed. Please try again.');
    }
  }

  String getLanguageCode(String language) {
    switch (language) {
      case 'Urdu':
        return 'ur';
      case 'English':
        return 'en';
      case 'Hindi':
        return 'hi';
      default:
        return '--';
    }
  }
}
