import 'package:community_managment/app/extensions/empty_padding_extension.dart';
import 'package:community_managment/app/modules/home/controllers/home_controller.dart';
import 'package:community_managment/app/routes/app_pages.dart';
import 'package:community_managment/app/widgets/textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<HomeController>();
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: const Text(
            'About life',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: false,
          backgroundColor: Colors.black87,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.adb,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.adb,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            const Text(
              "Profile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            5.ph,
            Text(
              "Example",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
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
                        ]),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0),
                        const Color(0xFFFFFFFF).withOpacity(0.08),
                      ],
                    ),
                    // color: Colors.amber,
                    width: double.infinity,
                    child: const Center(
                      child: TextInputField(
                        hinttext: 'Status',
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
                // indicatorColor: Colors.purple,
                // indicatorPadding: const EdgeInsets.all(10000),
                // indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.red,
                indicator: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10),
                ),
                tabs: const [
                  Tab(
                    child: Text(
                      "Recent",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Tab(
                      child: Text(
                        "Friends",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                  Tab(
                      child: Text(
                        "Newbies",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            ),
            Container(
              height: 200,
              child: const TabBarView(
                children: [
                  Center(
                    child: Text("It's cloudy here"),
                  ),
                  Center(
                    child: Text("It's rainy here"),
                  ),
                  Center(
                    child: Text("It's sunny here"),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(color: Colors.blue),
          unselectedLabelStyle: const TextStyle(color: Colors.blue),
          type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.event_note,color: Colors.blue,),label: 'Events'),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance_outlined,color: Colors.blue,),label: 'Communities'),
            BottomNavigationBarItem(icon: Icon(Icons.person_search,color: Colors.blue,),label: 'Connect'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined,color: Colors.blue,),label: 'Profile'),

          ],),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Get.toNamed(Routes.ADD_EVENT);
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
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.green,
        border: isStory
            ? Border.all(
          color: Colors.pink,
        )
            : null,
      ),
      child: Container(
        margin: isStory ? const EdgeInsets.all(5) : EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
