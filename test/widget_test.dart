// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_webtoon/main.dart';

void main() {

  var uri = Uri.parse('deeplink://webcomic?id=5feaeecf3ee38170487e8dff');


  print("uri.authority " + uri.authority);
  print("uri.fragment " + uri.fragment);
  print("uri.scheme " + uri.scheme);
  print("uri.host " + uri.host);
  print("uri.pathSegments " + uri.pathSegments.toString());

  uri.queryParameters.forEach((k, v) {
    print('key: $k - value: $v');
  });

  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(StartApp());
  //
  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);
  //
  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();
  //
  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
