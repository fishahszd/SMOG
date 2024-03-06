import 'package:flutter/material.dart';

class ColumnWithPadding extends StatelessWidget {
  EdgeInsetsGeometry edgeInsets;
  List<Widget> children = [];

  ColumnWithPadding({this.edgeInsets, this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _buildColumn(context),
    );
  }

  _buildColumn(BuildContext context) {
    List<Widget> result = [];

    this.children.forEach((child) {
      result.add(Padding(
        padding: edgeInsets,
        child: child,
      )
      );
    });

    return result;
  }

}