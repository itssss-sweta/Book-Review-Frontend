import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BaseNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit? boxFit;

  const BaseNetworkImage(
      {super.key,
      this.imageUrl,
      this.height = 200,
      this.width = 100,
      this.boxFit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      fit: boxFit,
      height: height,
      width: width,
      errorWidget: (context, url, error) {
        return const Icon(Icons.image);
      },
      progressIndicatorBuilder: (context, url, progress) {
        return Center(
          child: CircularProgressIndicator(value: progress.progress),
        );
      },
    );
  }
}
