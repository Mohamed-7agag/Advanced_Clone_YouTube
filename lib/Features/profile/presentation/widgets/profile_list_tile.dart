import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        "Mohamed Hagag",
        style: Styles.textStyle18,
      ),
      subtitle: Text(
        "mh169824@gmail.com",
        style: Styles.textStyle12,
      ),
      leading: CircleAvatar(
        radius: 26,
        backgroundColor: Colors.grey[200],
        backgroundImage: const AssetImage('assets/images/me.jpg'),
      ),
    );
  }
}
