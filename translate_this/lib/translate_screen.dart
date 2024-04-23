import 'package:flutter/material.dart';
import 'package:translate_this/api.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {

  String currentTranslation = "";

  final TextEditingController toTranslateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
      children: [
        const Text("¿Que quieres traducir?"),
        TextField(controller: toTranslateController,
        ),
        ElevatedButton(
          onPressed: () {
            getTranslation();
          }, 
          child: const Text("Traducir"),
          ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
          ),
          child: Text(currentTranslation),
          ),
      ],
      ),
    );
    
  }

  void getTranslation() {

    var textToTranslate = toTranslateController.text;

    var translation = ApiClient().translate(textToTranslate);
    
    setState(() {
      currentTranslation = translation;
    });
  }
}


