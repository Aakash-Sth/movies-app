import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/providers/watch_list_provider.dart';
import 'package:movies_app/styles/app_colors.dart';
import 'package:movies_app/widgets/watch_list_item.dart';

class WatchListScreen extends ConsumerWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WatchList",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final watchList = ref.watch(watchListProvider);

          return watchList.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/emptyBox.svg",
                        color: AppColors.strokeColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "There is no movie yet!",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      Text(
                        "Find your movie by type, title,\n categories, years, etc ",
                        style: Theme.of(context).textTheme.subtitle2!.apply(
                              color: AppColors.hintText,
                            ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    final movie = watchList[index];
                    return WatchListItem(
                      movie: movie,
                    );
                  },
                  itemCount: watchList.length,
                );
        },
      ),
    );
  }
}
