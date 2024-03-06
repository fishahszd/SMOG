import 'package:flutter/material.dart';
import 'package:smog_moloch/custom_widgets/custom_theme.dart';
import 'package:smog_moloch/custom_widgets/image_button.dart';

class SmogImageButton extends StatelessWidget {
  VoidCallback onPressed;
  String title;

  SmogImageButton({this.onPressed, this.title});

  @override
  Widget build(BuildContext context) {
    return ImageButton(
      onPressed: onPressed,
      image: AssetImage('assets/patina.jpg'),
      child: Text(title, textAlign: TextAlign.center, style: CustomTheme.buttonTextStyle),
      borderRadius: BorderRadius.all(Radius.circular(5)),
      width: 200,
      splashColor: Color(0xFF6FCCFF),
    );
  }

}