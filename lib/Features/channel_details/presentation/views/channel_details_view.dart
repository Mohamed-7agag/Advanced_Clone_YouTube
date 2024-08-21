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
        backgroundColor: Colors.white,
        titleSpacing: 0,
        title: Expanded(
          child: Text(
            channelDetailModel.snippet!.title!.toString(),
            style: Styles.textStyle15,
          ),
        ),
        actions: [
          const Icon(
            Icons.more_vert,
            size: 26,
          ),
          SizedBox(width: 14.w),
        ],
      ),
      body: ChannelDetailsViewBody(channelDetailModel: channelDetailModel),
    );
  }
}
