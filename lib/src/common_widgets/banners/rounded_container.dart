import 'package:flutter/material.dart';
import 'package:mess_management_system/src/constants/colors.dart';
import 'package:mess_management_system/src/constants/image_strings.dart';
import 'package:mess_management_system/src/constants/sizes.dart';

class MessRoundedBanners extends StatelessWidget {
  const MessRoundedBanners({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = messWhiteColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.borderRadius = MessDefaultSize,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            fit: fit,
            image: (isNetworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider),
          ),
        ),
      ),
    );
  }
}
