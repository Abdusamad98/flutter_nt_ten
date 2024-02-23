import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/home_screen.dart';
import 'package:flutter_nt_ten/screens/profile_screen.dart';
import 'package:flutter_nt_ten/screens/search_screen.dart';

class TabBox3 extends StatefulWidget {
  const TabBox3({super.key});

  @override
  State<TabBox3> createState() => _TabBox3State();
}

class _TabBox3State extends State<TabBox3> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
          switch (newActiveIndex) {
            case 1:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchScreen(
                        onTap: () {
                          setState(() {
                            _activeIndex = 0;
                          });
                        },
                      );
                    },
                  ),
                );
                break;
              }
            case 2:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfileScreen(
                        onTap: () {
                          setState(() {
                            _activeIndex = 0;
                          });
                        },
                      );
                    },
                  ),
                );
                break;
              }
          }
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
