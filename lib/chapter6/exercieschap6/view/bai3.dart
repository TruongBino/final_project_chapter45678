import 'package:final_project_chapter45678/chapter6/exercieschap6/widget/dialog.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Bai3 extends StatefulWidget {
  const Bai3({Key? key}) : super(key: key);

  @override
  State<Bai3> createState() => Bai3State();
}

class Bai3State extends State<Bai3> {
  TextEditingController listController = TextEditingController();
  bool isLoading = false;
  int X = 0;
  int result = 0;
  int fibonacciResult = 0;
  bool showNoSecondLargest = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bai 3')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: listController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Nhập mảng cách nhau bởi dấu (,)',
                  labelText: 'Nhập mảng:',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Alert.showLoading(context);
                  // set 1 giây sau hiển thị kết quả
                  Future.delayed(const Duration(seconds: 1), () {
                    String result = bai3Function();
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

  String bai3Function() {
    List<int> n = listController.text.split(',').map(int.parse).toList();
    List<int> distinctList = n.toSet().toList();

    if (n.length <= 1 || distinctList.length <= 1) {
      setState(() {
        showNoSecondLargest = true;
      });
      return 'Không có phần tử lớn thứ hai';
    } else {
      distinctList.sort((a, b) => b.compareTo(a));
      X = distinctList[1];
      // tim giai thua
      result = 1;
      for (int i = 1; i <= X; i++) {
        result *= i;
      }
      // tim fibonacci
      int a = 0,
          b = 1;
      fibonacciResult = X <= 1 ? X : 0;
      for (int i = 2; i <= X; i++) {
        fibonacciResult = a + b;
        a = b;
        b = fibonacciResult;
      }
      return 'Số lớn nhì : $X\n'
             'Giai thừa: $result\n'
             'Số fibonacci: $fibonacciResult';
    }
  }
}