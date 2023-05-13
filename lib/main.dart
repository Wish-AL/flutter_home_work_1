import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> items = List<int>.generate(20, (i) => i);
    const blackColor1 = Color(0xCA000000);

    Widget titleSection = Container(
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
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
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
    );

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
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(6),
              child: Stack(children: [
                Image.asset(
                  'images/lake.jpg',
                  width: 600,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 600,
                    maxHeight: 250,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 16, right: 16, bottom: 0),
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
                                  '#${items[index]}.',
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
                              width: 180,
                              height: 60,
                              decoration: const BoxDecoration(
                                color: Color(0xAAFFFFFF),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildButtonColumn(
                                      Colors.blue, Icons.call, 'CALL'),
                                  _buildButtonColumn(
                                      Colors.green, Icons.near_me, 'ROUTE'),
                                  _buildButtonColumn(
                                      Colors.black, Icons.share, 'SHARE'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 64.0,
                        ),
                        titleSection,
                      ],
                    ),
                  ),
                ),
              ]),
            );
          },
        ),
      ),
    );
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
}
