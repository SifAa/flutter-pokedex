import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailImage extends StatelessWidget {
  final int id;
  final String image;

  const DetailImage({
    super.key,
    required this.image,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 500,
      ),
      color: Colors.black,
      child: Center(
        child: Stack(
          children: [
            Container(
              height: 500,
              width: 500,
              decoration: const BoxDecoration(
                color: Colors.white10,
                shape: BoxShape.circle,
              ),
            ),
            Positioned(
              top: 50.0,
              left: 0,
              right: 0,
              child: Hero(
                tag: "image-$id",
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: image,
                  fadeInCurve: Curves.easeInOut,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  // imageSemanticLabel: ,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
