import 'package:community_managment/app/extensions/empty_padding_extension.dart';
import 'package:community_managment/app/extensions/text_theme.dart';
import 'package:community_managment/app/modules/home/views/recent_view.dart';
import 'package:community_managment/app/routes/app_pages.dart';
import 'package:community_managment/app/widgets/textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: Text(
            'HTF Community',
            style: TextStyle(color: Colors.white).copyWith(fontSize: 14),
          ),
          titleSpacing: 0,
          leadingWidth: 12,
          centerTitle: false,
          backgroundColor: Colors.black87,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.PROFILE);
              },
              icon: const Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            const Text(
              "Hello Nikhil!",
              style: titleTextStyle,
            ),
            5.ph,
            Text(
              "What's bothering you",
              style: lableGreyTextStyle,
            ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                10.pw,
                const Flexible(
                  child: StroyWidget(),
                ),
                10.pw,
                Expanded(
                  flex: 5,
                  child: GlassmorphicContainer(
                    height: 60,
                    borderRadius: 20,
                    blur: 20,
                    alignment: Alignment.bottomCenter,
                    border: 2,
                    linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.2),
                        const Color(0xFFFFFFFF).withOpacity(0.05),
                      ],
                      stops: const [
                        0.1,
                        1,
                      ],
                    ),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0),
                        const Color(0xFFFFFFFF).withOpacity(0.08),
                      ],
                    ),
                    width: double.infinity,
                    child: const Center(
                      child: TextInputField(
                        hinttext: 'Share anything you want',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                StroyWidget(isStory: true),
                StroyWidget(isStory: true),
                StroyWidget(isStory: true),
                StroyWidget(isStory: true),
              ],
            ),
            10.ph,
            GlassmorphicContainer(
              width: double.infinity,
              height: 50,
              borderRadius: 20,
              blur: 20,
              alignment: Alignment.bottomCenter,
              border: 2,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFFffffff).withOpacity(0.2),
                    const Color(0xFFFFFFFF).withOpacity(0.05),
                  ],
                  stops: const [
                    0.1,
                    1,
                  ]),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFffffff).withOpacity(0),
                  const Color(0xFFFFFFFF).withOpacity(0.08),
                ],
              ),
              child: TabBar(
                unselectedLabelColor: Colors.red,
                indicator: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10),
                ),
                tabs: const [
                  Tab(
                    child: Text(
                      "Upcoming",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Tab(
                      child: Text(
                        "Past",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                  Tab(
                      child: Text(
                        "Workshops",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 600,
              child: TabBarView(
                children: [
                  RecentView(),
                  Center(
                    child: Text(
                      "It's friends page",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Center(
                    child: Text(
                      "It's newbies page",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          // Get.toNamed(Routes.ADD_EVENT);
          if (controller.animationController.status == AnimationStatus.forward ||
              controller.animationController.status == AnimationStatus.completed) {
            controller.animationController.reverse();
          } else {
            controller.animationController.forward();
            Get.toNamed(Routes.ADD_EVENT);
          }
        },child: const Icon(Icons.add)),
      ),
    );
  }
}

class StroyWidget extends StatelessWidget {
  final bool isStory;
  const StroyWidget({
    Key? key,
    this.isStory = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.green,
        border: isStory
            ? Border.all(
          color: Colors.pink,
          width: 2,
        )
            : null,
      ),
      child: Container(
        margin: isStory ? const EdgeInsets.all(5) : EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}