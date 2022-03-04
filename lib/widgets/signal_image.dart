import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vial_app/providers/providers.dart';

class SignalImage extends StatelessWidget {
  final ReportProvider form;

  const SignalImage({
    Key? key,
    required this.form,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
        final picker = ImagePicker();
        final XFile? photo = await picker.pickImage(
          source: ImageSource.camera,
          maxHeight: 1000,
          imageQuality: 50,
          maxWidth: 400,
        );
        if (photo == null) {
          return;
        } else {
          form.path = photo.path;
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: (form.path != '')
            ? _ImageSelected(path: form.path, size: size)
            : _NotImage(size: size),
      ),
    );
  }
}

class _ImageSelected extends StatelessWidget {
  final String path;
  const _ImageSelected({
    Key? key,
    required this.size,
    required this.path,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(path),
      width: size.width * 0.50,
      height: size.height * 0.35,
      fit: BoxFit.cover,
    );
  }
}

class _NotImage extends StatelessWidget {
  const _NotImage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.50,
      height: size.height * 0.35,
      color: Colors.grey,
      child: const Center(
        child: Icon(
          Icons.photo_size_select_actual_outlined,
          size: 70,
        ),
      ),
    );
  }
}
