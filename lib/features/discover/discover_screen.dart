import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_android/constants/gaps.dart';

import '../../constants/sizes.dart';

class DiscoverScreen extends StatelessWidget {
  DiscoverScreen({super.key});

  final tabsList = [
    "top",
    "Users",
    "Videos",
    "Sounds",
    "LIVE",
    "Shopping",
    "Brands"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsList.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text("Discover"),
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            unselectedLabelColor: Colors.grey.shade500,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              for (var tab in tabsList)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              padding: const EdgeInsets.all(
                Sizes.size6,
              ),
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 20,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  AspectRatio(
                    aspectRatio: 9 / 16,
                    child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholder: "assets/images/placeholder.png",
                        image:
                            "https://images.unsplash.com/photo-1586274677440-231405a4c74c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8c2VvdWx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                  ),
                  Gaps.v10,
                  const Text(
                    "This is a very long caption for my tiktok that im upload just now currently, and this is seoul that i loves",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Sizes.size16 + Sizes.size2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v8,
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/108929080?v=4",
                        ),
                      ),
                      Gaps.h4,
                      Expanded(
                        child: Text(
                          "My_Name_is_Sean and this is very long name",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      Gaps.v4,
                      FaIcon(
                        FontAwesomeIcons.heart,
                        size: Sizes.size16,
                        color: Colors.grey.shade500,
                      ),
                      Gaps.h2,
                      Text(
                        "2.5M",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            for (var tab in tabsList.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: Sizes.size28,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
