import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/theme.dart';

import '../Widgets/nearby_list_item.dart';
import '../Widgets/search_form_field.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double safeArea = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/map.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0)
              .add(EdgeInsets.only(top: safeArea)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: SearchFormField(
                  hint: 'Search for nearest station',
                  bgColor: AppTheme.white,
                ),
              ),
              const NearbyListItem(),
            ],
          ),
        ),
      ),
    );
  }
}
