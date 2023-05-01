import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/number_title_card.dart';
import '../widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotification = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotification,
        builder: (context, value, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotification.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotification.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: const [
                    BackgroundCard(),
                    kHeight,
                    MainTitleCard(title: 'Released in the past year'),
                    kHeight,
                    MainTitleCard(title: 'Treanding Now'),
                    kHeight,
                    NumberTitleCard(),
                    kHeight,
                    MainTitleCard(title: 'Tense Dramas'),
                    kHeight,
                    MainTitleCard(title: 'South Indian Cinema'),
                    kHeight,
                  ],
                ),
                scrollNotification.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 2000),
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(.3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  kNetflixImage,
                                  width: 60,
                                  height: 60,
                                ),
                                const Spacer(),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "TV Shows",
                                  style: kHomeTileText,
                                ),
                                Text(
                                  "Movies",
                                  style: kHomeTileText,
                                ),
                                Text(
                                  "Categories",
                                  style: kHomeTileText,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : kHeight,
              ],
            ),
          );
        },
      ),
    );
  }
}
