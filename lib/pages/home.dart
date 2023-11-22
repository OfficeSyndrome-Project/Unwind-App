import 'package:flutter/material.dart';
import 'package:unwind_app/pages/history-feature/history_page.dart';
import 'package:unwind_app/pages/menu_page.dart';
import 'package:unwind_app/pages/profile-feature/profile_page.dart';
import 'package:unwind_app/pages/workoutList-feature/workoutlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const WorkoutListPage(),
    const MenuWidget(),
    HistoryPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'หน้าแรก',
            backgroundColor: Color(0xffebedf0),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.widgets),
            icon: Icon(Icons.widgets_outlined),
            label: 'เมนู',
            backgroundColor: Color(0xffebedf0),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.assignment),
            icon: Icon(Icons.assignment_outlined),
            label: 'ประวัติ',
            backgroundColor: Color(0xffebedf0),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'โปรไฟล์',
            backgroundColor: Color(0xffebedf0),
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedLabelStyle: const TextStyle(
          fontFamily: "Noto Sans Thai",
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        showUnselectedLabels: true,
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
