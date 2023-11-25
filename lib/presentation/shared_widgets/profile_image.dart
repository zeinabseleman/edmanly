import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final double? radius;
  final String ?profileImage;

  const ProfileImage({super.key,this.radius,this.profileImage});
  @override
  Widget build(BuildContext context) {
      return CircleAvatar(
        backgroundImage:
        NetworkImage(profileImage!),
        radius:radius?? 25,
      );

  }
}
