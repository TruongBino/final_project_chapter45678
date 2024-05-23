import 'package:flutter/material.dart';

class Chapter5 extends StatelessWidget {
  const Chapter5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Tree', // Tiêu đề của ứng dụng
      home: SafeArea(
        // SafeArea giúp đảm bảo rằng các phần tử con không bị ẩn bởi thanh trạng thái
        bottom: false, // Thuộc tính này chỉ ra xem có muốn thêm một phần không gian an toàn ở phía dưới không
        child: Scaffold(
          // Scaffold là một layout cơ bản cho ứng dụng di động
          appBar: AppBar(
            backgroundColor: Colors.brown,
            // AppBar là thanh định vị ở phía trên cùng của ứng dụng
            title: const Text('appBar'), // Tiêu đề của AppBar
          ),
          bottomNavigationBar: BottomNavigationBar(
            // BottomNavigationBar là thanh điều hướng ở phía dưới cùng của ứng dụng
            items: const [
              BottomNavigationBarItem(
                tooltip: 'BottomNavigationBar',
                icon: Icon(Icons.imagesearch_roller_rounded), // Biểu tượng của mục
                label: 'Search', // Nhãn của mục
              ),
              BottomNavigationBarItem(
                tooltip: 'BottomNavigationBar',
                icon: Icon(Icons.add_alarm), // Biểu tượng của mục
                label: 'Search', // Nhãn của mục
              ),
            ], // Danh sách các mục của thanh điều hướng
          ),
          body: Container(color: Colors.green,), // Phần dưới cùng được hiển thị trên body và dưới cùng của ứng dụng
          floatingActionButton: FloatingActionButton(
            // FloatingActionButton là một nút hành động phụ thường được đặt ở dưới cùng bên phải của ứng dụng
            tooltip: 'floatingActionButton',
            onPressed: () {}, // Hàm được gọi khi nút được nhấn
            child: const Icon(Icons.add), // Biểu tượng của nút
          ),
        ),
      ),
    );
  }
}
