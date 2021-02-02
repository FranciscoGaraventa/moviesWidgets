import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_widgets_package/movies_widgets_package.dart';

void main(){
  testWidgets('Check image and name in movie card', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MovieCard(
            movie: Movie(
              id: 741228,
              originalTitle: "Locked Down",
              title: "Locked Down",
              backdropPath: 'https://image.tmdb.org/t/p/w780/4qu4kO5HVTKMK2hvmCXeviZ233l.jpg',
            ),
            defaultImageRoute: '',
          ),
        )
    ));

    String title = 'Locked Down';
    expect(find.text(title.toUpperCase()),findsOneWidget);
    expect(find.byKey(ValueKey('backdropImage')), findsOneWidget);
  });
}
