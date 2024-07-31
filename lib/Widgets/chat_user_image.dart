import 'package:flutter/material.dart';

class ChatUserImage extends StatelessWidget {
  const ChatUserImage({
    super.key,
    required this.img,
  });

  final String img;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 35.0,
          backgroundImage: AssetImage(img),
        ),
        const Positioned(
          right: 5.0,
          bottom: 3.0,
          child: CircleAvatar(
            radius: 8.0,
            backgroundColor: Color(0xff0FE16D),
          ),
        ),
      ],
    );
  }
}
