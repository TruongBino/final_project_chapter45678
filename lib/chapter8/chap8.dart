import 'package:final_project_chapter45678/chapter8/pages/about.dart';
import 'package:final_project_chapter45678/chapter8/pages/gratitude.dart';
import 'package:flutter/material.dart';

class Chapter8 extends StatefulWidget {
  const Chapter8({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Chapter8> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  String _howAreYou = "...";
  int _currentIndex = 0;
  late List<Widget> _listPages;
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(_tabChanged);
    // super.initState();                                                       // bottomNavigationBar
    // _listPages = [
    //   Birthdays(),
    //   About(),
    //   Reminders(),
    // ];
    // _currentPage = _listPages[_currentIndex];
  }
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  void _tabChanged() {
    // Check if Tab Controller index is changing, otherwise we get the notice twice
    if (_tabController.indexIsChanging) {
      print('tabChanged: ${_tabController.index}');
    }
  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }

  void _openPageAbout({required BuildContext context, bool fullscreenDialog = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => About(),
      ),
    );
  }

  void _openPageGratitude({required BuildContext context, bool fullscreenDialog = false}) async {
    final String? _gratitudeResponse = await Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => Gratitude(radioGroupValue: -1), // Pass the radioGroupValue here
      ),
    );
    if (_gratitudeResponse != null) {
      setState(() {
        _howAreYou = _gratitudeResponse;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test Navigator'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () => _openPageAbout(
                context: context,
                fullscreenDialog: true,
              ),
              tooltip: 'about',
            ),
          ],
        ),
        body:
        // SafeArea(                                                                   // TabBarView
        //   child: TabBarView(
        //   controller: _tabController,
        //     children: [
        //       Birthdays(),
        //       About(),
        //       Reminders(),
        //     ],
        //   ),
        // ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Grateful for: $_howAreYou',
                style: const TextStyle(fontSize: 32.0),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Fly(),
                  ),
                );
              },
              child: const Hero(
                tag: 'format_paint',
                child: Icon(
                  Icons.format_paint,
                  color: Colors.lightGreen,
                  size: 120.0,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar:
        SafeArea(                                                             // Test TabBar
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.black54,
            unselectedLabelColor: Colors.black38,
            tabs: [
              Tab(
                icon: Icon(Icons.cake),
                text: 'Birthdays',
              ),
              Tab(
                icon: Icon(Icons.sentiment_satisfied),
                text: 'Gratitude',
              ),
              Tab(
                icon: Icon(Icons.access_alarm),
                text: 'Reminders',
              ),
            ],
          ),
        ),
        // BottomAppBar(                                                             // Test BottomAppBar
        //   color: Colors.blueAccent.shade100,
        //   shape: CircularNotchedRectangle(),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: <Widget>[
        //       IconButton(onPressed: (){
        //         Navigator.push(
        //                       context,
        //                       MaterialPageRoute(builder: (context) => Birthdays()),
        //                     );
        //       },
        //         icon: Icon(Icons.mail),
        //         color: Colors.black,
        //       ),
        //       IconButton(onPressed: (){
        //         Navigator.push(
        //                       context,
        //                       MaterialPageRoute(builder: (context) => About()),
        //                     );
        //       },
        //         icon: Icon(Icons.home),
        //         color: Colors.black,
        //       ),
        //       IconButton(onPressed: (){
        //         Navigator.push(
        //                       context,
        //                       MaterialPageRoute(builder: (context) => Reminders()),
        //                     );
        //       },
        //         tooltip: 'profile',
        //         icon: Icon(Icons.person),
        //         color: Colors.black,
        //       ),
        //       Divider(),
        //     ],
        //   ),
        // ),
        // BottomNavigationBar(                                                      // Test BottomNavigationBar
        //   currentIndex: _currentIndex,
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.cake),
        //       label: 'Birthdays',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.sentiment_satisfied),
        //       label: 'Gratitude',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.access_alarm),
        //       label: 'Reminders',
        //     ),
        //   ],
        //   onTap: (selectedIndex) {
        //     _gePage(selectedIndex);
        //         //     // chuyển hướng màn hình sử dụng switch case
        //         //     switch (selectedIndex) {
        //         //       case 0:
        //         //         Navigator.push(
        //         //           context,
        //         //           MaterialPageRoute(builder: (context) => Birthdays()),
        //         //         );
        //         //         break;
        //         //       case 1:
        //         //         Navigator.push(
        //         //           context,
        //         //           MaterialPageRoute(builder: (context) => About()), // Pass the radioGroupValue here
        //         //         );
        //         //         break;
        //         //       case 2:
        //         //         Navigator.push(
        //         //           context,
        //         //           MaterialPageRoute(builder: (context) => Reminders()),
        //         //         );
        //         //         break;chan
        //
        //     }
        //   },
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent.shade100,
          onPressed: () => _openPageGratitude(context: context),
          tooltip: 'About',
          child: const Icon(Icons.sentiment_satisfied),
        ),
      ),
    );
  }
}

class Fly extends StatelessWidget {
  const Fly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.shortestSide / 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fly'),
      ),
      body: SafeArea(
        child: Hero(
          tag: 'format_paint',
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Icon(
              Icons.format_paint,
              color: Colors.lightGreen,
              size: _width,
            ),
          ),
        ),
      ),
    );
  }
}
