import 'package:flutter/material.dart';
import '../styles/dimensions.dart';

class MovieEventEmpty extends StatelessWidget {
  final IconData icon;
  final String messageEmpty;
  final String defaultImageRoute;

  MovieEventEmpty({
    Key key,
    this.icon,
    this.messageEmpty,
    this.defaultImageRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null
              ? IconButton(
                  key: Key('iconEmptyNotNull'),
                  icon: Icon(icon),
                  iconSize: Dimension.iconSearchTypeSize,
                )
              : Image.asset(
                  defaultImageRoute,
                  fit: BoxFit.contain,
                ),
          RichText(
            key: Key('emptyMessage'),
            text: TextSpan(
              style: TextStyle(color: Colors.grey.shade700),
              children: [
                TextSpan(
                  text: messageEmpty,
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
