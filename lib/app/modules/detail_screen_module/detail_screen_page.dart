import 'package:app_using_getx/app/modules/home_screen/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreenPage extends GetView<HomeScreenController> {
  const DetailScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    var index = Get.arguments[0]["index"];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                tag: controller.profiles[index].id ?? "",
                child: Image.network(
                  controller.profiles[index].avatar ?? "",
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                child: IconButton(
                  onPressed: () => controller.addedAsFavorite(index),
                  icon: Obx(() {
                    return Icon(
                      controller.profiles[index].isFavorite
                          ? Icons.star
                          : Icons.star_outline,
                      size: 40,
                      color: Colors.black,
                    );
                  }),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${controller.profiles[index].firstName ?? ""} ${controller.profiles[index].lastName ?? ""}",
            style: context.textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            controller.profiles[index].email ?? "",
            style: context.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
