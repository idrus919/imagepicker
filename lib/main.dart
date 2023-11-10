import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagepicker/bill/controller.dart';
import 'package:imagepicker/bill/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Image Picker',
      debugShowCheckedModeBanner: false,
      home: const BillPage(),
      initialBinding: BindingsBuilder(
        () => Get.put<PickerController>(PickerController(), permanent: true),
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child ?? const SizedBox(),
        );
      },
    );
  }
}
