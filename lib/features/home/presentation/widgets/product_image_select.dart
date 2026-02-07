import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ImageSelected extends StatelessWidget {
  const ImageSelected({super.key, required this.image, this.onTap});

  final File? image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.file(image!, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

class ImageNotSelected extends StatelessWidget {
  const ImageNotSelected({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        options: RectDottedBorderOptions(
          color: Colors.grey,
          dashPattern: const [10, 4],
          strokeCap: StrokeCap.round,
          stackFit: StackFit.loose,
        ),

        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 150,

          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.folder_open, size: 40),
              SizedBox(height: 15),
              Text('select your image', style: TextStyle(fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }
}
