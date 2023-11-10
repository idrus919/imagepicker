import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PickerController extends GetxController {
  static PickerController get find => Get.find();

  final images = Rxn<List<File>>();

  List<File?> get list {
    final currents = images.value ?? [];
    return [...currents, null];
  }

  void picker() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        final file = File(image.path);
        final currents = images.value ?? [];
        images.value = [...currents, file];
        images.refresh();
      }
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: e.toString(),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void delete(int index) {
    final currents = images.value ?? [];
    currents.removeAt(index);
    images.value = currents;
    images.refresh();
  }
}
