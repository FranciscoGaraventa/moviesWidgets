import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:movies_widgets_package/movies_widgets_package.dart';

void main() {
  group('Movie card network image test', () {
    testWidgets('Check correct image from network', (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpWidget(
          Builder(builder: (BuildContext context) {
            return MaterialApp(
              home: MovieBackdropImage(
                movieId: 508442,
                backdropPath: 'https://image.tmdb.org/t/p/w780/kf456ZqeC45XTvo6W9pW5clYKfQ.jpg',
              ),
            );
          }),
        ),
      );
      expect(find.byKey(ValueKey('backdropPathImage')), findsOneWidget);
    });

    testWidgets('Check when backdropPath is invalid and default route use assets image', (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpWidget(
          Builder(builder: (BuildContext context) {
            return MaterialApp(
              home: MovieBackdropImage(
                movieId: 508442,
              ),
            );
          }),
        ),
      );
      expect(find.byKey(ValueKey('assetImage')), findsOneWidget);
      expect(find.byKey(ValueKey('textErrorImage')), findsOneWidget);
    });

    testWidgets('Check when backdropPath is invalid and default route use empty assets route',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpWidget(
          Builder(builder: (BuildContext context) {
            return MaterialApp(
              home: Scaffold(
                body: MovieBackdropImage(
                  movieId: 508442,
                  defaultImageRoute: '',
                ),
              ),
            );
          }),
        ),
      );
      expect(find.byKey(ValueKey('iconRouteEmpty')), findsOneWidget);
      expect(find.byKey(ValueKey('textErrorImage')), findsOneWidget);
    });
  });
}
