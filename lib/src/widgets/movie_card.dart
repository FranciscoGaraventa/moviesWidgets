import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../styles/dimensions.dart';

class MovieCard extends StatelessWidget {
  final Function onItemClick;
  final String defaultImageRoute;
  final Movie movie;

  MovieCard({
    this.onItemClick,
    this.defaultImageRoute,
    this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                onItemClick?.call(context, movie);
              },
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimension.cardBorderRadius)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimension.clipBorderRadius),
                  child: Hero(
                    tag: movie.id,
                    child: movie.backdropPath != null
                        ? Image.network(
                            movie.backdropPath,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(defaultImageRoute),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(Dimension.cardContainerEdgeInsets),
            child: Text(
              movie.title.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
