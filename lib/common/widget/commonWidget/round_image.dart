import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';



class RoundImage extends StatelessWidget {
  const RoundImage(
    this.imageUrl, {
    Key? key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholderImage,
    this.fadeInDuration = const Duration(milliseconds: 500),
  })  : assert(imageUrl != null, 'The [imageUrl] argument must not be null.'),
        super(key: key);

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final DecorationImage? placeholderImage;
  final Duration fadeInDuration;

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      imageUrl,
      width: width,
        shape:BoxShape.rectangle,
      height:height,
      fit: fit,
        clearMemoryCacheWhenDispose:true,
      borderRadius: borderRadius,
        loadStateChanged:
            (ExtendedImageState state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              return Container(
                    decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      color: Colors.grey[200],
                    ),);
            case LoadState.completed:

              break;
            case LoadState.failed:
              return Container(
                      decoration: BoxDecoration(
                        borderRadius: borderRadius,
                        color: Colors.grey[200],
                        image: placeholderImage ??
                            DecorationImage(
                              image:  ExactAssetImage('assets/images/加载失败.png'),
                              fit: BoxFit.cover,
                            ),
                      ),
                    );
              break;
          }
          return null;
        }
      //cancelToken: cancellationToken,
    );
  }
}
