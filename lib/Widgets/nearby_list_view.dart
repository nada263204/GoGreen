import 'package:flutter/material.dart';

import 'nearby_list_item.dart';

class NearbyListView extends StatelessWidget {
  const NearbyListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 5,
      itemBuilder: (context, index) => const NearbyListItem(),
    );
  }
}
