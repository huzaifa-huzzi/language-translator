import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class LanguageController extends GetxController {
  var originLanguage = ''.obs; // Initially empty
  var destinationLanguage = ''.obs; // Initially empty
  final List<String> languages = ['Urdu', 'English', 'Hindi'];
  final languageController = TextEditingController();
  var output = ''.obs;

  void translatedLanguages() async {
    if (originLanguage.isEmpty || destinationLanguage.isEmpty) {
      Get.snackbar('Error', 'Please select both languages before translating.');
      return;
    }

    try {
      GoogleTranslator translator = GoogleTranslator();
      String src = getLanguageCode(originLanguage.value);
      String dest = getLanguageCode(destinationLanguage.value);
      var translation = await translator.translate(languageController.text,
          from: src, to: dest);

      output.value = translation.text;
    } catch (e) {
      Get.snackbar('Error', 'Translation failed: $e');
    }
  }

  String getLanguageCode(String language) {
    if (language == 'Urdu') {
      return 'ur';
    } else if (language == 'English') {
      return 'en';
    } else if (language == 'Hindi') {
      return 'hi';
    }
    return '';
  }
}
