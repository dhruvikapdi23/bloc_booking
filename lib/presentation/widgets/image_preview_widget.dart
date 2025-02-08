import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImagePreviewWidget extends StatelessWidget {
  final String imageUrl;

  const ImagePreviewWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Preview'),
      ),
      body: PhotoView(
        imageProvider: NetworkImage(imageUrl),
        minScale: PhotoViewComputedScale.contained * 0.8,
        maxScale: PhotoViewComputedScale.covered * 2,
        initialScale: PhotoViewComputedScale.contained,
        backgroundDecoration: const BoxDecoration(color: Colors.black),
      ),
    );
  }
}
