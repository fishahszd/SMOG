import 'package:flutter/material.dart';
import 'multi_select_list.dart';

class MultiSelectListScreen extends StatefulWidget {
  String title;
  List<MultiSelectListItem> fullList = [];
  List<MultiSelectListItem> selectedList = [];
  Color selectedColor;
  Color deselcetedColor;

  MultiSelectListScreen({@required this.fullList, @required this.selectedList, this.deselcetedColor, this.selectedColor, this.title,});

  @override
  _MultiSelectListScreenState createState() => _MultiSelectListScreenState();
}

class _MultiSelectListScreenState extends State<MultiSelectListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),

      body: MultiSelectList(
        fullList: widget.fullList,
        selectedList: widget.selectedList,
      ),
    );
  }

}