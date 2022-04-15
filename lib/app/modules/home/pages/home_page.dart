import 'package:flutter/material.dart';
import 'package:miio_test/app/components/buttons/custom_menu_button.dart';
import 'package:miio_test/app/components/custom_bottombar.dart';
import 'package:miio_test/app/components/custom_filter.dart';
import 'package:miio_test/app/components/custom_search.dart';
import 'package:miio_test/app/components/post_item.dart';
import 'package:miio_test/core/config/app_icons.dart';
import 'package:miio_test/core/config/app_palettes.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageController = PageController(initialPage: 0);
  final scrollController = ScrollController();
  int currentIndex = 0;

  test() {}

  // @override
  // void initState() {
  //   scrollController.addListener(() {
  //     double maxScroll = scrollController.position.maxScrollExtent;

  //     double currentScroll = scrollController.position.pixels;
  //     double delta = MediaQuery.of(context).size.height * 0.25;
  //     if (maxScroll == currentScroll) {
  //       // whatever you determine here
  //       print('teste');
  //     }
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomSearchBar(
        filter: CustomFilter(
          onTap: (value) {
            debugPrint(value);
          },
        ),
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          RefreshIndicator(
            displacement: 10,
            color: AppColors.accent,
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1));
            },
            child: ListView.builder(
              controller: scrollController,
              itemCount: 20,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Post(currentIndex: index);
              },
            ),
          ),
          Container(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(
        currenIndex: currentIndex,
        items: [
          CustomMenuButton(
            icon: AppIcons.posts(),
            activeIcon: AppIcons.posts(color: AppColors.accent),
          ),
          CustomMenuButton(
            icon: AppIcons.heart(),
            activeIcon: AppIcons.heart(color: AppColors.accent),
          ),
          CustomMenuButton(
            icon: AppIcons.shop(),
            activeIcon: AppIcons.shop(color: AppColors.accent),
          ),
          CustomMenuButton(
            icon: AppIcons.person(),
            activeIcon: AppIcons.person(color: AppColors.accent),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
      ),
    );
  }
}
