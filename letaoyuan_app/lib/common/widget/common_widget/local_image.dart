import 'package:flutter/material.dart';
enum ImageFormat { png, jpg, gif, webp }
/// 加载本地资源图片
class LocalImage extends StatelessWidget {
  const LocalImage(this.image,
      {Key? key,
      this.package,
      this.width,
      this.height,
      this.cacheWidth,
      this.cacheHeight,
      this.fit,
      this.format = ImageFormat.png,
      this.color,
      this.gaplessPlayback = false})
      : super(key: key);

  final String image;
  final String? package;
  final double? width;
  final double? height;
  final int? cacheWidth;
  final int? cacheHeight;
  final BoxFit? fit;
  final ImageFormat format;
  final Color? color;
  final bool gaplessPlayback;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      getImgPath(image, format: format),
      package: package,
      height: height,
      width: width,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      fit: fit,
      color: color,

      /// 忽略图片语义
      excludeFromSemantics: true,
      gaplessPlayback: gaplessPlayback,
    );
  }

  static String getImgPath(String name,
      {ImageFormat format = ImageFormat.png}) {
    return 'assets/images/$name.${format.value}';
  }
}
extension ImageFormatExtension on ImageFormat {
  String get value => ['png', 'jpg', 'gif', 'webp'][index];
}
