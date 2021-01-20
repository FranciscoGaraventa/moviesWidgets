import 'package:flutter/material.dart';
import '../styles/dimensions.dart';

class MovieOverview extends StatelessWidget {
  final String overview;

  MovieOverview({
    Key key,
    this.overview,
  }) : super(key: key);

  Widget _buildContent() {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.blueGrey.shade200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'OVERVIEW',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Dimension.movieOverviewFontSize,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        overview != ""
            ? Container(
                color: Colors.blueGrey.shade100,
                child: Padding(
                  padding: EdgeInsets.all(Dimension.movieOverviewPadding),
                  child: Text(
                    overview,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimension.movieOverviewFontSize,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : Container(
                color: Colors.blueGrey.shade100,
                child: Padding(
                  padding: EdgeInsets.all(Dimension.movieOverviewPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'NO OVERVIEW AVAILABLE',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}
