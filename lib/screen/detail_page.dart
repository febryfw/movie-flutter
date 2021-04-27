import 'package:flutter/material.dart';
import 'package:flutter_movie/model/movie_list_response.dart';
import 'package:flutter_movie/model/movie_model.dart';
import 'package:flutter_movie/widget/star.dart';

class DetailPage extends StatelessWidget {
  final Movie movieModel;

  DetailPage(this.movieModel);

  @override
  Widget build(BuildContext context) {
    final medQue = MediaQuery.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.network(
              movieModel.posterPath,
              width: double.infinity,
              height: medQue.size.height * 0.7,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Container(
                  color: Colors.transparent,
                  height: medQue.size.height * 0.65,
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0, -1.0),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              movieModel.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Star(movieModel.voteAverage),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Release date: ${movieModel.releaseDate}",
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Colors.grey, fontWeight: FontWeight.bold
                            ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Overview",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        movieModel.overview,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: medQue.padding.top + 5.0,
              left: medQue.padding.left + 5.0,
              child: RawMaterialButton(
                  onPressed: () => Navigator.of(context).pop(),
                  elevation: 4.0,
                  fillColor: Colors.white.withOpacity(0.4),
                  child: Icon(
                    Icons.chevron_left,
                    size: 30.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  padding: EdgeInsets.all(8.0),
                  shape: CircleBorder()),
            ),
          ],
        ),
      ),
    );
  }
}
