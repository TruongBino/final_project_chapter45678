import 'package:final_project_chapter45678/chapter6/exercieschap6/widget/dialog.dart';
import 'package:flutter/material.dart';
class Bai8 extends StatefulWidget {
  const Bai8({super.key});

  @override
  State<StatefulWidget> createState() {
    return Bai8State();
  }
}
class Bai8State extends State<Bai8> {
  TextEditingController xyController = TextEditingController();
  TextEditingController hmController = TextEditingController();
  TextEditingController abcController = TextEditingController();
  double kq = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Bai 8')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: xyController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Nhập số điện X Y (cách nhau bởi dấu cách)',
                    labelText: 'Nhập X Y :',
                  ),
                ),
                TextFormField(
                  controller: hmController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Nhập số điện H M (cách nhau bởi dấu cách)',
                    labelText: 'Nhập H M :',
                  ),
                ),
                TextFormField(
                  controller: abcController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Nhập số điện A B C (cách nhau bởi dấu cách)',
                    labelText: 'Nhập A B C :',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Alert.showLoading(context);
                    // set 1 giây sau hiển thị kết quả
                    Future.delayed(const Duration(seconds: 1), () {
                      double result = bai8Function();
                      // ẩn loading
                      Navigator.of(context).pop();
                      // hiển thị kết quả
                      Alert.showDoubleResult(context, result);
                    });
                  },
                  child:  const Text("Kết quả"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Go Back'),
                ),
              ],
            ),
          ),
        ),
    );
  }

  double bai8Function() {
      List<List<int>> xy = [];
      List<List<int>> hm = [];
      List<List<int>> abc = [];

      List<String> lines1 = xyController.text.split('\n');
      for (String line in lines1) {
        List<int> values = line.split(' ')
            .map((str) => int.parse(str))
            .toList();
        xy.add(values);
      }

      List<String> lines2 = hmController.text.split('\n');
      for (String line in lines2) {
        List<int> values = line.split(' ')
            .map((str) => int.parse(str))
            .toList();
        hm.add(values);
      }

      List<String> lines3 = abcController.text.split('\n');
      for (String line in lines3) {
        List<int> values = line.split(' ')
            .map((str) => int.parse(str))
            .toList();
        abc.add(values);
      }
      double rs = 0;
      int n = 3; // số loại điện trong thanh toán

      for (int i = 0; i < n; i++) {
        rs += tinhTien(
            xy[i][0],
            xy[i][1],
            abc[i][0],
            abc[i][1],
            abc[i][2],
            hm[i][0],
            hm[i][1]);
      }
        kq = rs;
      return rs;
  }

  double tinhTien(x, y, a, b, c, hm1, hm2) {
    int z = y - x;
    double kq = 0;
    if (z <= hm1) {
      kq = a * z;
    } else if (z > hm1 && z <= hm2) {
      kq = kq + a * hm1 + b * (z - hm1);
    } else {
      kq = kq + a * hm1 + b * (hm2 - hm1) + c * (z - hm2);
    }
    return kq;
  }
}