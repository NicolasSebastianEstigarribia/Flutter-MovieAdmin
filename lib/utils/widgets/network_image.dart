import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PNetworkImage extends StatelessWidget {
  final String image;
  final BoxFit? fit;
  final double? width, height;
  final Alignment? alignment;
  const PNetworkImage(this.image,
      {Key? key, this.fit, this.height, this.width, this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CachedNetworkImageProvider imageProvider =
        CachedNetworkImageProvider(image);

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(5.0, 5.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image(
          image: imageProvider,
          fit: fit,
          width: width,
          height: height,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Image.asset(
              'assets/placeholder.jpg',
              fit: BoxFit.cover,
              width: width,
              height: height,
              alignment: alignment ?? Alignment.center,
            );
          },
        ),
      ),
    );
  }
}
