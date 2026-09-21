import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class GalleryPicker extends StatefulWidget {
  GalleryPicker({super.key, this.selectImage, this.onSelect});

  XFile? selectImage;
  VoidCallback? onSelect;

  @override
  State<GalleryPicker> createState() => _GalleryPickerState();
}

class _GalleryPickerState extends State<GalleryPicker> {
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return; // User cancelled selection
    }

    setState(() {
      widget.selectImage = XFile(image.path);
      widget.onSelect?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: pickImage, icon: Icon(Icons.image, size: 25, ), style: IconButton.styleFrom(backgroundColor: Theme.of(context).disabledColor),);
  }
}

Future<void> pickImages() async {
  final ImagePicker picker = ImagePicker();

  final List<XFile> images = await picker.pickMultiImage();

  for (final image in images) {
    print(image.path);
  }
}

Future<void> pickFile() async {
  final result = await FilePicker.platform.pickFiles();

  if (result != null) {
    final file = result.files.single;

    print('Name: ${file.name}');
    print('Path: ${file.path}');
  }
}

//```
//
//So, use **`image_picker` for photos/images** and **`file_picker` for general files**.
