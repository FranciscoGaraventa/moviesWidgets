import 'package:flutter/material.dart';
import 'package:movies_widgets_package/movies_widgets_package.dart';
import 'routes.dart';
import '../screen/main_screen.dart';

class NavigationRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    String title = settings.arguments as String;
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => MainScreen(
            title: 'WIDGETS TEST',
          ),
        );
      case genresGridView:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: GenresGridView(
                crossAxisCount: 2,
                genres: [
                  'Action',
                  'Adventure',
                  'Animation',
                  'Comedy',
                ],
              ),
            ),
          ),
        );
      case genresList:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: GenresList(
                emptyStateText: 'GENRES UNAVAILABLE',
                genresList: [
                  Genre(id: 28, name: 'Action'),
                  Genre(id: 12, name: 'Adventure'),
                  Genre(id: 16, name: 'Animation'),
                ],
              ),
            ),
          ),
        );
      case individualGenre:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: IndividualGenre(
                genreName: 'Action',
              ),
            ),
          ),
        );
      case movieBackdrop:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
                child: MovieBackdropImage(
              movieId: 508442,
              backdropPath: 'https://image.tmdb.org/t/p/w780/kf456ZqeC45XTvo6W9pW5clYKfQ.jpg',
            )),
          ),
        );
      case movieCard:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
                child: MovieCard(
              movie: Movie(
                id: 741228,
                originalTitle: "Locked Down",
                title: "Locked Down",
                backdropPath: 'https://image.tmdb.org/t/p/w780/4qu4kO5HVTKMK2hvmCXeviZ233l.jpg',
              ),
            )),
          ),
        );
      case moviesGridView:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: MoviesGridView(
                movieList: [
                  Movie(
                    id: 542047,
                    originalTitle: "Greenland",
                    title: "Greenland",
                    backdropPath: 'https://image.tmdb.org/t/p/w780/2Fk3AB8E9dYIBc2ywJkxk8BTyhc.jpg',
                  ),
                  Movie(
                    id: 529203,
                    originalTitle: "The Croods: A New Age",
                    title: "The Croods: A New Age",
                    backdropPath: 'https://image.tmdb.org/t/p/w780/tK1zy5BsCt1J4OzoDicXmr0UTFH.jpg',
                  ),
                  Movie(
                    id: 299534,
                    originalTitle: "Avengers: Endgame",
                    title: "Avengers: Endgame",
                    backdropPath: 'https://image.tmdb.org/t/p/w780/7RyHsO4yDXtBv1zUU3mTpHeQ0d5.jpg',
                  ),
                ],
              ),
            ),
          ),
        );
      case movieRatingReleaseDateLang:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: RatingReleaseLang(
                voteAverage: 8.3,
                originalLanguage: "en",
                releaseDate: "2019-04-24",
              ),
            ),
          ),
        );
      case movieOverview:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: MovieOverview(
                overview:
                        "After the devastating events of Avengers: Infinity War, the universe is in ruins due to the efforts of the Mad Titan, "
                        "Thanos. With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos' actions and "
                        "restore order to the universe once and for all, no matter what consequences may be in store.",
              ),
            ),
          ),
        );
      case movieEvents:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MovieEventEmpty(
                      icon: Icons.search,
                      text: 'MOVIE EVENT EMPTY',
                    ),
                    MovieEventError(
                      messageError: 'MESSAGE ERROR',
                    ),
                    MovieEventInitial(
                      initialMessage: 'INITIAL MESSAGE',
                    ),
                  ],
                ),
              )
            ),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No Route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
