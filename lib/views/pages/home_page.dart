import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news/views/pages/health.dart';
import 'package:news/views/pages/science.dart';
import 'package:news/views/pages/sports.dart';

import '../../controller/news_controller.dart';

class HomeView extends GetWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Sports(),
      Science(),
      Health(),
    ];
    NewsController controller = Get.put(NewsController());
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          currentIndex: controller.currentIndex.value,
          onTap: (val) {
            controller.currentIndex.value = val;
          },
          items: [
            BottomNavigationBarItem(label: "Sports", icon: Icon(Icons.sports)),
            BottomNavigationBarItem(
                label: "Science", icon: Icon(Icons.science)),
            BottomNavigationBarItem(
                label: "health", icon: Icon(Icons.health_and_safety)),
          ],
        ),
        body: GetX<NewsController>(
            builder: (controller) => screens[controller.currentIndex.value]));
  }
}
