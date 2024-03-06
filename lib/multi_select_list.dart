import 'package:flutter/material.dart';

class MultiSelectList extends StatefulWidget {
  List<MultiSelectListItem> fullList = [];
  List<MultiSelectListItem> selectedList = [];
  Color selectedColor;
  Color deselcetedColor;

  MultiSelectList({@required this.fullList, @required this.selectedList, this.deselcetedColor, this.selectedColor});

  @override
  _MultiSelectListState createState() => _MultiSelectListState();
}

class _MultiSelectListState extends State<MultiSelectList> {
  _MultiSelectListState() {
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.fullList.length,
      itemBuilder: _buildRow,
    );
  }

  Widget _buildRow(context, i) {
    var activeColor = widget.selectedColor ?? Theme.of(context).accentColor;
    var passiveColor = widget.deselcetedColor ?? Theme.of(context).canvasColor;
    MultiSelectListItem item = widget.fullList[i];
    return Ink(
      //color: widget.selectedList.contains(item) ? activeColor : passiveColor,
      child:
      ListTile(
        title: Text(item.getListItemTitle(),),
        selected: widget.selectedList.contains(item),
        onTap: () {
          setState(() {
            if (widget.selectedList.contains(item)) {
              widget.selectedList.remove(item);
            } else {
              widget.selectedList.add(item);
            }
            print(widget.selectedList);
          });
        },
      ),
    );
  }

  @override
  State createState() {
  }
}

abstract class MultiSelectListItem {
  String getListItemTitle();
  String getListItemSubtitle();
}