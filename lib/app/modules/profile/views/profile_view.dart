import 'dart:ui';

import 'package:community_managment/app/extensions/empty_padding_extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      body: ListView(
        children: [
          const Center(
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.amber,
            ),
          ),
          15.ph,
          const Center(
            child: Text(
              "Nikhil Butani",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Center(
            child: Text(
              "Member for 4 years",
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          10.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text(
                    "10.5K",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Followers",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                width: 1.5,
                color: Colors.grey.shade500,
              ),
              Column(
                children: [
                  const Text(
                    "10.5K",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Following",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // body
          20.ph,
          Row(
            children: [
              Flexible(
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
                    child: Text(
                      "Here to help",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              20.pw,
              Flexible(
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
                      Colors.pink.withOpacity(1),
                      Colors.pinkAccent.withOpacity(0.4),
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
                    child: Text(
                      "I need help",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
