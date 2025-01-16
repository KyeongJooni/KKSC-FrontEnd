import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavigationBar extends StatelessWidget {
  MainNavigationBar({
    super.key,
    required this.navigationShell,
  });

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        backgroundColor: colorTheme.surfaceContainer,
        indicatorColor: colorTheme.secondaryContainer,
        destinations: [
          NavigationDestination(
            label: '홈',
            icon: Icon(
              Icons.home,
              color: colorTheme.onSurfaceVariant,
            ),
          ),
          NavigationDestination(
            label: '시간표',
            icon: Icon(
              Icons.table_chart_outlined,
              color: colorTheme.onSurfaceVariant,
            ),
          ),
          NavigationDestination(
            label: '공지',
            icon: Icon(
              Icons.campaign_outlined,
              color: colorTheme.onSurfaceVariant,
            ),
          ),
          NavigationDestination(
            label: '식당',
            icon: Icon(
              Icons.restaurant,
              color: colorTheme.onSurfaceVariant,
            ),
          ),
          NavigationDestination(
            label: '꿀팁',
            icon: Icon(
              Icons.emoji_objects_outlined,
              color: colorTheme.onSurfaceVariant,
            ),
          ),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
