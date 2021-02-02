import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_widgets_package/movies_widgets_package.dart';

void main() {
  Widget _buildWidget(List<Genre> genreList) {
    return MaterialApp(
      home: Scaffold(
        body: GenresList(genresList: genreList),
      ),
    );
  }

  group('Genre list test with changes of genreList content', () {
    testWidgets('Genre list with no empty genresList', (WidgetTester tester) async {
      await tester.pumpWidget(_buildWidget([
        Genre(id: 28, name: 'Action'),
        Genre(id: 99, name: 'Documentary'),
      ]));

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

      int length = 2;
      for (int i = 0; i < length; i++) {
        expect(find.byKey(ValueKey("genreTile_$i")), findsOneWidget);
      }

      List<Text> _genresNames = List<Text>.from(tester.widgetList(find.descendant(
        of: find.byType(ListTile),
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

    testWidgets('Genre list with empty genresList', (WidgetTester tester) async {
      await tester.pumpWidget(_buildWidget([]));

      expect(find.byKey(ValueKey("eventEmptyGenreList")), findsOneWidget);
    });
  });
}
