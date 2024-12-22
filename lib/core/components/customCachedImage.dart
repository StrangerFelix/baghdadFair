import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage(this.imageUrl,{this.width,this.fit,super.key});
  final String? imageUrl;
  final BoxFit? fit;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      fit: fit ?? BoxFit.cover,
      imageUrl: imageUrl ?? "",
      placeholder: (context, url) {
        return AspectRatio(
          aspectRatio: 3/2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: gradiant2.withOpacity(.1),
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return AspectRatio(
          aspectRatio: 3/2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: gradiant2.withOpacity(.1),
            ),
          ),
        );
      },
    );
  }
}