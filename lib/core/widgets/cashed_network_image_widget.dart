import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../config/styles/app_colors.dart';

class CashedNetworkImageWidget extends StatelessWidget {
  final String image;

  const CashedNetworkImageWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade100,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
        );
      },
      imageUrl: image,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      )),
      errorWidget: (context, url, error) => const Center(
          child: Icon(
        Icons.error,
        color: Colors.red,
      )),
    );
  }
}
