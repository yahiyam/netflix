import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widget/title.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w220_and_h330_face/dBxxtfhC4vYrxB2fLsSxOTY2dQc.jpg";

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
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            shrinkWrap: true,
            children: List.generate(
              20,
              (index) => const MainCard(),
            ),
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
