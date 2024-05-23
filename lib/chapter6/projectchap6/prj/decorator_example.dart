import 'package:flutter/material.dart';

void main() {
  runApp(const DecoratorWidgetExample());
}

class  DecoratorWidgetExample extends StatelessWidget {
  const  DecoratorWidgetExample({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  ImagesAndIconWidget(),
                  Divider(),
                  BoxDecoratorWidget(),
                  Divider(),
                  InputDecoratorsWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class ImagesAndIconWidget extends StatelessWidget {
  const ImagesAndIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SizedBox(
      width: 100,
      height: 100,
      child: Image(
        image: AssetImage("assets/images/login.png"),
        fit: BoxFit.cover,
      ),
    );
  }
}
class BoxDecoratorWidget extends StatelessWidget {
  const BoxDecoratorWidget({super.key,});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.blue, // Màu nền của container
          border: Border.all( // Viền của container
            color: Colors.red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20), // Độ cong của góc container
          boxShadow: const [
            BoxShadow( // Hiệu ứng bóng của container
              color: Colors.black,
              blurRadius: 5.0,
              spreadRadius: 2.0,
              offset: Offset(3.0, 3.0),
            ),
          ],
          gradient: const LinearGradient( // Gradient màu sắc của container
            colors: [Colors.yellow, Colors.green],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          image: const DecorationImage( // Hình ảnh nền của container
            image: AssetImage('assets/images/login.png'),
            fit: BoxFit.cover,
          ),
          backgroundBlendMode: BlendMode.colorDodge, // Chế độ pha trộn màu sắc nền và màu sắc
          shape: BoxShape.rectangle, // Hình dạng của container (vuông)
        ),
      ),
    );
  }
}
class InputDecoratorsWidget extends StatelessWidget {
  const InputDecoratorsWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const TextField(
          decoration: InputDecoration(
            labelText: 'Username', //1:Chữ mô tả hoặc nhãn của trường nhập liệu.
            labelStyle: TextStyle(color: Colors.blue),
            hintText: 'Enter your username',// 2:Chữ gợi ý hiển thị trong trường nhập liệu khi không có nội dung.
            hintStyle: TextStyle(color: Colors.grey),
            helperText: 'invalid',// Text hiển thị dưới input để cung cấp hướng dẫn cho người dùng.
            helperStyle: TextStyle(color: Colors.green),
            prefixIcon: Icon(Icons.person), //3.Icon được hiển thị ở bên trái của trường nhập liệu.
            suffixIcon: Icon(Icons.visibility),// 4. Icon được hiển thị ở bên phải của trường nhập liệu.
            border: OutlineInputBorder(), // Đường viền của trường nhập liệu.
            enabledBorder: OutlineInputBorder( //Đường viền khi trường nhập liệu được kích hoạt.
              borderSide: BorderSide(color: Colors.blue),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder( //7.Đường viền khi trường nhập liệu được tập trung.
              borderSide: BorderSide(color: Colors.green), //12.được sử dụng để định cấu hình các thuộc tính liên quan đến viền của InputDecoration, chẳng hạn như màu sắc và độ dày
            ),
            errorBorder: OutlineInputBorder( //8.Đường viền khi trường nhập liệu có lỗi.
              borderSide: BorderSide(color: Colors.red), // mau sac vien
            ),
            errorText: 'Invalid username', //Chữ mô tả lỗi hiển thị dưới trường nhập liệu khi có lỗi.
            errorStyle: TextStyle(color: Colors.red),
            counterText: '0/100', //10.Chữ mô tả số lượng ký tự đã nhập trong trường nhập liệu.
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), //11.Khoảng cách giữa nội dung và biên của trường nhập liệu.
          ),
        ),
        const Divider(
          color: Colors.lightGreen,
          height: 50.0,
        ),
        TextField(
          keyboardType:  TextInputType.text,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 16.0,
          ),
          decoration: const InputDecoration(
            labelText: "Notes",
            labelStyle: TextStyle(color: Colors.purple),
            border: OutlineInputBorder(),
          ),
        ),
        const Divider(
          color: Colors.lightGreen,
          height: 50.0,
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Enter your notes'),
        ),
      ],
    );
  }
}