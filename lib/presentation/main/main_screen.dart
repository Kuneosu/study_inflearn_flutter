import 'package:flutter/material.dart';
import 'package:inf_fl/ui/color_st.dart';

class MainScreen extends StatelessWidget {
  final Widget body;
  final int currentPageIndex;
  final void Function(int index) onChangeIndex;
  const MainScreen({
    super.key,
    required this.body,
    required this.currentPageIndex,
    required this.onChangeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: Colors.transparent,
        onDestinationSelected: onChangeIndex,
        selectedIndex: currentPageIndex,
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined, color: CST.gray4),
            selectedIcon: Stack(
              children: [
                Icon(Icons.home, color: CST.primary40),
                Icon(Icons.home_outlined, color: CST.primary100),
              ],
            ),
            label: 'Home',
          ),
          const NavigationDestination(
            icon: Icon(Icons.bookmark_border, color: CST.gray4),
            selectedIcon: Stack(
              children: [
                Icon(Icons.bookmark, color: CST.primary40),
                Icon(Icons.bookmark_border, color: CST.primary100),
              ],
            ),
            label: 'Bookmark',
          ),
          const NavigationDestination(
            icon: Icon(Icons.notifications_outlined, color: CST.gray4),
            selectedIcon: Stack(
              children: [
                Icon(Icons.notifications, color: CST.primary40),
                Icon(Icons.notifications_outlined, color: CST.primary100),
              ],
            ),
            label: 'Notifications',
          ),
          const NavigationDestination(
            icon: Icon(Icons.person_outline, color: CST.gray4),
            selectedIcon: Stack(
              children: [
                Icon(Icons.person, color: CST.primary40),
                Icon(Icons.person_outline, color: CST.primary100),
              ],
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
