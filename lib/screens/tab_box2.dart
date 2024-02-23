import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/home_screen.dart';
import 'package:flutter_nt_ten/screens/profile_screen.dart';
import 'package:flutter_nt_ten/screens/search_screen.dart';

class TabBox2 extends StatefulWidget {
  const TabBox2({super.key});

  @override
  State<TabBox2> createState() => _TabBox2State();
}

class _TabBox2State extends State<TabBox2> {
  List<Widget> _screens = [];
  int _activeIndex = 0;

  @override
  void initState() {
    _screens = [
      HomeScreen(),
      SearchScreen(),
      ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _activeIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
        },
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.search,
              color: Colors.blue,
            ),
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: Colors.blue,
            ),
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
