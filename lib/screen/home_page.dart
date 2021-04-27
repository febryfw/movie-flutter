import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/blocs/movielist/movie_list_bloc.dart';
import 'package:flutter_movie/blocs/movielist/movie_list_event.dart';
import 'package:flutter_movie/blocs/movielist/movie_list_state.dart';

import 'package:flutter_movie/widget/movie_item.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<MovieListBloc>(context).add(FetchMovieList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Xplore Movie",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              BlocBuilder<MovieListBloc, MovieListState>(
                builder: (context, state) {
                  if (state is MovieListUninitialized) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is MovieListFetched) {
                    final movieList = state.movieList;

                    return Expanded(
                      child: LazyLoadScrollView(
                        onEndOfPage: () {
                          BlocProvider.of<MovieListBloc>(context)
                              .add(FetchMovieList());
                        },
                        scrollOffset: 100,
                        child: GridView.builder(
                          itemCount: movieList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 9 / 16,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 20.0,
                          ),
                          itemBuilder: (ctx, pos) => MovieItem(
                            movieList[pos],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Fail Getting latest movie list",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<MovieListBloc>(context)
                                    .add(FetchMovieList());
                              },
                              child: Text(
                                "Refresh",
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
