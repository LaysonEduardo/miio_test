import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_test/app/modules/home/bloc/home_bloc.dart';
import 'package:miio_test/app/modules/home/event/home_event.dart';
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
  final pageController = PageController(initialPage: 0);
  final bloc = Modular.get<HomeBloc>();
  int currentIndex = 0;

  @override
  void initState() {
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
          bloc.add(FetchPosts());
        },
      ),
      body: PageView(
        controller: pageController,
        children: [
          BlocBuilder<HomeBloc, HomeState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is HomeBlankState) {
                  return const Text('blank');
                } else if (state is HomeSuccessState) {
                  return RefreshIndicator(
                    displacement: 10,
                    color: AppColors.accent,
                    onRefresh: () async {
                      await Future.delayed(const Duration(seconds: 1));
                    },
                    child: ListView.builder(
                      itemCount: 20,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Post(currentIndex: index);
                      },
                    ),
                  );
                }
                return Container();
              }),
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
