import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  VoidCallback onPressed;
  Widget child;
  double width;
  double height;
  EdgeInsets padding;
  double elevation;
  ImageProvider image;
  BorderRadius borderRadius;
  Color splashColor;

  ImageButton({@required this.onPressed, this.child, this.width, this.height, this.padding = const EdgeInsets.all(8),
      this.elevation = 8, @required this.image, this.borderRadius, this.splashColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: borderRadius,
      child: InkWell (
        splashColor: splashColor,
        onTap: onPressed,
        child: Ink (
          padding: padding,
          width: width,
          height: height,
          child: child,
          decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: BoxFit.cover),
            borderRadius: borderRadius,
          ),
        ),
      ),
    );
  }
}
