import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_test/app/modules/home/bloc/home_bloc.dart';
import 'package:miio_test/app/modules/home/events/home_events.dart';
import 'package:miio_test/app/modules/home/pages/likes_page.dart';
import 'package:miio_test/app/modules/home/pages/orders_page.dart';
import 'package:miio_test/app/modules/home/pages/profile_page.dart';
import 'package:miio_test/app/modules/home/state/home_state.dart';
import 'package:miio_test/core/components/buttons/custom_menu_button.dart';
import 'package:miio_test/core/components/custom_bottombar.dart';
import 'package:miio_test/core/components/custom_filter.dart';
import 'package:miio_test/core/components/custom_search.dart';
import 'package:miio_test/core/components/post_item.dart';
import 'package:miio_test/core/config/app_icons.dart';
import 'package:miio_test/core/config/app_palettes.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  final _scrollController = ScrollController();
  final _bloc = Modular.get<HomeBloc>();
  int currentIndex = 0;

  @override
  void initState() {
    _bloc.add(FetchPosts());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _bloc.add(IncrementPosts());
      }
    });
    super.initState();
  }

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
        onChanged: (string) {
          _bloc.add(SearchPosts(string: string));
        },
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          BlocBuilder<HomeBloc, HomeState>(
              bloc: _bloc,
              builder: (context, state) {
                if (state is HomeBlankState) {
                  return ListView.builder(itemBuilder: (context, index) {
                    return PostShimmer();
                  });
                } else if (state is HomeSuccessState) {
                  return RefreshIndicator(
                    displacement: 5,
                    onRefresh: () async {
                      _bloc.add(FetchPosts());
                      await Future.delayed(const Duration(seconds: 1));
                    },
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: state.posts.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Post(post: state.posts[index]);
                      },
                    ),
                  );
                }
                return Container();
              }),
          LikesPage(),
          OrdersPage(),
          ProfilePage(),
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
          // _bloc.add(IncrementPosts());
          setState(() {
            currentIndex = index;
          });
          _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
      ),
    );
  }
}
