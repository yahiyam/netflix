import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widget/title.dart';

import '../../../api/api_service.dart';
import '../../../api/model.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kHeight,
        Expanded(
          child: FutureBuilder<List<Result>>(
            future: TmdbApi.fetchMoviesByType('tv', 'airing_today'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final movies = snapshot.data!;
                return GridView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return SearchCard(
                      filmCode: movies[index].posterPath!,
                    );
                  },
                  itemCount: movies.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1.4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
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
        ),
      ],
    );
  }
}

class SearchCard extends StatelessWidget {
  const SearchCard({
    super.key,
    required this.filmCode,
  });
  final String filmCode;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "https://www.themoviedb.org/t/p/w500$filmCode",
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
