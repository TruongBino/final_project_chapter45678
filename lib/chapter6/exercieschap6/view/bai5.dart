import 'package:final_project_chapter45678/chapter6/exercieschap6/widget/dialog.dart';
import 'package:flutter/material.dart';

class Bai5 extends StatefulWidget {
  const Bai5({super.key});

  @override
  State<StatefulWidget> createState() {
    return Bai5State();
  }
}
class Bai5State extends State<Bai5> {
  TextEditingController nController = TextEditingController();
  TextEditingController listController = TextEditingController();
  int roomsNeeded = 0;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bai 5')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: nController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Nhập số lượng cuộc thi',
                  labelText: 'Nhập n:',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: listController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Nhập danh sách các cuộc thi (mỗi cuộc thi là một dòng, thời gian bắt đầu và kết thúc cách nhau bởi dấu cách)',
                  labelText: 'Nhập danh sách cuộc thi:',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Alert.showLoading(context);
                  // set 1 giây sau hiển thị kết quả
                  Future.delayed(const Duration(seconds: 1), () {
                    String result = bai5Function();
                    // ẩn loading
                    Navigator.of(context).pop();
                    // hiển thị kết quả
                    Alert.showStringResult(context, result);
                  });
                },
                child: const Text('Kết quả'),
              ),
              const SizedBox(height: 20),
              Text("Số lượng phòng cần thiết : $roomsNeeded phòng"),
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

  String bai5Function() {
      int n = int.tryParse(nController.text) ?? 0;
      List<List<int>> competitions = [];

      // Lấy danh sách cuộc thi từ TextFormField
      List<String> lines = listController.text.split('\n');

      // Phân tách từng dòng thành từng cuộc thi và thêm vào danh sách competitions
      for (String line in lines) {
        List<int> competition = line.split(' ').map((str) => int.parse(str)).toList();
        competitions.add(competition);
      }

      // Sắp xếp danh sách các cuộc thi theo thời gian bắt đầu
      competitions.sort((a, b) => a[0].compareTo(b[0]));

      // Khởi tạo danh sách để theo dõi thời gian kết thúc của các cuộc thi trong mỗi phòng thi
      List<int> endTimes = [];

      // Khởi tạo số lượng phòng cần thiết
      roomsNeeded = 0;

      // Lặp qua các cuộc thi và phân công phòng
      for (int i = 0; i < n; i++) {
        int start = competitions[i][0];
        int end = competitions[i][1];
        int j = 0;
        bool assigned = false;
        while (j < endTimes.length) {
          if (endTimes[j] <= start) {
            endTimes[j] = end;
            assigned = true;
            break;
          }
          j++;
        }
        if (!assigned) {
          endTimes.add(end);
          roomsNeeded++;
        }
      }
      return 'Số phòng thi cần thiết là : $roomsNeeded';
  }
}