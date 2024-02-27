import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';

showPrioritySelectDialog({
  required BuildContext context,
  required ValueChanged<int> priority,
  required int p,
}) {
  int pr = p;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            color: Colors.white,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: height / 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Task Priority"),
                SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: List.generate(10, (index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                pr = index + 1;
                              });
                            },
                            child: Icon(
                              Icons.flag,
                              color: (index + 1) == pr
                                  ? Colors.green
                                  : Colors.black,
                            ),
                          ),
                          Text((index + 1).toString()),
                        ],
                      );
                    }),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("CANCEL"),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          priority.call(pr);
                          Navigator.pop(context);
                        },
                        child: Text("SAVE"),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      );
    },
  );
}
