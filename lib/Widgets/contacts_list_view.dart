import 'package:flutter/material.dart';

import 'contact_item_widget.dart';

class ContactsListView extends StatelessWidget {
  const ContactsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 6,
      separatorBuilder: (BuildContext context, int index) {
        return const ContactItemWidget();
      },
      itemBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 20.0);
      },
    );
  }
}
