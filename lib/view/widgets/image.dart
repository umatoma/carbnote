import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

final Uint8List kTransparentImage = Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);

class CnProfileImage extends StatelessWidget {
  const CnProfileImage(
    this.imageURL, {
    Key key,
    this.size = 48,
  }) : super(key: key);

  final String imageURL;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey[300],
        ),
        borderRadius: BorderRadius.circular(size / 2.0),
      ),
      child: ClipOval(
        child: imageURL == null
            ? Image.memory(
                kTransparentImage,
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                imageUrl: imageURL,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return Image.memory(kTransparentImage);
                },
                errorWidget: (context, url, dynamic e) {
                  return Image.memory(kTransparentImage);
                },
              ),
      ),
    );
  }
}