import 'package:final_project_chapter45678/chapter6/exercieschap6/widget/dialog.dart';
import 'package:flutter/material.dart';
class Bai2 extends StatefulWidget {
  const Bai2({super.key});

  @override
  _Bai2State createState() => _Bai2State();
}
class _Bai2State extends State<Bai2> {
  final TextEditingController _controllerA = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _controllerA,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nhập giá trị A'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _controllerB,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nhập giá trị B'),
            ),
            const Padding(padding: EdgeInsets.all(16.0)),
            ElevatedButton(
              onPressed: () {
                int a = int.tryParse(_controllerA.text) ?? 0;
                int b = int.tryParse(_controllerB.text) ?? 0;
                if( a <= 0 || b <= 0 || b < a) {
                  Future.delayed(const Duration(seconds: 1), () {
                    Alert.showErrorDialog(context, ' Số nhập vào không hợp lệ');
                  });
                } else {
                  Alert.showLoading(context);
                  // set 1 giây sau hiển thị kết quả
                  Future.delayed(const Duration(seconds: 1), () {
                    String result = baigiai2(a, b);
                    // ẩn loading
                    Navigator.of(context).pop();
                    //hiển thị kết quả
                    Alert.showStringResult(context,result);
                  });
                }
              },
              child: const Text('Kết quả '),
            ),
          ],
        ),
      ),
    );
  }
}
String baigiai2( int a, int b) {
  int a = 1;
  int b = 20;
  int count = 0;
  int sum = 0;
  // chạy từ a -> b
  for (int i = a; i <= b; i++) {
    if (i % 2 == 0 && i % 3 == 0) {
      count++;
      sum += i;
    }
  }
  return "cac so chan chia het cho 3 trong day so tu [$a;$b]: $count"
         "Tong cac so chan chia het cho 3: $sum";
}