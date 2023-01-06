import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/providers/page_index_provider.dart';
import 'package:movies_app/screens/home_screen.dart';
import 'package:movies_app/screens/search_screen.dart';
import 'package:movies_app/screens/watch_list_screen.dart';
import 'package:movies_app/sizes.dart';
import 'package:movies_app/styles/app_colors.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});
  static const routeName = "/tabsScreen";

  @override
  Widget build(BuildContext context, ref) {
    const selectedColor = AppColors.strokeColor;
    const unselectedColor = AppColors.hintText;
    final selectedIndex = ref.watch(pageIndexProvider);

    List<Widget> screens = [
      const HomeScreen(),
      const SearchScreen(),
      const WatchListScreen()
    ];

    List<Map<String, dynamic>> navItems = [
      {"iconPath": "assets/icons/home.svg", "label": "Home"},
      {"iconPath": "assets/icons/searchBottom.svg", "label": "Search"},
      {"iconPath": "assets/icons/watchList.svg", "label": "WatchList"}
    ];
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: screens),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.strokeColor),
          ),
        ),
        child: BottomNavigationBar(
          selectedItemColor: selectedColor,
          selectedIconTheme: const IconThemeData(color: selectedColor),
          unselectedItemColor: unselectedColor,
          unselectedIconTheme: const IconThemeData(color: unselectedColor),
          selectedLabelStyle: GoogleFonts.roboto(height: 2),
          selectedFontSize: Sizes.h6,
          currentIndex: selectedIndex,
          onTap: (index) {
            ref.read(pageIndexProvider.notifier).state = index;
          },
          items: navItems
              .map(
                (navItem) => BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SvgPicture.asset(
                      navItem["iconPath"],
                    ),
                  ),
                  label: navItem["label"],
                  activeIcon: SvgPicture.asset(
                    navItem["iconPath"],
                    color: selectedColor,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
