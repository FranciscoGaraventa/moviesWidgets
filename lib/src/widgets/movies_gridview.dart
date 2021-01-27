import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../styles/dimensions.dart';
import 'movie_card.dart';

class MoviesGridView extends StatelessWidget {
  final List<Movie> movieList;
  final int crossAxisCount;
  final String defaultImageRoute;
  final Function onItemClick;

  const MoviesGridView({
    Key key,
    this.crossAxisCount = Dimension.movieListAxisCount,
    this.onItemClick,
    this.defaultImageRoute,
    this.movieList,
  }) : super(key: key);

  Widget _buildContent() {
    return GridView.builder(
      itemCount: movieList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount),
      itemBuilder: (BuildContext context, int index) {
        return MovieCard(
          key: Key('movieCard'+'_$index'),
          movie: movieList[index],
          onItemClick: onItemClick,
          defaultImageRoute: defaultImageRoute,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}
