// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import 'package:graduation_project/Screens/home/location_view.dart';
import 'package:graduation_project/core/config/theme.dart';
import 'package:graduation_project/features/auth/data/models/user.dart';
import 'package:graduation_project/features/object_detecting/presentation/screens/scan_view.dart';

import '../../features/community/feed/view/screens/community_screen.dart';
import 'home_view.dart';
import 'learn_screen.dart';

class NavBar extends StatefulWidget {
  final User? user;
  const NavBar({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  int _currentIndex = 0;

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const LocationView(),
      const ScanView(),
      const LearnScreen(),
      const CommunityScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      onItemSelected: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Theme.of(context).scaffoldBackgroundColor,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style16,
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svg/ic_home.svg',
          colorFilter: ColorFilter.mode(
            _currentIndex == 0 ? AppTheme.primary : AppTheme.grey,
            BlendMode.srcIn,
          ),
        ),
        title: "Home",
        activeColorPrimary: AppTheme.primary,
        inactiveColorPrimary: AppTheme.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svg/ic_location.svg',
          colorFilter: ColorFilter.mode(
            _currentIndex == 1 ? AppTheme.primary : AppTheme.grey,
            BlendMode.srcIn,
          ),
        ),
        title: "Location",
        activeColorPrimary: AppTheme.primary,
        inactiveColorPrimary: AppTheme.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/svg/ic_scan.svg'),
        title: "Scan",
        activeColorPrimary: AppTheme.primaryLight,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svg/ic_learn.svg',
          colorFilter: ColorFilter.mode(
            _currentIndex == 3 ? AppTheme.primary : AppTheme.grey,
            BlendMode.srcIn,
          ),
        ),
        title: "Learn",
        activeColorPrimary: AppTheme.primary,
        inactiveColorPrimary: AppTheme.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svg/ic_com.svg',
          colorFilter: ColorFilter.mode(
            _currentIndex == 4 ? AppTheme.primary : AppTheme.grey,
            BlendMode.srcIn,
          ),
        ),
        title: "Community",
        activeColorPrimary: AppTheme.primary,
        inactiveColorPrimary: AppTheme.grey,
      ),
    ];
  }
}
