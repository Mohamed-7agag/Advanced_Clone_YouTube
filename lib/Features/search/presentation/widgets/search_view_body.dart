import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'custom_text_field.dart';
import 'search_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          CustomTextField(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 6),
            child: Text(
              S.of(context).searchResult,
              style: Styles.textStyle18.copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(height: 20),
          const Expanded(
            child: SearchListView(),
          ),
        ],
      ),
    );
  }
}
