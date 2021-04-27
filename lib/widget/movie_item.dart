import 'package:flutter/material.dart';
import 'package:flutter_movie/model/movie_list_response.dart';
import 'package:flutter_movie/model/movie_model.dart';

import '../widget/star.dart';
import '../util/router.dart' as router;

class MovieItem extends StatelessWidget {
  final Movie movieModel;

  MovieItem(this.movieModel);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  movieModel.posterPath,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              movieModel.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
            ),
            Text(
              "(${movieModel.releaseDate})",
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: Colors.grey
              ),
            ),
          ],
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => Navigator.of(context)
                  .pushNamed(router.detailRoute, arguments: movieModel),
            ),
          ),
        ),
      ],
    );
  }
}
