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
        style: Styles.textStyle22,
      ),
      subtitle: Text(
        "mh169824@gmail.com",
        style: Styles.textStyle14,
      ),
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey[200],
        backgroundImage: const AssetImage('assets/images/me.jpg'),
      ),
    );
  }
}
