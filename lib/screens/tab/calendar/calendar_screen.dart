import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/tab/calendar/widgets/search_regions_view.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<String> regions = [
    "Tashkent",
    "Andijan",
    "Olmazor",
    "London",
    "Asaka",
    "Chust",
    "Fergana",
    "Samarkand",
    "Bukhara",
    "Moscow",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SEARCH DELEGATE"),
        actions: [
          IconButton(
            onPressed: () async {
              String searchResult = await showSearch(
                context: context,
                delegate: SearchRegionsView(regions: regions),
              );
              print("SEARCH RESULT:$searchResult");
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
