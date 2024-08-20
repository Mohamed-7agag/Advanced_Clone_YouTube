// ignore_for_file: must_be_immutable
import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Features/profile/presentation/views/profile_view.dart';
import 'package:advanced_youtube/Features/subscription/presentation/views/subscription_view.dart';
import 'package:advanced_youtube/bottom_appbar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Features/home/presentation/views/home_view.dart';
import 'Features/home/presentation/views/shorts_videos_view.dart';
import 'Features/home/presentation/widgets/plus_bottomsheet.dart';

class CustomBottomAppBar extends StatelessWidget {
  CustomBottomAppBar({super.key});

  List<Widget> screens = [
    const HomeView(),
    const ShortsVideosView(),
    const SubscriptionView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarCubit, NavigationItem>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedLabelStyle: Styles.textStyle11,
            showUnselectedLabels: false,
            fixedColor: Colors.black,
            selectedIconTheme: const IconThemeData(color: Colors.black),
            unselectedIconTheme: const IconThemeData(color: Colors.black),
            type: BottomNavigationBarType.fixed,
            currentIndex: state.index,
            onTap: (index) {
              if (index == 2) {
                openBottomSheet(context);
              } else {
                context
                    .read<BottomNavigationBarCubit>()
                    .updateNavigationItem(NavigationItem.values[index]);
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: state.index == 0
                    ? const Icon(Icons.home_rounded)
                    : const Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: state.index == 1
                    ? SvgPicture.asset("assets/images/bottom_short_on.svg")
                    : SvgPicture.asset("assets/images/bottom_short_off.svg"),
                label: "Shorts",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/plus.svg", width: 33),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: state.index == 3
                    ? const Icon(Icons.subscriptions)
                    : const Icon(Icons.subscriptions_outlined),
                label: "Subscription",
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: const AssetImage('assets/images/me.jpg'),
                ),
                label: "You",
              ),
            ],
          ),
          body: IndexedStack(
            index: state.index >= 2 ? state.index - 1 : state.index,
            children: screens,
          ),
        );
      },
    );
  }
}
