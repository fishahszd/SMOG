import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'game_objects/campaigns.dart';

class _InheritedStateContainer extends InheritedWidget {
  // Data is your entire state. In our case just 'User'
  final StateContainerState data;

  // You must pass through a child and your state.
  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  // This is a built in method which you can use to check if
  // any state has changed. If not, no reason to rebuild all the widgets
  // that rely on your state.
  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}

class StateContainer extends StatefulWidget {
  // You must pass through a child.
  final Widget child;
  final Campaigns campaigns;

  StateContainer({
    @required this.child,
    this.campaigns,
  });

  // This is the secret sauce. Write your own 'of' method that will behave
  // Exactly like MediaQuery.of and Theme.of
  // It basically says 'get the data from the widget of this type.
  static StateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
    as _InheritedStateContainer).data;
  }

  @override
  StateContainerState createState() => new StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  // Whichever properties you wanna pass around your app as state
  Campaigns campaigns;
  final DateFormat df = new DateFormat("yyyy-MM-dd");
  final StateStorage _storage = new StateStorage();

  @override
  void initState() {
    super.initState();
    _storage.readState().then((String state) {
      if (state == null) {
        setState(() {
          this.campaigns = new Campaigns();
        });
      } else {
        setState(() {
          this.campaigns = Campaigns.fromJson(jsonDecode(state));
        });
      }
    });

  }

  // You can (and probably will) have methods on your StateContainer
  // These methods are then used through our your app to
  // change state.
  // Using setState() here tells Flutter to repaint all the
  // Widgets in the app that rely on the state you've changed.
  void updateCampaigns() {
    setState(() {
    });
    _storage.writeState(jsonEncode(this.campaigns.toJson()));
  }

  // Simple build method that just passes this state through
  // your InheritedWidget
  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class StateStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.txt');
  }

  Future<String> readState() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      print(contents);
      return contents;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<File> writeState(String state) async {
    final file = await _localFile;
    return file.writeAsString(state);
  }
}