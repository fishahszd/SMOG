import 'package:flutter/material.dart';
import 'column_with_padding.dart';
import 'game_objects/gentleman.dart';

class NewPlayer extends StatefulWidget {
  @override
  _NewPlayerState createState() => _NewPlayerState();
}

class _NewPlayerState extends State<NewPlayer> {
  final playerNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Gentleman gentleman;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("New Player",
            )),
        body: Form(
            key: _formKey,
            child: ColumnWithPadding(
                edgeInsets: EdgeInsets.all(10),
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "Player Name"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter the name of the player!";
                      }
                    },
                    controller: playerNameController,
                    onSaved: (value) {print(value);},
                  ),

                  DropdownButtonFormField<String>(
                    items: Gentleman.GENTLEMEN.keys.map((String value) {
                      var job = Gentleman.fromName(value).job.toString().split(".").last;
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text("$value ($job)")
                      );
                    }).toList(),
                    hint: Text("Please choose a gentleman"),
                    value: this.gentleman?.name,
                    onChanged: (newVal) {
                      setState(() {
                        this.gentleman = Gentleman.fromName(newVal);
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please choose a gentleman!";
                      }
                    },
                  ),
                  RaisedButton(
                      child: Text("Submit"),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          this.gentleman.playerName = playerNameController.text;
                          Navigator.of(context).pop(this.gentleman);
                        }
                      }
                  ),
                ])
        )


    );
  }
}
