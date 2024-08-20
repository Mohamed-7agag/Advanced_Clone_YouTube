// ignore_for_file: must_be_immutable

import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Features/search/presentation/view_model/cubit/search_video_cubit.dart';
import 'package:advanced_youtube/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key});

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Styles.textStyle18,
      cursorColor: Colors.red,
      controller: search,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        hintText: S.of(context).search,
        hintStyle: Styles.textStyle15,
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(end: 8),
          child: IconButton(
            onPressed: () {
              BlocProvider.of<SearchVideoCubit>(context)
                  .getSearchedVideos(text: search.text.toString());
            },
            icon: const Icon(
              CupertinoIcons.search,
              color: Colors.red,
            ),
          ),
        ),
        enabledBorder: outlinedInputBorder(),
        focusedBorder: outlinedInputBorder(),
      ),
    );
  }

  OutlineInputBorder outlinedInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(70)),
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    );
  }
}
