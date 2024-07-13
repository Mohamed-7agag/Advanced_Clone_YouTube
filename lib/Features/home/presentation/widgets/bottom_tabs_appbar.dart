import 'package:advanced_youtube/Core/utils/local_data.dart';
import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/all_videos_cubit/all_videos_cubit.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/tabs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomTabsAppBar extends StatelessWidget {
  const BottomTabsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TabsCubit, TabsItems>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: recommendation.length + 1,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 8, top: 8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: state.index == index
                        ? Colors.black
                        : Colors.grey.shade200,
                  ),
                  child: index == 0
                      ? InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: const Icon(
                            Icons.explore_outlined,
                            size: 22,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            BlocProvider.of<AllVideosCubit>(context)
                                .getAllVideos(recommendation[index - 1]);
                            BlocProvider.of<TabsCubit>(context)
                                .updateTabsItem(TabsItems.values[index]);
                          },
                          child: Text(
                            recommendation[index - 1],
                            style: Styles.textStyle14.copyWith(
                              color: state.index == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
