import 'package:flutter/material.dart';
import '../styles/dimensions.dart';

class MovieEventError extends StatelessWidget {
  final String messageError;

  MovieEventError({this.messageError});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.signal_cellular_connected_no_internet_4_bar,
              color: Colors.grey,
            ),
            iconSize: Dimension.iconSearchTypeSize,
          ),
          RichText(
            key: Key('errorMessage'),
            text: TextSpan(
              style: TextStyle(color: Colors.grey.shade700),
              children: [
                TextSpan(
                  text: messageError,
                  style: TextStyle(fontSize: Dimension.searchEventTextFontSize, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
