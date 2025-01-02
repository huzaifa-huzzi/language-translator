import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LanguageController extends  GetxController {

   var originLanguage = 'From';
  var destinationLanguage = 'To';
  final List<String> languages = ['Urdi','English','Hindi'];
  final languageController = TextEditingController();

}