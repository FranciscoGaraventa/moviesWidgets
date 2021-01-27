import 'package:flutter/material.dart';
import '../styles/dimensions.dart';

class MovieBackdropImage extends StatefulWidget {
  final int movieId;
  final String backdropPath;
  final String defaultImageRoute;

  MovieBackdropImage({
    Key key,
    this.movieId,
    this.backdropPath,
    this.defaultImageRoute = 'packages/movies_widgets_package/assets/images/image404.png',
  }) : super(key: key);

  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<MovieBackdropImage> {
  bool showImage = true;
  bool showAsset = true;
  Image _image;
  Image _imageAsset;

  @override
  void initState() {
    super.initState();
    if (widget.backdropPath != null) {
      _image = Image.network(
        widget.backdropPath,
      );
    }
    widget.defaultImageRoute.isNotEmpty
        ? _imageAsset = Image.asset(
            widget.defaultImageRoute,
          )
        : showAsset = false;
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
    if (_imageAsset != null) {
      precacheImage(_imageAsset.image, context, onError: (exception, stacktrace) {
        setState(() {
          showAsset = false;
        });
      });
    }
  }

  Widget _showChild() {
    if (showImage && _image != null) {
      return Container(
        key: Key('backdropPathImage'),
        decoration: BoxDecoration(
          image: DecorationImage(image: _image.image, fit: BoxFit.fill),
        ),
        height: Dimension.movieInfoAppBarHeight,
      );
    } else {
      if ((showImage && _image == null) || !showImage) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showAsset
                ? Container(
                    key: ValueKey('assetImage'),
                    child: _imageAsset,
                  )
                : IconButton(
                    key: ValueKey('iconRouteEmpty'),
                    icon: Icon(
                      Icons.error,
                      color: Colors.grey,
                    ),
                    iconSize: Dimension.iconSearchTypeSize,
                  ),
            Text(
              'NO LINK AVAILABLE',
              key: ValueKey('textErrorImage'),
              style: TextStyle(
                color: Colors.grey.withOpacity(
                  Dimension.genreCardOpacity,
                ),
                fontSize: Dimension.genreCardFontSize,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      }
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Hero(tag: widget.movieId, child: _showChild()),
          ),
        ],
      ),
    );
  }
}
