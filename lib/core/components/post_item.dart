import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_test/app/modules/configuration/models/post_model.dart';
import 'package:shimmer/shimmer.dart';

class Post extends StatelessWidget {
  final PostModel post;
  const Post({required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 450, maxHeight: 250),
              margin: const EdgeInsets.only(bottom: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Shimmer.fromColors(
                      baseColor: const Color(0xffDADDDA),
                      highlightColor: const Color(0xffF1F3F2),
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 450),
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.only(bottom: 30),
                      ),
                    ),
                    Image.network(
                      post.image,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 10),
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(post.userImage),
                ),
                title: Text(
                  post.title,
                  maxLines: 2,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  post.body,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  Modular.to.pushNamed('/post/${post.id.toString()}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Shimmer.fromColors(
              baseColor: const Color(0xffDADDDA),
              highlightColor: const Color(0xffF1F3F2),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 450),
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.only(bottom: 30),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 10),
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ListTile(
                leading: Shimmer.fromColors(
                  baseColor: const Color(0xffDADDDA),
                  highlightColor: const Color(0xffF1F3F2),
                  child: const CircleAvatar(),
                ),
                title: Shimmer.fromColors(
                  baseColor: const Color(0xffDADDDA),
                  highlightColor: const Color(0xffF1F3F2),
                  child: Container(
                    color: Colors.white,
                    height: 10,
                    width: double.infinity,
                  ),
                ),
                subtitle: Shimmer.fromColors(
                  baseColor: const Color(0xffDADDDA),
                  highlightColor: const Color(0xffF1F3F2),
                  child: Container(
                    color: Colors.white,
                    height: 10,
                    width: double.infinity,
                  ),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
