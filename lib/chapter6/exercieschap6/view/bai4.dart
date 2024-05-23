import 'package:final_project_chapter45678/chapter6/exercieschap6/widget/dialog.dart';
import 'package:flutter/material.dart';

class Bai4 extends StatefulWidget {
  const Bai4({super.key});

  @override
  State<StatefulWidget> createState() {
    return Bai4State();
  }
}
class Bai4State extends State<Bai4> {
  TextEditingController nController = TextEditingController();
  TextEditingController listController = TextEditingController();
  int minDeviation = 0;
  int index1 = 0;
  int index2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bai 4')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: nController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Nhập kích thước mảng',
                  labelText: 'Nhập n:',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: listController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Nhập mảng cách nhau bởi dấu (,)',
                  labelText: 'Nhập danh sách đường đi:',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Alert.showLoading(context);
                  // set 1 giây sau hiển thị kết quả
                  Future.delayed(const Duration(seconds: 1), () {
                    String result = bai4Function();
                    // ẩn loading
                    Navigator.of(context).pop();
                    // hiển thị kết quả
                    Alert.showStringResult(context, result);
                  });
                },
                child: const Text('Kết quả'),
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

  String bai4Function() {
      int n = int.tryParse(nController.text) ?? 0;
      List<int> deviations = listController.text.split(',').map(int.parse).toList();
      if (n >= 2) {
        minDeviation = deviations[0] - deviations[1];
        minDeviation = minDeviation.abs();
        for (int i = 0; i < deviations.length - 1; i++) {
          for (int j = i + 1; j < deviations.length; j++) {
            int deviation = (deviations[i] - deviations[j]).abs();
            if (deviation < minDeviation) {
              minDeviation = deviation;
              index1 = i;
              index2 = j;
            }
          }
        }
      }
      return 'Độ lệch của hai đoạn đường [$index1;$index2] có tình trạng giao thông giống nhau nhất : $minDeviation';
  }
}