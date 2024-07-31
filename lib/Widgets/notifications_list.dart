import 'package:flutter/material.dart';

import 'notification_item.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return const NotificationItem();
      },
    );
  }
}
