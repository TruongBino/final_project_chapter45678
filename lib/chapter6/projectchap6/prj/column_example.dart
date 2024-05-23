import 'package:flutter/material.dart';

void main() {
  runApp( const ColumnWidgetExample());
}

class ColumnWidgetExample extends StatelessWidget {
  const ColumnWidgetExample({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.green,
          child: Column(
            //Test textBaseline
            // crossAxisAlignment: CrossAxisAlignment.baseline,
            //   textBaseline: TextBaseline.ideographic,
            // children: <Widget>[
            //   Text('Text 1', style: TextStyle(fontSize: 20)),
            //   Text('Text 2', style: TextStyle(fontSize: 30)),
            //   Text('Text 3', style: TextStyle(fontSize: 40)),
            // ],
            textDirection: TextDirection.rtl,
            mainAxisSize: MainAxisSize.min, // kích thước của nội dung bên trong
            mainAxisAlignment: MainAxisAlignment.end, // căn chỉnh vị trí các widget con bên trong
            // crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
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
