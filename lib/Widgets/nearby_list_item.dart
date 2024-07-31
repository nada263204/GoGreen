import 'package:flutter/material.dart';

import '../core/config/theme.dart';
import '../features/articles/view/widgets/cat_item.dart';
import 'text_scale.dart';

class NearbyListItem extends StatelessWidget {
  const NearbyListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: 14.0),
      padding: const EdgeInsets.only(left: 10.0),
      width: double.infinity,
      height: 140.0,
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.asset(
              'assets/images/nearbyStations.png',
              width: MediaQuery.sizeOf(context).width * 0.4,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '150m | 3min',
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, fontSize: 14.0),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Central station gate A',
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, fontSize: 16.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '30% of Space available',
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, fontSize: 14.0),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CatItem(
                      title: 'Plastic',
                      color: Colors.green,
                    ),
                    SizedBox(width: 20.0),
                    CatItem(
                      title: 'Paper',
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
