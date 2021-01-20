import 'package:flutter/material.dart';
import '../../movies_widgets_package.dart';
import 'movie_event_empty.dart';

class GenresList extends StatelessWidget {
  final List<Genre> genresList;
  final Function onTapAction;
  final String emptyStateText;
  final String defaultImageRoute;

  GenresList({
    this.genresList,
    this.onTapAction,
    this.emptyStateText,
    this.defaultImageRoute,
  });

  Widget _buildContent() {
    return SingleChildScrollView(
      child: genresList.length > 0
          ? ListView.builder(
              itemCount: genresList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(genresList[index].name),
                  onTap: () {
                    onTapAction?.call(context, genresList[index]);
                  },
                );
              },
            )
          : MovieEventEmpty(
              icon: Icons.local_movies,
              text: emptyStateText,
              defaultImageRoute: defaultImageRoute,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}
