import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const Text(
          "Friends",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          "Captured and imprisoned by the Last Men, a very special deer boy named Gus takes action to help his newfound hybrid friends escape before it's too late.",
          style: TextStyle(
            color: kGreyColor,
          ),
        ),
        kHeight50,
        const VideoWidget(),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
              icon: Icons.share,
              title: 'Share',
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: 'My List',
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
          ],
        )
      ],
    );
  }
}
