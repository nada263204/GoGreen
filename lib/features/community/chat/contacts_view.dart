import 'package:flutter/material.dart';

import '../../../Widgets/contacts_list_view.dart';
import '../../../Widgets/search_form_field.dart';
import '../../../Widgets/text_scale.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: false,
        title: Text(
          'Contacts',
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 18.0),
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SearchFormField(
              bgColor: Color(0xffF7F7FC),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ContactsListView(),
            ),
          ],
        ),
      ),
    );
  }
}
