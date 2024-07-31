import 'package:flutter/cupertino.dart';
import 'package:graduation_project/features/community/chat/chat_details_screen.dart';
import 'package:graduation_project/features/community/chat/get_all_users_response.dart';

import 'chat_item_widget.dart';

class ChatsListView extends StatelessWidget {
  final List<Data> users;
  const ChatsListView({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => ChatDetailsScreen(user: users[index])),
            );
          },
          child: ChatItem(user: users[index]),
        );
      },
    );
  }
}
