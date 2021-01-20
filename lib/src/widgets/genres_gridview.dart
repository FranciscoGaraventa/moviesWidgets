import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../styles/dimensions.dart';
import 'individual_genre.dart';

class GenresGridView extends StatelessWidget {
  final List<String> genres;
  final int crossAxisCount;

  const GenresGridView({
    Key key,
    this.genres,
    this.crossAxisCount = Dimension.crossAxisCount,
  }) : super(key: key);

  Widget _buildContent(BuildContext context) {
    return genres.length != 0
        ? StaggeredGridView.countBuilder(
            crossAxisCount: genres.length < crossAxisCount ? genres.length : crossAxisCount,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: genres.length,
            itemBuilder: (BuildContext context, int index) => IndividualGenre(
              genreName: genres[index],
            ),
            staggeredTileBuilder: (int index) => StaggeredTile.fit(Dimension.staggeredTileFit),
            mainAxisSpacing: Dimension.staggeredTileMainAxisSpacing,
            crossAxisSpacing: Dimension.staggeredTileCrossAxisSpacing,
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }
}
