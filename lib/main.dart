import 'package:flutter/material.dart';
import 'cards.dart';

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
    for (int i = 0; i > 10; i++) {
      _listOfCards.add(CardInfo(
        title: 'title $i',
        numberCard: i,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    //final List<int> items = List<int>.generate(20, (i) => i);

    //Color color = Theme.of(context).primaryColor;
    // Widget textSection = const Padding(
    //   padding: EdgeInsets.all(32),
    //   child: Text(
    //     'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    //     'Alps. Situated 1,578 meters above sea level, it is one of the '
    //     'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    //     'half-hour walk through pastures and pine forest, leads you to the '
    //     'lake, which warms to 20 degrees Celsius in the summer. Activities '
    //     'enjoyed here include rowing, and riding the summer toboggan run.',
    //     softWrap: true,
    //   ),
    // );

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
              ),
            );
          },
        ),
      ),
    );
  }
}

class CardInfo {
  final String title;
  final int numberCard;
  final String imageUrl;

  CardInfo(
      {required this.title,
        required this.numberCard,
        this.imageUrl = 'images/lake.jpg'});
}

