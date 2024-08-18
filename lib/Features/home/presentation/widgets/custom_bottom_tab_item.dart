import 'package:advanced_youtube/Core/utils/local_data.dart';
import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/all_videos_cubit/all_videos_cubit.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/tabs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomTabItem extends StatelessWidget {
  const CustomBottomTabItem(
      {super.key, required this.isSelected, required this.index});
  final bool isSelected;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? Colors.black : Colors.grey.shade200,
      ),
      child: index == 0
          ? GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: const Icon(
                Icons.explore_outlined,
                size: 22,
              ),
            )
          : GestureDetector(
              onTap: () {
                BlocProvider.of<AllVideosCubit>(context)
                    .getAllVideos(recommendation[index - 1]);
                BlocProvider.of<TabsCubit>(context)
                    .updateTabsItem(TabsItems.values[index]);
              },
              child: Text(
                recommendation[index - 1],
                style: Styles.textStyle14.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
    );
  }
}
