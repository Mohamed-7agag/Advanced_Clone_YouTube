import 'package:advanced_youtube/Features/home/presentation/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/home_scrollable_content.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: HomeScrollableContnt(),
      ),
    );
  }
}
