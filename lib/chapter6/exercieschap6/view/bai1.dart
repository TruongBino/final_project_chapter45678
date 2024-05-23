import 'package:final_project_chapter45678/chapter6/exercieschap6/widget/dialog.dart';
import 'package:flutter/material.dart';

class Bai1 extends StatefulWidget {
  const Bai1({Key? key}) : super(key: key);

  @override
  _Bai1State createState() => _Bai1State();
}

class _Bai1State extends State<Bai1> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Nhập số n:'),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
          ),
          ElevatedButton(
            onPressed: () {
              String input = controller.text;
              int? n = int.tryParse(input);
              if (n != null) {
                // Hiện loading
                Alert.showLoading(context);
                // Set 1 giây sau hiển thị kết quả
                Future.delayed(const Duration(seconds: 1), () {
                  int result = baigiai1(input);
                  // Ẩn loading
                  Navigator.of(context).pop();
                  // Hiển thị kết quả
                  Alert.showIntResult(context, result);
                });
              } else {
                Future.delayed(const Duration(seconds: 1), () {
                  Alert.showErrorDialog(context, "Nhập một số nguyên hợp lệ");
                });
              }
            },
            child: const Text('Kết quả'),
          ),
        ],
      ),
    );
  }
}

int baigiai1(String N) {
  String decodedNumber = ''; //Khởi tạo biến chứa chuỗi sau khi mã hóa
  int minlen=N.length; //Lưu độ dài nhỏ nhất của đoạn mã
  while(N.length%2==0) //Lặp đến khi độ dài của N là số lẻ (Điểm yếu nhập N có độ dài chẵn sẽ lỗi)
      {
    decodedNumber = ''; //reset biến chứa chuỗi để lưu giá trị mới sau mỗi vòng lặp
    for (int i = 0; i < N.length - 1; i+=2) //Lặp qua từng cặp số
        {
      decodedNumber+= N[i+1]* int.parse(N[i]); //Chuỗi mới sẽ thêm vào N[i] số N[i+1], vd: 12 thì thêm vào 1 số 2
    }
    if(minlen<decodedNumber.length) //Khắc phục lỗi nhập số chẵn nếu chuỗi có xu hướng tăng độ dài lại thì dừng vòng lặp
      break;
    N=decodedNumber;//Gán N = chuỗi mới để tiếp tục mã hóa
    if(N.length<minlen)  //Lưu dữ liệu độ dài nhỏ nhất
      minlen=N.length;
    print(N);
  }
  return int.parse(N);
}