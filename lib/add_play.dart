import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smog_moloch/custom_widgets/crud_widget.dart';
import 'package:smog_moloch/game_objects/play.dart';
import 'package:smog_moloch/game_objects/scenario.dart';
import 'package:smog_moloch/state_container.dart';
import 'column_with_padding.dart';
import 'multi_select_list_screen.dart';
import 'game_objects/campaign.dart';
import 'game_objects/gentleman.dart';
import 'game_objects/power.dart';
import 'game_objects/arsenal.dart';
import 'game_objects/gear.dart';
import 'game_objects/upgrade.dart';
import 'game_objects/artefact.dart';

class AddPlay extends CRUDWidget {
  Play _play;
  String _title;

  AddPlay({Play play, String title, @required crudAction}) {
    this._play = play ?? new Play();
    this._title = title;
    this.crudAction = crudAction;
  }

  @override
  _AddPlayState createState() => _AddPlayState(this._play, this._title);
}

class _AddPlayState extends State<AddPlay> {
  Scenarios scenariosCache;
  Play play;
  String title;
  //final _campaignNameController = TextEditingController();

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  _AddPlayState(this.play, this.title);

  @override
  void initState() {
    //_campaignNameController.text = campaign.name;
    super.initState();

    if (this.scenariosCache == null) {
      Scenarios.loadFromAsset().then((Scenarios scenarios) {
        setState(() {
          this.scenariosCache = scenarios;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat df = StateContainer.of(context).df;

    if (this.scenariosCache == null) {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            title, style: TextStyle(fontFamily: 'steamwreck', fontSize: 36)
          ),
          centerTitle: true,
        ),
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          title, style: TextStyle(fontFamily: 'steamwreck', fontSize: 36)
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            widget.crudAction == CRUDAction.CREATE ? _save(context) : Navigator.of(context).pop(play);
          },
        ),
      ),
      body: Container(
          child: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: ColumnWithPadding(
                      edgeInsets: EdgeInsets.all(5),
                      children: [
                        DropdownButtonFormField<Scenario>(
                          items: scenariosCache.allScenario
                              .map((Scenario scenario) {
                            return DropdownMenuItem<Scenario>(
                                value: scenario, child: Text(scenario.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
                          }).toList(),
                          hint: Text("Scenario"),
                          value: play.scenario,
                          onChanged: (newVal) {
                            setState(() {
                              play.scenario = newVal;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return "Please choose a scenario";
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Date of play: ' + df.format(play.date)),
                            IconButton(icon: Icon(Icons.date_range),
                              onPressed: () async {
                                DateTime datePicked = await showDatePicker(
                                  context: context,
                                  initialDate: play.date,
                                  firstDate: new DateTime(2018),
                                  lastDate: new DateTime(2030),
                                );
                                if (datePicked != null) {
                                  setState(() {
                                    play.date = datePicked;
                                  });
                                }
                              },
                            )
                          ],
                        ),
                        Divider(),
                        _buildQuestions(context),
                        widget.crudAction == CRUDAction.CREATE ? RaisedButton(
                            child: Text("Save Play"),
                            onPressed: () {
                              _save(context);
                            }) : new Container(),
                      ]
                  )
              )
          )
      ),
    );
  }

  Widget _buildQuestions(BuildContext context) {
    if (play.scenario == null) {
      return Container();
    }

    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[],
    );

    play.scenario.resolutionQuestions.forEach((ResolutionQuestion rq) {
      column.children.add(_buildQuestion(context, rq));
    });

    return Padding(
      padding: EdgeInsets.all(0),
      child: column
    );
  }

  Widget _buildQuestion(BuildContext context, ResolutionQuestion rq) {
    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[],
    );

    Widget options = DropdownButtonFormField<String>(
      items: rq.answers.keys.map((String answer) {
        return DropdownMenuItem<String>(
            value: answer,
            child: Text(answer)
        );
      }).toList(),
      hint: Text("Answer"),
      value: rq.answer,
      onChanged: (newVal) {
        setState(() {
          rq.answer = newVal;
        });
      },
      validator: (value) {
        if (value == null) {
          return "Please choose an answer!";
        }
      },
    );
    column.children.add(Text(rq.question, style: TextStyle(fontFamily: 'munson', fontSize: 18, fontWeight: FontWeight.bold), ));
    column.children.add(options);
    if(rq.answer != null) {
      column.children.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Text(rq.answers[rq.answer], textAlign: TextAlign.justify,),
          )
      );
    }

    Widget result = Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: column,
    );

    return result;
  }

  void _save(BuildContext context) {
    /*if (_formKey.currentState.validate()) {
      campaign.name = _campaignNameController.text;
      campaign.nemesis.playerName = _nemesisNameController.text;
      campaign.characters[0].playerName = _player1NameController.text;
      campaign.characters[1].playerName = _player2NameController.text;
      campaign.characters[2].playerName = _player3NameController.text;
      campaign.characters[3].playerName = _player4NameController.text;
      Navigator.of(context).pop(campaign);
    }*/

    if (_formKey.currentState.validate()) {
      Navigator.of(context).pop(play);
    }
  }
}
