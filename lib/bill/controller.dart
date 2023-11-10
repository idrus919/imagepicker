import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imagepicker/bill/input.dart';

class PickerController extends GetxController {
  static PickerController get find => Get.find();

  final bills = Rxn<List<BillInput>>();

  List<BillInput> get list {
    final currents = bills.value ?? [];
    return currents;
  }

  @override
  void onInit() {
    add();
    super.onInit();
  }

  void picker(int index) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        final currents = bills.value ?? [];
        final current = currents[index];
        current.image = File(image.path);
        currents[index] = current;
        bills.value = currents;
        bills.refresh();
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

  void deleteFile(int index) {
    final currents = bills.value ?? [];
    final current = currents[index];
    current.image = null;
    currents[index] = current;
    bills.value = currents;
    bills.refresh();
  }

  void delete(int index) {
    final currents = bills.value ?? [];
    currents.removeAt(index);
    bills.value = currents;
    bills.refresh();
  }

  void add() {
    final currents = bills.value ?? [];
    bills.value = [...currents, BillInput()];
    bills.refresh();
  }

  void onChange(int index, BillInput bill) {
    final currents = bills.value ?? [];
    currents[index] = bill;
    bills.value = currents;
    bills.refresh();
  }
}
