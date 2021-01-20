import 'package:flutter/material.dart';
import '../styles/dimensions.dart';

class MovieBackdropImage extends StatelessWidget {
  final int movieId;
  final String backdropPath;
  final String defaultImageRoute;

  MovieBackdropImage({
    Key key,
    this.movieId,
    this.backdropPath,
    this.defaultImageRoute,
  }) : super(key: key);

  Widget _buildContent() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Hero(
              tag: movieId,
              child: backdropPath != null
                  ? Image.network(
                backdropPath,
                fit: BoxFit.fill,
                height: Dimension.movieInfoAppBarHeight,
              )
                  : Image.asset(
                defaultImageRoute,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}
