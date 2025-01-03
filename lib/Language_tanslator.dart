import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_translator/View_model/LanguageController.dart';

class LanguageTranslator extends StatelessWidget {
  final LanguageController controller = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff10223d),
      appBar: AppBar(
        title: const Text('Language Translator'),
        centerTitle: true,
        backgroundColor: const Color(0xff10223d),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.1),
              /// Dropdown for selecting languages
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    value: controller.originLanguage.value,
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
                    hint: Obx(() => Text(
                      controller.originLanguage.value,
                      style: const TextStyle(color: Colors.white),
                    )),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconEnabledColor: Colors.white,
                  ),
                  SizedBox(width: width * 0.1),
                  const Icon(Icons.arrow_right_alt_rounded, color: Colors.white),
                  DropdownButton(
                    value: controller.destinationLanguage.value,
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
                    hint: Obx(() => Text(
                      controller.destinationLanguage.value,
                      style: const TextStyle(color: Colors.white),
                    )),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconEnabledColor: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: height * 0.1),
              /// TextFormField for input text
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Enter text to translate...',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  controller: controller.languageController,
                ),
              ),
              /// Translate Button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => controller.translateLanguages(),
                  child: const Text('Translate'),
                ),
              ),
              /// Output Translation Result
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(() => Text(
                  controller.output.value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
