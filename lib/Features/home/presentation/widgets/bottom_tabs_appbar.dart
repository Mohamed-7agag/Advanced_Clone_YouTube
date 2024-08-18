import 'package:advanced_youtube/Core/utils/local_data.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/tabs_cubit.dart';
import 'package:advanced_youtube/Features/home/presentation/widgets/custom_bottom_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomTabsAppBar extends StatelessWidget {
  const BottomTabsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsCubit, TabsItems>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: recommendation.asMap().entries.map((e) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  bottom: 8,
                  top: 8,
                  right: e.key == recommendation.length - 1 ? 14 : 0,
                ),
                child: CustomBottomTabItem(
                  index: e.key,
                  isSelected: e.key == state.index,
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
