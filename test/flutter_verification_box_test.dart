import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_verification_box/src/verification_box.dart';

void main() {
  testWidgets('Test input and show', (WidgetTester tester) async {
    await tester.pumpWidget(VerificationBox(
      count: 8,
      keyboardType: TextInputType.visiblePassword,
      showCursor: true,
      cursorWidth: 2,
      cursorColor: Colors.lightBlue,
      cursorIndent: 10,
      itemWidget: 40,
      upperCase: true,
      focusBorderColor: Colors.lightBlue,
      cursorEndIndent: 10,
      onSubmitted: (value) {
        // print(value);
        // expect(value, '12DP');
      },
    ));

    // Create the Finders.
    await tester.enterText(find.byType(TextField), '12dp');
    await tester.pump(Duration(milliseconds: 400));
    final text = await find.text('12DP');
    expect(text, findsNWidgets(1));
    final a = await tester.elementList(find.byType(Text));
    print(a);
    expect(find.text('1'), findsNWidgets(1));
  });
}
