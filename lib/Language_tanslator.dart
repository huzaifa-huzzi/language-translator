import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_translator/View_model/LanguageController.dart';

class LanguageTranslator extends StatefulWidget {
  const LanguageTranslator({super.key});

  @override
  State<LanguageTranslator> createState() => _LanguageTranslatorState();
}

class _LanguageTranslatorState extends State<LanguageTranslator> {
  final LanguageController controller = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff10223d),
      appBar: AppBar(
        title: const Text('Language Translator',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color(0xff10223d),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// DropdownButton
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => DropdownButton<String>(
                    value: controller.originLanguage.isNotEmpty
                        ? controller.originLanguage.value
                        : null,
                    items: controller.languages
                        .map((lang) => DropdownMenuItem(
                      value: lang,
                      child: Text(lang),
                    ))
                        .toList(),
                    onChanged: (String? value) {
                      controller.originLanguage.value = value!;
                    },
                    dropdownColor: Colors.white,
                    hint: const Text(
                      'From',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down,
                        color: Colors.white),
                  )),
                  SizedBox(width: width * 0.1),
                  const Icon(
                    Icons.arrow_right_alt_rounded,
                    color: Colors.white,
                  ),
                  Obx(() => DropdownButton<String>(
                    value: controller.destinationLanguage.isNotEmpty
                        ? controller.destinationLanguage.value
                        : null,
                    items: controller.languages
                        .map((lang) => DropdownMenuItem(
                      value: lang,
                      child: Text(lang),
                    ))
                        .toList(),
                    onChanged: (String? value) {
                      controller.destinationLanguage.value = value!;
                    },
                    dropdownColor: Colors.white,
                    hint: const Text(
                      'To',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down,
                        color: Colors.white),
                  )),
                ],
              ),
              SizedBox(height: height * 0.1),

              /// TextFormField
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Enter your text...',
                    labelStyle: TextStyle(fontSize: 15, color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  controller: controller.languageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter text to translate';
                    }
                    return null;
                  },
                ),
              ),

              /// ElevatedButton
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent),
                  onPressed: () {
                    controller.translatedLanguages();
                  },
                  child: const Text('Translate'),
                ),
              ),

              /// Output Text
              Obx(() => Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  controller.output.value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
