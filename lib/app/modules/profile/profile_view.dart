import 'package:community_managment/app/extensions/empty_padding_extension.dart';
import 'package:community_managment/app/modules/profile/controllers/profile_controller.dart';
import 'package:community_managment/app/routes/app_pages.dart';
import 'package:community_managment/app/widgets/scale_animation.dart';
import 'package:community_managment/app/widgets/textfield.dart';
import 'package:fade_out_particle/fade_out_particle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ProfileController>();
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: const Text(
            'User',
            style: TextStyle(color: Colors.white),
          ),
          leading: GestureDetector(onTap: (){Get.back();},child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
          centerTitle: false,
          backgroundColor: Colors.black87,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.help_outline,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12),
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
            CustomAnimatedScale(
              onTap: () async {
                controller.isParticle = true;
                await Future.delayed(const Duration(seconds: 2)).then(
                  (value) => controller.logout(context),
                );
                // controller.logout(context);
              },
              child: Obx(
                () => FadeOutParticle(
                  disappear: controller.isParticle,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFF491CCB),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Logout",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // TextButton(
            //   onPressed: () => controller.logout(context),
            //   child: const Text("LogOut"),
            // ),
          ],
        ),
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
