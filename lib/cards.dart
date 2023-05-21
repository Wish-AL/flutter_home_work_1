import 'package:flutter/material.dart';
import 'main.dart';
//import 'text_changer.dart';

class Cards extends StatelessWidget {
  final CardInfo cardInfo;
  final VoidCallback onTap;

  const Cards({
    Key? key,
    required this.cardInfo,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const blackColor1 = Color(0xCA000000);

    Widget titleSection = GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: const BoxDecoration(
            color: blackColor1,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(35),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        cardInfo.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Kandersteg, Switzerland',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.star,
                color: Colors.red[500],
              ),
              const Text(
                '41',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
    );

    return Stack(children: [
      Image.asset(
        cardInfo.imageUrl,
        width: 600, //MediaQuery.of(context).size.height,
        height: 250,
        fit: BoxFit.cover,
      ),
      ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 600,
          maxHeight: 250,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: blackColor1,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        '#${cardInfo.id}.',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Container(
                    width: 170,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color(0xAAFFFFFF),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
                        _buildButtonColumn(
                            Colors.green, Icons.near_me, 'ROUTE'),
                        _buildButtonColumn(Colors.black, Icons.share, 'SHARE'),
                      ],
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              titleSection,
            ],
          ),
        ),
      ),
    ]);
  }
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}

//IntrinsicHeight()
