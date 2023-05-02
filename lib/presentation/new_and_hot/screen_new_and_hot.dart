import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

import '../../api/api_service.dart';
import '../../api/model.dart';
import '../../core/constants.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            actions: [
              Row(
                children: [
                  const Icon(
                    Icons.cast,
                    color: Colors.white,
                  ),
                  kWidth,
                  Container(
                    height: 30,
                    width: 30,
                    color: Colors.blue,
                  ),
                  kWidth,
                ],
              ),
            ],
            bottom: TabBar(
              isScrollable: true,
              labelColor: kBlackColor,
              unselectedLabelColor: kWhiteColor,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              indicator: BoxDecoration(
                color: kWhiteColor,
                borderRadius: kRadius30,
              ),
              tabs: const [
                Tab(
                  text: 'Coming Soon',
                ),
                Tab(
                  text: "Everyone's watching",
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
          ],
        ),
      ),
    );
  }
}

Widget _buildEveryonesWatching() {
  return FutureBuilder<List<Result>>(
    future: TmdbApi.fetchMoviesByType('movie', "popular"),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final movies = snapshot.data!;
        return ListView.builder(
          // scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return EveryonesWatchingWidget(
              filmCode: movies[index],
            );
          },
          itemCount: movies.length,
        );
      } else if (snapshot.hasError) {
        return Center(
          child: Text(
            "Failed to fetch movies: ${snapshot.error}",
          ),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
  // return ListView.builder(
  //   itemCount: 9,
  //   itemBuilder: (BuildContext context, int index) {
  //     return const EveryonesWatchingWidget();
  //   },
  // );
}

Widget _buildComingSoon() {
  return FutureBuilder<List<Result>>(
    future: TmdbApi.fetchMoviesByType('tv', "popular"),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final movies = snapshot.data!;
        return ListView.builder(
          // scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return ComingSoonWidget(
              filmCode: movies[index],
            );
          },
          itemCount: movies.length,
        );
      } else if (snapshot.hasError) {
        return Center(
          child: Text(
            "Failed to fetch movies: ${snapshot.error}",
          ),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
  // return ListView.builder(
  //   itemBuilder: (context, index) {
  //     return const ComingSoonWidget();
  //   },
  //   itemCount: 10,
  // );
}
