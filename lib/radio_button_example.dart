import 'package:flutter/material.dart';

enum WeekDays {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  List<WeekDay> list = [
    WeekDay(text: "monday", week: WeekDays.monday),
    WeekDay(text: "tuesday", week: WeekDays.tuesday),
    WeekDay(text: "wednesday", week: WeekDays.wednesday),
    WeekDay(text: "thursday", week: WeekDays.thursday),
    WeekDay(text: "friday", week: WeekDays.friday),
    WeekDay(text: "saturday", week: WeekDays.saturday),
    WeekDay(text: "sunday", week: WeekDays.sunday),
  ];

  late WeekDay? _character;

  @override
  void initState() {
    _character = list[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          ...List.generate(
            list.length,
            (index) => ListTile(
              onTap: (){
                setState(() {
                  _character = list[index];
                });
              },
              title:  Text(list[index].text),
              leading: Radio<WeekDay>(
                value: list[index],
                groupValue: _character,
                onChanged: (WeekDay? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WeekDay {
  final String text;
  final WeekDays week;

  WeekDay({required this.text, required this.week});
}
