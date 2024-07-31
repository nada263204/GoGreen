import 'package:flutter/material.dart';
import 'package:graduation_project/features/community/chat/get_all_users_response.dart';

import 'fav_chat_item.dart';
import 'pin_fav_chat_widget.dart';

class FavChatsListView extends StatelessWidget {
  final List<Data> users;
  const FavChatsListView({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: users.length + 1,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      scrollDirection: Axis.horizontal,
      separatorBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return const PinFavChatWidget();
        } else {
          return FavChatItem(user: users[index - 1]);
        }
      },
      itemBuilder: (BuildContext context, int index) =>
          const SizedBox(width: 16.0),
    );
  }
}
