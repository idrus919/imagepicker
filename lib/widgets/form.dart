import 'package:flutter/material.dart';
import 'package:imagepicker/bill/input.dart';
import 'package:imagepicker/widgets/button.dart';

class FormWidget extends StatelessWidget {
  final VoidCallback? picker, deleteFile;
  final ValueChanged<BillInput> onChanged;
  final BillInput bill;
  const FormWidget({
    super.key,
    required this.bill,
    this.picker,
    this.deleteFile,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onChanged: (value) {
              bill.store = value;
              onChanged(bill);
            },
            decoration: const InputDecoration(
              labelText: 'Store',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Invoice Number',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Total Transaction',
            ),
          ),
          const SizedBox(height: 16),
          const Text('Original Bill'),
          const SizedBox(height: 8),
          PickerWidget(onTap: picker, file: bill.image, deleteFile: deleteFile),
        ],
      ),
    );
  }
}
