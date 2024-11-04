import 'dart:ui';

import 'package:book_review/src/shared/presentation/widgets/base_network_image.dart';
import 'package:flutter/material.dart';

class DetailImageBackground extends StatelessWidget {
  const DetailImageBackground({
    super.key,
    required this.imageUrl,
    this.imageHeight,
    this.blurHeight,
    this.xBlur,
    this.yBlur,
  });

  final String imageUrl;
  final double? imageHeight;
  final double? blurHeight;
  final double? xBlur;
  final double? yBlur;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BaseNetworkImage(
          imageUrl: imageUrl,
          height: imageHeight ?? MediaQuery.sizeOf(context).height / 2.2,
          width: double.infinity,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: xBlur ?? 10, sigmaY: yBlur ?? 12),
          child: Container(
            color: Colors.transparent,
            height: blurHeight ?? MediaQuery.of(context).size.height / 2.2,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
