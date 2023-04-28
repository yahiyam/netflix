import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final List imageList = [
    "https://www.themoviedb.org/t/p/w220_and_h330_face/dBxxtfhC4vYrxB2fLsSxOTY2dQc.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/AcrDB32TqpAGwvQFbICALGxSzn3.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/wDWwtvkRRlgTiUr6TyLSMX8FCuZ.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWdgets(
          title: "Downloads",
        ),
      ),
      body: ListView(
        children: [
          Row(
            children: const [
              kWidth,
              Icon(
                Icons.settings,
                color: kWhiteColor,
              ),
              kWidth,
              Text("Smart Downloads"),
            ],
          ),
          const Text("Introducing Downloads for you"),
          const Text(
            "We will download a personalised selection of movies and shows for you, so there is always something to watch on your device.",
          ),
          Container(
            width: size.width,
            height: size.width,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: size.width * .37,
                ),
                DownloadsImageWidget(
                  image: imageList[0],
                  margin: const EdgeInsets.only(left: 130, bottom: 50),
                  angle: 20,
                  size: Size(size.width * .4, size.width * 0.58),
                ),
                DownloadsImageWidget(
                  image: imageList[1],
                  margin: const EdgeInsets.only(right: 130, bottom: 50),
                  angle: -20,
                  size: Size(size.width * .4, size.width * 0.58),
                ),
                DownloadsImageWidget(
                  image: imageList[2],
                  radius: 30,
                  margin: const EdgeInsets.only(bottom: 10),
                  size: Size(size.width * .5, size.width * 0.65),
                ),
              ],
            ),
          ),
          MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            child: const Text(
              "Set Up",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kWhiteColor,
              ),
            ),
          ),
          MaterialButton(
            color: kButtonColorWhite,
            onPressed: () {},
            child: const Text(
              "See what you can download",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kBlackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.image,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  });

  final String image;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                image,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
