import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/hello_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    "Hello Screen uchun detailed Test",
    (widgetTester) async {
      await widgetTester.pumpWidget(HelloScreen());
      expect(find.byWidget(Text("Widget Test")), findsOneWidget);
    },
  );
}
