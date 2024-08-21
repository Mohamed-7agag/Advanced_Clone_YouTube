import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/all_videos_cubit/all_videos_cubit.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/tabs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomTabItem extends StatelessWidget {
  const CustomBottomTabItem({
    super.key,
    required this.isSelected,
    required this.index,
    required this.recommendation,
  });
  final bool isSelected;
  final int index;
  final List<String> recommendation;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                    .getAllVideos(TabsItems.values[index].name, 'medium');
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
