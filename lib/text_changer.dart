import 'package:flutter/material.dart';

class TextChangePage extends StatefulWidget {
  const TextChangePage({Key? key}) : super(key: key);

  @override
  State<TextChangePage> createState() => _TextChangePageState();
}

class _TextChangePageState extends State<TextChangePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter layout demo'),
      ),
      body: SafeArea(child: Placeholder()),
    );
  }
}


// WillPopScope(
// onWillPop: () async {
// return false;
// },