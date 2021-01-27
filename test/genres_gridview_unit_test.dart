import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_widgets_package/movies_widgets_package.dart';

void main() {
  testWidgets('Show genres individualy', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: GenresGridView(
        genres: [
          'Action',
          'Documentary',
          'Comedy',
          'Romance',
        ],
      ),
    ));

    List<String> _genres = [
      'Action',
      'Adventure',
      'Animation',
      'Comedy',
      'Crime',
      'Documentary',
      'Drama',
      'Family',
      'Fantasy',
      'History',
      'Horror',
      'Music',
      'Mystery',
      'Romance',
      'Science Fiction',
      'TV Movie',
      'Thriller',
      'War',
      'Western',
    ];

    int length = 4;
    for (int i = 0; i < length; i++) {
      expect(find.byKey(ValueKey("genre_$i")), findsOneWidget);
    }

    List<Text> _genresNames = List<Text>.from(tester.widgetList(find.descendant(
      of: find.byType(IndividualGenre),
      matching: find.byType(Text),
    )));

    bool _validGenresName(List<Text> genres) {
      for (Text _text in _genresNames) {
        if (!_genres.contains(_text.data)) return false;
      }
      return true;
    }

    expect(_validGenresName(_genresNames), true);
  });
}
