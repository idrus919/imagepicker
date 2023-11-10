import 'dart:io';

import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final VoidCallback? onDelete;
  final File image;
  const ImageWidget({super.key, this.onDelete, required this.image});

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
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.file(
              image,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: -10,
              right: -10,
              child: IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.close_rounded, color: Colors.redAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
