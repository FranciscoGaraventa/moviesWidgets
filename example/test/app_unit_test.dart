import 'package:example/src/app.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('MainPage navigation tests', () {
    List<String> _routesTitles = [
      'MOVIES GENRES',
      'GENRES LIST',
      'INDIVIDUAL GENRE',
      'MOVIE BACKDROP IMAGE',
      'MOVIE CARD',
      'GRIDVIEW OF MOVIE CARDS',
      'MOVIE: RATING, RELEASE DATE, LANGUAGE',
      'MOVIE OVERVIEW',
      'MOVIE EVENTS',
    ];

    List<String> _routesKeys = [
      'genresGridView',
      'genresList',
      'individualGenre',
      'movieBackdropImage',
      'movieCard',
      'moviesGridView',
      'ratingReleaseLang',
      'movieOverview',
      'movieEvents',
    ];

    NavigatorObserver mockObserver;

    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    Future<void> _buildMainPage(WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: MyApp(),
        navigatorObservers: [mockObserver],
      ));
    }

    Future<void> _navigateRoutePage(WidgetTester tester, Key buttonKey, String routeKey) async {
      await tester.tap(find.byKey(buttonKey));
      await tester.pumpAndSettle();

      verify(mockObserver.didPush(any, any));

      expect(find.byKey(ValueKey(routeKey)), findsOneWidget);
    }

    testWidgets('Testing that the path to widget [moviesGenres] is valid', (WidgetTester tester) async {
      await _buildMainPage(tester);
      expect(find.text('WIDGETS TEST'), findsOneWidget);

      int length = 9;
      for (int i = 0; i < length; i++) {
        expect(find.byKey(ValueKey(_routesTitles[i])), findsOneWidget);
      }

      List<ElevatedButton> _routesButton = List<ElevatedButton>.from(tester.widgetList(find.descendant(
        of: find.byType(Row),
        matching: find.byType(ElevatedButton),
      )));

      await _navigateRoutePage(tester, _routesButton.first.key, _routesKeys.first);
    });
  });
}
