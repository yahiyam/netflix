import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/presentation/search/widget/search_result.dart';

import '../../core/constants.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
              ),
              kHeight,
              // const Expanded(child: SearchIdleWidget()),
              const Expanded(child: SearchResultWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
