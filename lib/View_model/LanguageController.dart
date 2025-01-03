import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';



class LanguageController extends  GetxController {

   var originLanguage = 'From';
  var destinationLanguage = 'To';
  final List<String> languages = ['Urdu','English','Hindi'];
  final languageController = TextEditingController();
  var output = ''.obs;

  void translatedLanguages(String src,String dest,String input)async{
     GoogleTranslator translator = GoogleTranslator();
      var translation = await translator.translate(input,from: src,to: dest);

      output.value = translation.text.toString();

      if(src=='--' || dest=='--'){
        Get.snackbar('Error', 'It is not able to translate');
      }
  }

  String getLanguageCode(String languages){
    if(languages == 'Urdu'){
      return "ur";
    } else if(languages == 'English'){
      return "en";
    } else if(languages == 'Hindi'){
      return "hi";
    }
    return '--';
  }

}