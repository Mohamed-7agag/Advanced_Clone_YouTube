import 'package:advanced_youtube/Core/widgets/custom_error_widget.dart';
import 'package:advanced_youtube/Core/widgets/custom_loading_widget.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/all_shorts_videos/all_shorts_videos_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_list_view_item.dart';

class ShortsVideosViewBody extends StatelessWidget {
  const ShortsVideosViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllShortsVideosCubit, AllShortsVideosState>(
      builder: (context, state) {
        if (state is AllShortsVideosSuccess) {
          return ListView.builder(
            itemCount: state.shortsVideos.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: HomeListViewItem(
                  videoModel: state.shortsVideos[index],
                ),
              );
            },
          );
        } else if (state is AllShortsVideosFailure) {
          return const CustomErrorWidget();
        }
        return const CustomLoadingWidget();
      },
    );
  }
}
