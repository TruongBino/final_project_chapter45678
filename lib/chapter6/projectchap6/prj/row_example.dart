import 'package:flutter/material.dart';

void main() {
  runApp(const RowWidgetExample());
}

class  RowWidgetExample extends StatelessWidget {
  const  RowWidgetExample({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.green,
          child: Row(
            //   children: <Widget>[
            //     Container(color: Colors.red, height: 50, width: 50),
            //     ElevatedButton(
            //       onPressed: () {},
            //       child: Text('Button'),
            //     ),
            //     Icon(Icons.favorite, color: Colors.pink),
            //   ],
            //Test textBaseline
            // crossAxisAlignment: CrossAxisAlignment.baseline,
            //   textBaseline: TextBaseline.ideographic,
            // children: <Widget>[
            //   Text('Text 1', style: TextStyle(fontSize: 20)),
            //   Text('Text 2', style: TextStyle(fontSize: 30)),
            //   Text('Text 3', style: TextStyle(fontSize: 40)),
            // ],
            //textDirection: TextDirection.rtl,
            mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.end,
            verticalDirection: VerticalDirection.down,
            children: [
              ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      foregroundColor: Colors.cyanAccent
                  ),
                  child: const Text(
                    'data1',
                    style:  TextStyle(fontSize: 20),
                  )
              ),
              Container(
                height: 100,
                child: ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        foregroundColor: Colors.cyanAccent
                    ),
                    child: const Text(
                      'data2',
                      style:  TextStyle(fontSize: 20),
                    )
                ),
              ),
              ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      foregroundColor: Colors.cyanAccent
                  ),
                  child: const Text(
                    'data3',
                    style:  TextStyle(fontSize: 20),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
