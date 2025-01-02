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
    final height= MediaQuery.of(context).size.height;
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
              SizedBox(height: height * .5,),
              /// DropdownButton
              Row(
                children: [
                  DropdownButton(
                    focusColor: Colors.white,
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.white,
                      hint: Text(controller.originLanguage,style: const TextStyle(color: Colors.white),),
                      items: controller.languages.map((String dropDownStringItem){
                        return DropdownMenuItem(value: dropDownStringItem,child: Text(dropDownStringItem),);
                      }).toList(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      dropdownColor: Colors.white,
                    onChanged: (String? value) {
                      controller.originLanguage = value!;
                    },
                      ),
                  SizedBox(width: width * 0.4,),
                  const Icon(Icons.arrow_right_alt_rounded,color: Colors.white,),
                  DropdownButton(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(controller.destinationLanguage,style: const TextStyle(color: Colors.white),),
                    items: controller.languages.map((String dropDownStringItem){
                      return DropdownMenuItem(value: dropDownStringItem,child: Text(dropDownStringItem),);
                    }).toList(),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    dropdownColor: Colors.white,
                    onChanged: (String? value) {
                      controller.destinationLanguage = value!;
                    },
                  ),
                ],
              ),
              SizedBox(height: height * .5,),
              /// Textformfield or SearchBar
              Padding(
               padding: const EdgeInsets.all(8) ,
                child: TextFormField(
                    cursorColor: Colors.white,
                    autofocus: false,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Please enter yout text....',
                    labelStyle: TextStyle(fontSize: 15,color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 1)
                    ),
                    errorStyle: TextStyle(color: Colors.red,fontSize: 15)
                  ),
                  controller: controller.languageController,
                  validator: (value){
                      if(value == null){
                        return 'Please enter text to translate';
                      }
                      return null;
                  },
                ),
              ),
               /// Elevated button to translate it
            ],
          ),
        ),
      ),
    );
  }
}
