import 'package:flutter/material.dart';

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LayoutBuilder Example'),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Tính tỷ lệ chiều rộng so với chiều cao
              double ratio = constraints.maxWidth / constraints.maxHeight;  // (width / height)
              // Tùy chỉnh màu sắc dựa trên tỷ lệ
              Color color = ratio < 1 ? Colors.amberAccent : Colors.pinkAccent; //tính toán tỷ lệ chiều rộng so với chiều cao. Nếu tỷ lệ này lớn hơn 1, chúng ta đặt màu sắc của hộp thành màu vàng, ngược lại là màu hồng

              // Trả về một hộp với màu sắc thay đổi
              return Container(
                color: color,
                child: Center(
                  child: Text(
                    'Width: ${constraints.maxWidth}, Height: ${constraints.maxHeight}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LayoutBuilderExample(),
  ));
}
