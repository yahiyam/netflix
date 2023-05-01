import 'package:flutter/material.dart';

import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';

import '../../../api/api_service.dart';
import '../../../api/model.dart';
import '../../widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          title: "Top 10 TV Shows In India Today",
        ),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: FutureBuilder<List<Result>>(
            future: TmdbApi.fetchMoviesByType('tv', 'top_rated'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final tvShows = snapshot.data!;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return NumberCard(
                      index: index,
                      filmCode: tvShows[index].posterPath!,
                    );
                  },
                  itemCount: 10,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Failed to fetch tvShows: ${snapshot.error}",
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
