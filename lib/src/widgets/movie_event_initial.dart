import 'package:flutter/material.dart';
import '../styles/dimensions.dart';

class MovieEventInitial extends StatelessWidget {
  final String initialMessage;

  MovieEventInitial({this.initialMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.search),
            iconSize: Dimension.iconSearchTypeSize,
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.grey.shade700),
              children: [
                TextSpan(
                  text: initialMessage,
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
