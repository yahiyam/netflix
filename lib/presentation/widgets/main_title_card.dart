import 'package:flutter/material.dart';
import 'package:netflix/api/api_service.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

import '../../api/model.dart';
import '../../core/constants.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.title,
    required this.type,
  });
  final String title;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: FutureBuilder<List<Result>>(
            future: TmdbApi.fetchMoviesByType('movie', type),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final movies = snapshot.data!;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return MainCard(
                      filmCode: movies[index + 1].posterPath!,
                    );
                  },
                  itemCount: movies.length - 1,
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
          ),
        )
      ],
    );
  }
}
