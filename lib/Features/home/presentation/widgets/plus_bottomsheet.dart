import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Features/home/presentation/widgets/bottom_sheet_item.dart';
import 'package:advanced_youtube/generated/l10n.dart';
import 'package:flutter/material.dart';

openBottomSheet(context) {
  showModalBottomSheet(
    builder: (context) {
      return Container(
        padding: const EdgeInsetsDirectional.only(
            start: 14, top: 8, end: 8, bottom: 20),
        height: 320,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14), topRight: Radius.circular(14)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).create,
                  style: Styles.textStyle22,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      size: 30,
                      color: Colors.black,
                    )),
              ],
            ),
            BottomSheetItem(
              text: S.of(context).createShort,
              icon: const Icon(
                Icons.edit,
                color: Colors.black87,
                size: 22,
              ),
            ),
            BottomSheetItem(
              text: S.of(context).uploadVideo,
              icon: const Icon(
                Icons.upload_rounded,
                color: Colors.black87,
                size: 27,
              ),
            ),
            BottomSheetItem(
              text: S.of(context).goLive,
              icon: const Icon(
                Icons.podcasts_rounded,
                color: Colors.black87,
                size: 22,
              ),
            ),
            BottomSheetItem(
              text: S.of(context).createPost,
              icon: const Icon(
                Icons.border_color_rounded,
                color: Colors.black87,
                size: 22,
              ),
            ),
          ],
        ),
      );
    },
    context: context,
  );
}
