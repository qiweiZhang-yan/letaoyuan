import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/lodash.dart';
import '../../values/border.dart';


/// 主色调按钮
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Widget? prefix;
  final double fontSize;
  final EdgeInsets? padding;
  final Color textColor;
  final Color textColorDisabled;
  final Color backgroundColor;
  final Color backgroundDisabled;
  final BorderRadius? borderRadius;
  final double? width;
  final double? minSize;
  final Duration delay;

  const PrimaryButton(
    this.label,
    this.onPressed, {
    Key? key,
    this.prefix,
    this.fontSize = 13,
    this.padding,
    this.borderRadius,
    this.textColor = Colors.white,
    this.width,
    this.minSize = kMinInteractiveDimensionCupertino,
    this.textColorDisabled = const Color(0xFFACACAC),
    this.backgroundDisabled = const Color(0xFFE8E8E8),
    this.backgroundColor = const Color(0xFFDB593A),
    this.delay = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = Text(
      label,
      style: TextStyle(
        fontSize: fontSize.sp,
        color: onPressed == null ? textColorDisabled : textColor,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
    if (width != null) {
      child = Expanded(child: child);
    }
    return CupertinoButton(
      minSize: minSize,
      borderRadius: borderRadius ?? borderRadius1,
      onPressed: onPressed == null
          ? null
          : debounce(
              () {
                onPressed?.call();
              },
              delay,
            ),
      color: backgroundColor,
      disabledColor: backgroundDisabled,
      padding: padding ?? EdgeInsets.symmetric(vertical: 10.h),
      child: SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            prefix ?? const SizedBox(),
            child,
          ],
        ),
      ),
    );
  }
}

/// 灰色边框按钮
class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Widget? prefix;
  final Color? color;
  final double fontSize;
  final EdgeInsets? padding;
  final Color textColor;
  final Color textColorDisabled;
  final BorderRadiusGeometry? borderRadius;
  final Color borderColor;
  const SecondaryButton(
    this.label,
    this.onPressed, {
    Key? key,
    this.prefix,
    this.color,
    this.fontSize = 14,
    this.textColor = const Color(0xFF40414C),
    this.textColorDisabled = const Color(0xFFACACAC),
    this.borderColor = const Color(0xFFD2D2D2),
    this.borderRadius,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          prefix ?? Container(),
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              color:
                  color ?? (onPressed == null ? textColorDisabled : textColor),
            ),
          )
        ],
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: borderRadius ?? borderRadius6),
        ),
        side: MaterialStateProperty.all(
            BorderSide(color: borderColor, width: 1.w)),
        padding: MaterialStateProperty.all(
          padding ?? EdgeInsets.symmetric(vertical: 11.h),
        ),
      ),
      onPressed: onPressed,
    );
  }
}

///带图标按钮（左边图标+中间文字）
class IconWithLabelButton extends StatelessWidget {
  final Widget? leadingIcon;
  final String text; //文字
  final Color textColor; //文字颜色
  final double fontSize; //文字大小
  final bool fontBold; //文字是否加粗
  final GestureTapCallback? onTap; //点击事件
  const IconWithLabelButton(
    this.text, {
    Key? key,
    this.leadingIcon,
    this.onTap,
    this.fontSize = 14,
    this.textColor = Colors.black,
    this.fontBold = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: ScreenUtil().screenWidth,
        height: 36.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius1,
          border: Border.all(
            color: const Color(0xFFBDBDBD),
            width: 1.w,
          ),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 9.w),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              left: 0,
              top: 9.h,
              child: leadingIcon ?? const SizedBox(),
            ),
            Center(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: fontBold ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GradientButton extends StatefulWidget {
  final List<Color> colors;
  final String? text;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final Function()? onPressed;
  final Alignment begin;
  final Alignment end;
  final double circular;
  final Color? disabledColor;
  final List<BoxShadow>? boxShadow;

  GradientButton(
      {Key? key,
        required this.colors,
        this.text,
        this.textStyle ,
        this.width,
        this.height,
        this.onPressed,
        this.begin = Alignment.topCenter,
        this.end = Alignment.bottomCenter,
        this.disabledColor,
        this.boxShadow ,
        this.circular = 50.0})
      : super(key: key);

  @override
  _GradientButtonState createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.circular), //圆角
        gradient: widget.onPressed == null
            ? null
            : LinearGradient(
          begin: widget.begin,
          end: widget.end,
          colors: widget.colors,
        ),
        boxShadow: widget. boxShadow,
      ),
      child: MaterialButton(
        disabledColor: widget.disabledColor ?? Colors.grey,
        disabledTextColor:Colors.grey[200],
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.circular))),
        onPressed: widget.onPressed,
        // disabledColor: Color(0xff93b8fd),
        child: Text(
          widget.text ?? '',
          style: widget.textStyle,
        ),
      ),
    );
  }
}