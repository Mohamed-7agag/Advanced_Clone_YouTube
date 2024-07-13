import 'package:advanced_youtube/Features/home/presentation/widgets/bottom_sheet_item.dart';
import 'package:flutter/material.dart';

openBottomSheet(context) {
  showModalBottomSheet(
    builder: (context) {
      return Container(
        padding: const EdgeInsets.only(left: 12, top: 10, right: 6, bottom: 20),
        height: 360,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Create",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      size: 35,
                      color: Colors.black,
                    )),
              ],
            ),
            const BottomSheetItem(
              text: "Create a Short",
              icon: Icon(
                Icons.edit,
                color: Colors.black87,
                size: 22,
              ),
            ),
            const BottomSheetItem(
              text: "Upload a Video",
              icon: Icon(
                Icons.upload_rounded,
                color: Colors.black87,
                size: 27,
              ),
            ),
            const BottomSheetItem(
              text: "Go Live",
              icon: Icon(
                Icons.podcasts_rounded,
                color: Colors.black87,
                size: 22,
              ),
            ),
            const BottomSheetItem(
              text: "Create a Post",
              icon: Icon(
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
