import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_test/app/modules/post/bloc/post_bloc.dart';
import 'package:miio_test/app/modules/post/events/post_events.dart';
import 'package:miio_test/app/modules/post/state/post_state.dart';

import 'package:miio_test/core/components/buttons/custom_icon_button.dart';
import 'package:miio_test/core/components/buttons/featured_button.dart';
import 'package:miio_test/core/components/comments_box.dart';
import 'package:miio_test/core/components/post_header.dart';
import 'package:miio_test/core/components/user_card.dart';
import 'package:miio_test/core/config/app_icons.dart';
import 'package:miio_test/core/config/app_palettes.dart';

class PostPage extends StatefulWidget {
  final int id;
  const PostPage({required this.id});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _bloc = Modular.get<PostBloc>();
  @override
  void initState() {
    _bloc.add(FetchPost(widget.id));
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostBloc, PostState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state is PostBlankState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostSuccessState) {
              return CustomScrollView(
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
                            state.post!.image,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        Positioned(
                          child: Column(
                            children: [
                              FeaturedButton(),
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
                          children: [
                            PostHeader(
                              title: state.post!.title,
                              description: state.post!.body,
                            ),
                            UserCard(user: state.user!),
                            const Divider(color: AppColors.lightGrey, height: 40),
                            CommentsBox(comments: state.comments),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              );
            }
            return Container();
          }),
    );
  }
}
