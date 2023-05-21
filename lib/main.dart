import 'package:flutter/material.dart';
import 'cards.dart';
import 'text_changer.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  //to convert Stateless to Stateful use Alt+Enter
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<CardInfo> _listOfCards = [];

  @override
  void initState() {
    generateCardInfo();
    super.initState();
  }

  void generateCardInfo() {
    for (int i = 0; i < 10; i++) {
      _listOfCards.add(CardInfo(
        title: 'Oeschinen Lake Campground',
        id: i,
      ));
    }
  }

  void updateCard(CardInfo newCardInfo) {
    setState(() {
      _listOfCards[newCardInfo.id] = newCardInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final List<int> items = List<int>.generate(20, (i) => i);

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView.builder(
          itemCount: _listOfCards.length, //items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(6),
              child: Cards(
                cardInfo: _listOfCards[index],
                onTap: () async {
                  final newCardInfo = await Navigator.push<CardInfo>(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TextChangePage(
                        cardInfo: _listOfCards[index],
                      ),
                    ),
                  );
                  //print('++++++++newCardInfo+++++++++++++++ = ${newCardInfo?.title}');
                  if (newCardInfo?.title != null) {
                    updateCard(newCardInfo!);
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class CardInfo {
  String title;
  final int id;
  final String imageUrl;

  CardInfo(
      {required this.title,
      required this.id,
      this.imageUrl = 'images/lake.jpg'});
}
