import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Screens/settings_screen.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';

import '../../../core/config/theme.dart';
import 'chats_view.dart';
import 'contacts_view.dart';

class ChatNavBar extends StatefulWidget {
  const ChatNavBar({super.key});

  @override
  State<ChatNavBar> createState() => _ChatNavBarState();
}

class _ChatNavBarState extends State<ChatNavBar> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const ChatsView(),
    const ContactsView(),
    Container(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final bool isDark = state.themeMode == ThemeMode.dark;
          return Theme(
            data: Theme.of(context).copyWith(
              canvasColor: isDark ? Colors.black : AppTheme.white,
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              selectedItemColor: AppTheme.primary,
              unselectedItemColor: AppTheme.grey,
              items: const [
                BottomNavigationBarItem(
                  label: 'Chats',
                  icon: Icon(Icons.chat_rounded),
                ),
                BottomNavigationBarItem(
                  label: 'contacts',
                  icon: Icon(Icons.supervised_user_circle_sharp),
                ),
                BottomNavigationBarItem(
                  label: 'Search',
                  icon: Icon(Icons.search),
                ),
                BottomNavigationBarItem(
                  label: 'Settings',
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
