import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/theme.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 105.0,
          margin: const EdgeInsets.only(bottom: 35.0),
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.23,
            vertical: 20.0,
          ).copyWith(right: 20.0),
          decoration: BoxDecoration(
            color: const Color(0xffD8EBD9),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Go green',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.close,
                    color: AppTheme.black,
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              const Text(
                'You gain 3 points',
                style: TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6.0),
              const Text(
                '6 min',
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -25.0,
          left: 20.0,
          child: Container(
            width: 60.0,
            height: 60.0,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/g_logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
