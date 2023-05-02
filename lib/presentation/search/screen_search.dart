import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/search/widget/search_idle.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/presentation/search/widget/search_result.dart';
import '../../api/api_service.dart';
import '../../api/model.dart';
import '../../core/constants.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  final TextEditingController _searchController = TextEditingController();
  List<Result> _suggestions = [];

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
                controller: _searchController,
                onChanged: (query) async {
                  final suggestions = await TmdbApi.getSearchSuggestions(query);
                  setState(() {
                    _suggestions = suggestions;
                  });
                },
              ),
              // kHeight,
              // const Expanded(child: SearchIdleWidget()),
              // // const Expanded(child: SearchResultWidget()),
              if (_suggestions.isNotEmpty)
                Expanded(
                  child: SearchIdleWidget(
                    suggestions: _suggestions,
                  ),
                )
              // Expanded(
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     itemBuilder: (context, index) => ListTile(
              //       title: Text(
              //         _suggestions[index].title!,
              //         style: const TextStyle(
              //           color: kWhiteColor,
              //         ),
              //       ),
              //       onTap: () {
              //         // Select suggestion and perform search here
              //       },
              //     ),
              //     itemCount: _suggestions.length,
              //   ),
              // )
              else
                const Expanded(child: SearchResultWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
