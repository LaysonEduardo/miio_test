import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_test/core/components/buttons/custom_icon_button.dart';
import 'package:miio_test/core/components/buttons/featured_button.dart';
import 'package:miio_test/core/components/comments_box.dart';
import 'package:miio_test/core/components/post_header.dart';
import 'package:miio_test/core/components/user_card.dart';
import 'package:miio_test/core/config/app_icons.dart';
import 'package:miio_test/core/config/app_palettes.dart';

class PostPage extends StatefulWidget {
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            toolbarHeight: 70,
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            titleSpacing: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      CustomIconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.lightGrey,
                        ),
                        function: () => Modular.to.pop(),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Wrap(
                  direction: Axis.vertical,
                  spacing: 5,
                  children: [
                    CustomIconButton(
                      icon: AppIcons.heart(),
                      function: () => Modular.to.pop(),
                    ),
                    CustomIconButton(
                      icon: const Icon(
                        Icons.share_outlined,
                        color: AppColors.lightGrey,
                      ),
                      function: () => Modular.to.pop(),
                    ),
                  ],
                ),
              ),
            ],
            flexibleSpace: Stack(
              children: [
                Center(
                  child: Image.network(
                    'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
                Positioned(
                  child: Column(
                    children: [
                      const FeaturedButton(),
                      Container(
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                  bottom: -1,
                  left: 0,
                  right: 0,
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: const [
                    PostHeader(),
                    UserCard(),
                    Divider(color: AppColors.lightGrey, height: 40),
                    CommentsBox(),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
