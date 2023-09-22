import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../ch05_page_move/login_form_v2/login_form_v2.dart';

void main() {
  testWidgets('로그인 화면 표시 테스트', (WidgetTester tester) async {
    Widget form = StateLoginDemo();
    await tester.pumpWidget(form);

    expect(find.byKey(const Key('email')), findsOneWidget);
    expect(find.byKey(const Key('password')), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Log In'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Cancel'), findsOneWidget);
  });
}