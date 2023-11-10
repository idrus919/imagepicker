import 'package:flutter/material.dart';
import 'package:imagepicker/widgets/inkwell.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  const ButtonWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: InkWellWidget(
          onTap: onTap,
          child: const Icon(Icons.add_rounded),
        ),
      ),
    );
  }
}
