import 'dart:io';

import 'package:flutter/material.dart';
import 'package:imagepicker/widgets/inkwell.dart';

class PickerWidget extends StatelessWidget {
  final VoidCallback? onTap, deleteFile;
  final File? file;
  const PickerWidget({super.key, this.onTap, this.deleteFile, this.file});

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
        child: Builder(
          builder: (context) {
            if (file == null) {
              return InkWellWidget(
                onTap: onTap,
                child: const Icon(Icons.add_rounded),
              );
            }

            return Stack(
              fit: StackFit.expand,
              children: [
                Image.file(
                  file!,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: -10,
                  right: -10,
                  child: IconButton(
                    onPressed: deleteFile,
                    icon: const Icon(Icons.close_rounded, size: 16),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
