import 'package:flutter/material.dart';

import '../Screens/edit_profile_screen.dart';
import '../core/config/theme.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (context) => const EditProfileScreen(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primary,
        foregroundColor: AppTheme.white,
        surfaceTintColor: Colors.transparent,
      ),
      child: const Text('Edit Profile'),
    );
  }
}
