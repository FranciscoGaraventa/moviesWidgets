import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../styles/dimensions.dart';

class MovieCard extends StatefulWidget {
  final Function onItemClick;
  final String defaultImageRoute;
  final Movie movie;

  MovieCard({
    Key key,
    this.onItemClick,
    this.defaultImageRoute,
    this.movie,
  }) : super(key: key);

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  bool showImage = true;
  Image _image;

  @override
  void initState() {
    super.initState();
    if (widget.movie.backdropPath != null) {
      _image = Image.network(
        widget.movie.backdropPath,
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_image != null) {
      precacheImage(_image.image, context, onError: (exception, stacktrace) {
        setState(() {
          showImage = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                widget.onItemClick?.call(context, widget.movie);
              },
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimension.cardBorderRadius)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimension.clipBorderRadius),
                  child: Hero(
                    tag: widget.movie.id,
                    child: (showImage && _image != null)
                        ? Container(
                            key: Key('backdropImage'),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: _image.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Center(
                            child: Text(
                              widget.movie.backdropPath != null
                                  ? widget.movie.backdropPath + '\n IS NOT A VALID LINK'
                                  : 'NO LINK AVAILABLE',
                              key: Key('textInvalidPath'),
                              style: TextStyle(
                                color: Colors.grey.withOpacity(
                                  Dimension.genreCardOpacity,
                                ),
                                fontSize: Dimension.genreCardFontSize,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(Dimension.cardContainerEdgeInsets),
            child: Text(
              widget.movie.title != null
                  ? widget.movie.title.toUpperCase()
                  : widget.movie.originalTitle != null
                      ? widget.movie.originalTitle.toUpperCase()
                      : 'MOVIE TITLE',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
