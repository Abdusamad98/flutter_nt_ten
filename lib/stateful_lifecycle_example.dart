import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/second_screen.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class StatefulLifecycleExample extends StatefulWidget {
  const StatefulLifecycleExample({
    super.key,
  });

  @override
  State<StatefulLifecycleExample> createState() {
    print("CREATE_STATE_METHOD");
    return _StatefulLifecycleExampleState();
  }
}

class _StatefulLifecycleExampleState extends State<StatefulLifecycleExample> {
  late String name;

  late TextEditingController controller;

  @override
  initState() {
    controller = TextEditingController();
    name = "Abdulloh";
    print("INIT_STATE_METHOD");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("DID_CHANGE_DEPENDENCIES_METHOD");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant StatefulLifecycleExample oldWidget) {
    print("DID_UPDATE_WIDGET_METHOD");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    print("DISPOSE_METHOD");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD_METHOD");
    return Scaffold(
      appBar: AppBar(
        title: Text("Lifecycle:$name"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SecondScreen(
                  function: (value) {
                    print(value);
                  },
                );
              }));
            },
            child: Text(
              "SECOND SCREEN",
              style: AppTextStyle.interSemiBold.copyWith(fontSize: 35),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                controller = TextEditingController();
              });
            },
            child: Text(
              "SET STATE",
              style: AppTextStyle.interSemiBold.copyWith(fontSize: 35),
            ),
          )
        ],
      ),
    );
  }
}
