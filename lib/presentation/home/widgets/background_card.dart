import 'package:flutter/material.dart';
import 'package:netflix/api/api_service.dart';

import '../../../core/colors/colors.dart';
import 'custom_button_widget.dart';

class BackgroundCard extends StatefulWidget {
  const BackgroundCard({Key? key}) : super(key: key);

  @override
  State<BackgroundCard> createState() => _BackgroundCardState();
}

class _BackgroundCardState extends State<BackgroundCard> {
  String? posterUrl;

  @override
  void initState() {
    super.initState();
    _fetchMoviePoster();
  }

  Future<void> _fetchMoviePoster() async {
    final movies = await TmdbApi.fetchMoviesByType('movie', 'popular');
    posterUrl = movies.first.posterPath;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        posterUrl == null
            ? const SizedBox()
            : Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500$posterUrl",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                ),
                _playButton(),
                const CustomButtonWidget(
                  icon: Icons.info,
                  title: 'Info',
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          kWhiteColor,
        ),
      ),
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: kBlackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          'Play',
          style: TextStyle(
            fontSize: 20,
            color: kBlackColor,
          ),
        ),
      ),
    );
  }
}
