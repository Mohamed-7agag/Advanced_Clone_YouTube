import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/data/models/channel_detail_model/channel_detail_model.dart';
import '../widgets/channel_details_view_body.dart';

class ChannelDetailsView extends StatelessWidget {
  const ChannelDetailsView({super.key, required this.channelDetailModel});
  final ChannelDetailModel channelDetailModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: channelDetailModel.snippet!.title!.length <= 20
            ? Text(
                channelDetailModel.snippet!.title!,
                style: Styles.textStyle15,
              )
            : Text(
                channelDetailModel.snippet!.title!.toString().substring(0, 20),
                style: Styles.textStyle15,
              ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.cast,
            ),
          ),
          IconButton(
            onPressed: () {
              //showSearch(context: context, delegate: DataSearch());
            },
            icon: const Icon(
              Icons.search_rounded,
              size: 25,
            ),
          ),
          const Icon(
            Icons.more_vert,
            size: 26,
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: SafeArea(
        child: ChannelDetailsViewBody(
          channelDetailModel: channelDetailModel,
        ),
      ),
    );
  }
}
