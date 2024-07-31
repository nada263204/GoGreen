import 'package:flutter/material.dart';

import '../core/config/theme.dart';
import 'text_scale.dart';

class NearbyTitle extends StatelessWidget {
  const NearbyTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Nearby bin station',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: getResponsiveFontSize(context, fontSize: 20.0),
                ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Show All',
              style: TextStyle(color: AppTheme.primaryLight),
            ),
          ),
        ],
      ),
    );
  }
}
