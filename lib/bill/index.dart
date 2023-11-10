import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagepicker/bill/controller.dart';
import 'package:imagepicker/widgets/form.dart';

class BillPage extends StatelessWidget {
  const BillPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PickerController.find;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill'),
        centerTitle: true,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _forms),
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: controller.add,
              child: const Text('Add More Bills'),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _forms {
    final controller = PickerController.find;
    return Obx(() {
      final bills = controller.list;

      return ListView.separated(
        padding: const EdgeInsets.all(15),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final bill = bills[index];

          return FormWidget(
            bill: bill,
            picker: () => controller.picker(index),
            deleteFile: () => controller.deleteFile(index),
            onChanged: (value) => controller.onChange(index, value),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: bills.length,
      );
    });
  }
}
