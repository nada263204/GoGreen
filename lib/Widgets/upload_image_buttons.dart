import 'package:flutter/material.dart';

import '../core/config/theme.dart';

class UploadImageButtons extends StatelessWidget {
  const UploadImageButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primary,
            foregroundColor: AppTheme.white,
          ),
          icon: const Icon(Icons.camera_alt_sharp),
          label: const Text('Take photo'),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primary,
            foregroundColor: AppTheme.white,
          ),
          icon: const Icon(Icons.image),
          label: const Text('Browse gallery'),
        ),
      ],
    );
  }
}
