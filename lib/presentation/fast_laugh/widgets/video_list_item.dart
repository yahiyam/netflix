import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w220_and_h330_face/AcrDB32TqpAGwvQFbICALGxSzn3.jpg";

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      color: kWhiteColor,
                      size: 30,
                    ),
                  ),
                ),
                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                    ),
                    VideoActionsWidget(
                      title: 'LOL',
                      icon: Icons.emoji_emotions,
                    ),
                    VideoActionsWidget(
                      title: 'My List',
                      icon: Icons.add,
                    ),
                    VideoActionsWidget(
                      title: 'Share',
                      icon: Icons.share,
                    ),
                    VideoActionsWidget(
                      title: 'Play',
                      icon: Icons.play_arrow,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const VideoActionsWidget({
    super.key,
    required this.title,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhiteColor,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              color: kWhiteColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
