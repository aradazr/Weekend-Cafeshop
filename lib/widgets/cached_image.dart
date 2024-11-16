import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CachedImage extends StatelessWidget {
  String? imageUrl;
  double radius;
  BoxFit fit;
  CachedImage(
      {super.key, this.imageUrl, this.radius = 0, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: CachedNetworkImage(
        fit: fit,
        imageUrl: imageUrl ??
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pixsector.com%2Ficon%2Ffree-image-icon-png-vector%2F891&psig=AOvVaw2-MXyQieTIj0fRBpjWdYMW&ust=1731840563495000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLCuv4DX4IkDFQAAAAAdAAAAABAE',
        errorWidget: (context, url, error) => Container(
          color: const Color.fromARGB(255, 255, 0, 25),
        ),
        placeholder: (context, url) => Icon(Icons.image)
      ),
    );
  }
}
