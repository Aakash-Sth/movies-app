import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/providers/auth_provider.dart';

import '../styles/app_colors.dart';
import '../widgets/custom_tab_view.dart';
import '../widgets/search_textfield.dart';
import '../widgets/top_movies_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = "/homeScreen";
  @override
  Widget build(BuildContext context) {
    List<String> tabs = ["Now Playing", "Upcoming", "Top Rated", "Popular"];
    return Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              title: FittedBox(
                child: Text(
                  "What do you want to watch?",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              automaticallyImplyLeading: false,
              centerTitle: false,
              actions: [
                Consumer(
                  builder: (context, ref, child) => PopupMenuButton(
                    icon: Icon(Icons.more_vert, color: Colors.white),
                    color: AppColors.textField,
                    position: PopupMenuPosition.under,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        height: 30,

                        child: const Text("Log Out", style: TextStyle(color: Colors.white)),
                        onTap: () {
                          ref.read(authProvider.notifier).signOut();
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text("Log out successful.")));
                          // Fluttertoast.showToast(msg: "Log out successful.");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SearchTextField(isHomeScreen: true),
                  const TopMoviesList(),
                  TabBar(
                    isScrollable: true,
                    padding: EdgeInsets.only(left: 24),
                    tabAlignment: TabAlignment.start,
                    dividerColor: Colors.transparent,
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(color: AppColors.textField, width: 4),
                    ),
                    tabs: tabs
                        .map(
                          (tab) => Tab(
                            child: Text(tab, style: Theme.of(context).textTheme.headlineSmall),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
          body: CustomTabView(tabs: tabs),
        ),
      ),
    );
  }
}
