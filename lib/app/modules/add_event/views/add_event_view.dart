import 'package:community_managment/app/extensions/empty_padding_extension.dart';
import 'package:community_managment/app/modules/add_event/controllers/add_event_controller.dart';
import 'package:community_managment/app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';


class AddEventView extends GetView<AddEventController> {
  const AddEventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<AddEventController>();
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        key: controller.addEventFormKey,
        backgroundColor: Colors.black87,
        appBar: AppBar(
          leading: GestureDetector(onTap: (){
            Get.back();
          },child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
          titleSpacing: 12,
          title: const Text(
            'Add Event',
            style: TextStyle(color: Colors.white),
          ),
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
          padding: const EdgeInsets.all(12.0),
          children: [
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                    child: Center(
                      child: TextInputField(
                        hinttext: 'Event Name',
                        editingController: controller.nameController,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                    child: Center(
                      child: TextInputField(
                        editingController: controller.descriptionController,
                        hinttext: 'Description',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                    child: Center(
                      child: TextInputField(
                        hinttext: 'Location',
                        editingController: controller.locationController,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            10.ph,
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Event Type',style: TextStyle(color: Colors.white),),
                10.pw,
                const ChipWidget(text:'Meetup'),
                10.pw,
                const ChipWidget(text:'Hackathon'),
                10.pw,
                const ChipWidget(text:'Workshop'),
              ],
            )
          ],
        ),
        bottomNavigationBar: Container(
          height: 60,
          child: GestureDetector(
            onTap: (){
              controller.addEvent();
            },
            child: Center(
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
                  child:Text('Save',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChipWidget extends StatelessWidget {
  final String text;

  const ChipWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(text,style: const TextStyle(color: Colors.white),)),
      ),
    );
  }
}
