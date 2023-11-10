import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagepicker/picker/controller.dart';
import 'package:imagepicker/widgets/button.dart';
import 'package:imagepicker/widgets/image.dart';

class PickerPage extends StatelessWidget {
  const PickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PickerController.find;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Obx(() {
          final images = controller.list;

          return Container(
            height: 75,
            alignment: Alignment.centerLeft,
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final image = images[index];
                if (image == null) {
                  return ButtonWidget(onTap: controller.picker);
                }
                return ImageWidget(
                  image: image,
                  onDelete: () => controller.delete(index),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 12,
              ),
              itemCount: images.length,
            ),
          );
        }),
      ),
    );
  }
}
