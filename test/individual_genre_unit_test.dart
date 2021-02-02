import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_widgets_package/movies_widgets_package.dart';

void main(){
  testWidgets('Individual genre card with genreName', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: IndividualGenre(
        genreName: 'Documentary',
      ),
    ));

    expect(find.text('Documentary'), findsOneWidget);
  });
}
