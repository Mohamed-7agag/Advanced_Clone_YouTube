import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Core/widgets/custom_error_widget.dart';
import 'package:advanced_youtube/Features/channel_details/presentation/widgets/channel_details_video_item.dart';
import 'package:advanced_youtube/Features/search/presentation/view_model/cubit/search_video_cubit.dart';
import 'package:advanced_youtube/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchVideoCubit, SearchVideoState>(
      builder: (context, state) {
        if (state is SearchVideoSuccess) {
          return state.searchedVideos.isEmpty
              ? Center(
                  child: Text(
                    S.of(context).noVideosFound,
                    style: Styles.textStyle20
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: state.searchedVideos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ChannelDetailsVideoItem(
                        videoModel: state.searchedVideos[index],
                      ),
                    );
                  },
                );
        } else if (state is SearchVideoFailure) {
          return const CustomErrorWidget();
        } else if (state is SearchVideoLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
        return Center(
          child: Text(
            S.of(context).searchForVideos,
            style: Styles.textStyle16,
          ),
        );
      },
    );
  }
}
