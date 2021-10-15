import 'package:flutter/material.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget(
      {Key? key,
      required this.height,
      required this.width,
      required this.image})
      : super(key: key);

  final double height;
  final double width;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(fit: BoxFit.cover, image: image.image)),
    );
  }
}
