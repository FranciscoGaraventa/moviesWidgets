import 'package:flutter/material.dart';
import '../styles/dimensions.dart';

class IndividualGenre extends StatelessWidget {
  final String genreName;

  IndividualGenre({
    Key key,
    this.genreName,
  }) : super(key: key);

  Widget _buildContent() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(
          Dimension.genreCardBorderRadius,
        ),
      ),
      child: Text(
        genreName,
        style: TextStyle(
          color: Colors.grey.withOpacity(
            Dimension.genreCardOpacity,
          ),
          fontSize: Dimension.genreCardFontSize,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}
