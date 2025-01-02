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
      backgroundColor: Color(0xff10223d),
      appBar: AppBar(
        title: Text('Language Translator'),
        centerTitle: true,
        backgroundColor: Color(0xff10223d),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * .5,),
              Row(
                children: [
                  DropdownButton(
                    focusColor: Colors.white,
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.white,
                      hint: Text(controller.originLanguage,style: TextStyle(color: Colors.white),),
                      items: controller.languages.map((String dropDownStringItem){
                        return DropdownMenuItem(child: Text(dropDownStringItem),value: dropDownStringItem,);
                      }).toList(),
                      icon: Icon(Icons.keyboard_arrow_down),
                      dropdownColor: Colors.white,
                    onChanged: (String? value) {
                      controller.originLanguage = value!;
                    },
                      ),
                  SizedBox(width: width * 0.4,),
                  Icon(Icons.arrow_right_alt_rounded,color: Colors.white,),
                  DropdownButton(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(controller.destinationLanguage,style: TextStyle(color: Colors.white),),
                    items: controller.languages.map((String dropDownStringItem){
                      return DropdownMenuItem(child: Text(dropDownStringItem),value: dropDownStringItem,);
                    }).toList(),
                    icon: Icon(Icons.keyboard_arrow_down),
                    dropdownColor: Colors.white,
                    onChanged: (String? value) {
                      controller.destinationLanguage = value!;
                    },
                  ),
                ],
              ),
              SizedBox(height: height * .5,),

            ],
          ),
        ),
      ),
    );
  }
}
