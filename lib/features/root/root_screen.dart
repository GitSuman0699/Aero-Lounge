import 'package:aero_lounge/features/root/dashboard/dashboard_screen.dart';
import 'package:aero_lounge/features/root/logbook/logbook_screen.dart';
import 'package:aero_lounge/features/root/profile/profile_screen.dart';
import 'package:aero_lounge/features/root/saved_aircraft/saved_aircraft_screen.dart';
import 'package:aero_lounge/features/root/search_aircraft/search_aircraft_screen.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;
  int _previousIndex = 0;

  final List<Widget> _pages = [
    DashboardScreen(key: ValueKey('dashboard')),
    SavedAircraftScreen(key: ValueKey('saved_aircraft')),
    LogbookScreen(key: ValueKey('logbook')),
    SearchAircraftScreen(key: ValueKey('search_aircraft')),
    ProfileScreen(key: ValueKey('profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        transitionBuilder: (child, animation) {
          final isForward = _currentIndex > _previousIndex;
          final beginOffset = isForward ? Offset(1.0, 0.0) : Offset(-1.0, 0.0);
          final endOffset = Offset.zero;

          final offsetAnimation = Tween<Offset>(
            begin: beginOffset,
            end: endOffset,
          ).animate(animation);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        backgroundColor: TColors.buttonPrimary,
        selectedItemColor: TColors.activeBottomNavigationIcon,
        unselectedItemColor: TColors.hintText,
        selectedLabelStyle: TextTheme.of(context)
            .titleSmall
            ?.copyWith(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextTheme.of(context).bodySmall,
        currentIndex: _currentIndex,
        selectedFontSize: 12,
        onTap: (newIndex) {
          if (newIndex == _currentIndex) return;

          setState(() {
            _previousIndex = _currentIndex;
            _currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home_rounded,
                size: 26,
              ),
              icon: Icon(
                Icons.home_rounded,
                size: 25,
              ),
              label: 'Hanger'),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: SvgPicture.asset(
                  Assets.assetsRootSavedIcon,
                  height: 20,
                  width: 20,
                  colorFilter: const ColorFilter.mode(
                    TColors.activeBottomNavigationIcon,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: SvgPicture.asset(
                  Assets.assetsRootSavedIcon,
                  height: 18,
                  width: 18,
                ),
              ),
              label: 'Saved'),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: SvgPicture.asset(
                  Assets.assetsRootLogbookIcon,
                  height: 18,
                  width: 18,
                  colorFilter: const ColorFilter.mode(
                    TColors.activeBottomNavigationIcon,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: SvgPicture.asset(
                  Assets.assetsRootLogbookIcon,
                  height: 18,
                  width: 18,
                ),
              ),
              label: 'Logbook'),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: SvgPicture.asset(
                  Assets.assetsRootSearchIcon,
                  height: 18,
                  width: 18,
                  colorFilter: const ColorFilter.mode(
                    TColors.activeBottomNavigationIcon,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: SvgPicture.asset(
                  Assets.assetsRootSearchIcon,
                  height: 18,
                  width: 18,
                ),
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: SvgPicture.asset(
                  Assets.assetsRootProfileIcon,
                  height: 18,
                  width: 18,
                  colorFilter: const ColorFilter.mode(
                    TColors.activeBottomNavigationIcon,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: SvgPicture.asset(
                  Assets.assetsRootProfileIcon,
                  height: 18,
                  width: 18,
                ),
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}
