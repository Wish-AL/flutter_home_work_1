import 'package:flutter/material.dart';
import 'main.dart';

class TextChangePage extends StatefulWidget {
  final CardInfo cardInfo;

  const TextChangePage({Key? key, required this.cardInfo}) : super(key: key);

  @override
  State<TextChangePage> createState() => _TextChangePageState();
}

class _TextChangePageState extends State<TextChangePage> {
  late TextEditingController controller;
  late CardInfo cardInfo2;

  @override
  void initState() {

    cardInfo2 = CardInfo(
      title: widget.cardInfo.title,
      id: widget.cardInfo.id,
      imageUrl: widget.cardInfo.imageUrl,
    );

    initController();
    super.initState();
  }
  void initController(){
    controller = TextEditingController(text: cardInfo2.title);
  }
  void saveText(){
    cardInfo2.title = controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter layout demo'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                widget.cardInfo.imageUrl,
                width: 600, //MediaQuery.of(context).size.height,
                height: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 32),
              TextField(
                controller: controller,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  saveText();
                  //print('cardInfo2 = ${cardInfo2.title}');
                  Navigator.of(context).pop(cardInfo2);
                },
                child: const Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// WillPopScope(
// onWillPop: () async {
// return false;
// },
