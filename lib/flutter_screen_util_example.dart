import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlutterScreenUtilExample extends StatefulWidget {
  const FlutterScreenUtilExample({super.key});

  @override
  State<FlutterScreenUtilExample> createState() =>
      _FlutterScreenUtilExampleState();
}

class _FlutterScreenUtilExampleState extends State<FlutterScreenUtilExample> {
  @override
  Widget build(BuildContext context) {
    print("TABLET UCHUN 22 pixel = ${22.sp}");

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                width: 300,
                color: Colors.red,
                height: 200,
              ),
              SizedBox(height: 50),
              Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  '''Widget is not a flutter widget (widgets are available in Flutter Docs)
Widget does not start with underscore (_) Widget does not declare SU mixin reponsiveWidgets does not contains widget name
If you have a widget that uses the library and doesn't meet these options you can either add SU mixin or add widget name in responsiveWidgets list
              ''',
                  style: TextStyle(fontSize: 22.sp),
                ),
              ),
            ],
          ),
        ));
  }
}
