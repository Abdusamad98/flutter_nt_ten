import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/cards_screen.dart';
import 'package:flutter_nt_ten/screens/transfer_screen.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [];

  int activeIndex = 0;

  @override
  void initState() {
    screens = [
      CardsScreen(),
      TransferScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (v) {
          setState(() {
            activeIndex = v;
          });
        },
        currentIndex: activeIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_sharp),
            label: "KARTALAR",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.price_change),
            label: "O\"TKAZMALAR",
          ),
        ],
      ),
    );
  }
}
