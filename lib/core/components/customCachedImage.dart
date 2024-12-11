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
        return Image.asset('assets/images/placeholder.png');
        
      },
      errorWidget: (context, url, error) {
        return Image.asset('assets/images/placeholder.png');
      },
    );
  }
}