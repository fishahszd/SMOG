import 'package:flutter/material.dart';
import 'package:smog_moloch/custom_widgets/crud_widget.dart';
import 'package:smog_moloch/custom_widgets/smog_image_button.dart';
import 'package:smog_moloch/game_objects/campaigns.dart';
import 'package:smog_moloch/game_objects/moloch_stone.dart';
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
import 'package:smog_moloch/custom_widgets/custom_theme.dart';

class EditCampaign extends CRUDWidget {
  Campaign _campaign;
  String _title;

  EditCampaign({Campaign campaign, String title, @required crudAction}) {
    this._campaign = campaign ?? new Campaign();
    this._title = title;
    this.crudAction = crudAction;
  }

  @override
  _EditCampaignState createState() => _EditCampaignState(this._campaign, this._title);
}

class _EditCampaignState extends State<EditCampaign> {
  Arsenals arsenalsCache;
  Gears gearsCache;
  Artefacts artefactsCache;
  MolochStones molochStonesCache;
  Campaign campaign;
  String title;
  final _campaignNameController = TextEditingController();
  final _nemesisNameController = TextEditingController();
  final _player1NameController = TextEditingController();
  final _player2NameController = TextEditingController();
  final _player3NameController = TextEditingController();
  final _player4NameController = TextEditingController();

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();


  _EditCampaignState(this.campaign, this.title);

  @override
  void initState() {
    super.initState();
    _campaignNameController.text = campaign.name;
    _nemesisNameController.text = campaign.nemesis.playerName;
    _player1NameController.text = campaign.characters[0].playerName;
    _player2NameController.text = campaign.characters[1].playerName;
    _player3NameController.text = campaign.characters[2].playerName;
    _player4NameController.text = campaign.characters[3].playerName;

    if (this.arsenalsCache == null) {
      Arsenals.loadFromAsset().then((Arsenals arsenals) {
        setState(() {
          this.arsenalsCache = arsenals;
        });
      });
    }
    if (this.gearsCache == null) {
      Gears.loadFromAsset().then((Gears gears) {
        setState(() {
          this.gearsCache = gears;
        });
      });
    }
    if (this.artefactsCache == null) {
      Artefacts.loadFromAsset().then((Artefacts artefacts) {
        setState(() {
          this.artefactsCache = artefacts;
        });
      });
    };
    if (this.molochStonesCache == null) {
      MolochStones.loadFromAsset().then((MolochStones molochStones) {
        setState(() {
          this.molochStonesCache = molochStones;
        });
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    if (this.arsenalsCache == null || gearsCache == null || molochStonesCache == null || artefactsCache == null) {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(title,),
          centerTitle: true,
        ),
      );
    }

    return Stack(
      children: <Widget>[
        new Container(
          child: Container(),
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/rusty.jpg'), fit: BoxFit.cover)),
        ),
        Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(title, style: TextStyle(fontFamily: 'steamwreck', fontSize: 36, color: Colors.amber)),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  if (widget.crudAction == CRUDAction.UPDATE) {
                    _save(context);
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
            backgroundColor: Colors.transparent,
            body:
            Container(
              /*decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/rusty.jpg"),
                    fit: BoxFit.cover,
                  )
              ),*/
              child:
              SingleChildScrollView(
                  child:
                  Form(
                      key: _formKey,
                      child: ColumnWithPadding(
                          edgeInsets: EdgeInsets.all(10),
                          children: [
                            Card (
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              color: CustomTheme.cardBackgroundColor,
                              margin: EdgeInsets.all(5),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please enter the name of the campaign!";
                                    }
                                  },
                                  controller: _campaignNameController,
                                  decoration: InputDecoration(labelText: "Campaign name"),
                                ),
                              ),
                            ),
                            _buildNemesisInput(),
                            _buildPlayerInput(1, _player1NameController),
                            _buildPlayerInput(2, _player2NameController),
                            _buildPlayerInput(3, _player3NameController),
                            _buildPlayerInput(4, _player4NameController),
                            widget.crudAction == CRUDAction.CREATE ? SmogImageButton(
                              title: "Save Campaign",
                                onPressed: () {
                                  _save(context);
                                }
                            ) : Container(),
                          ]
                      )
                  )
              )
            ),
          ),
      ],
    );
  }

  Widget _buildNemesisInput() {
    return
      Card(
          color: CustomTheme.cardBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: EdgeInsets.all(5),
        child:
            Padding(
                padding: EdgeInsets.all(10),
              child:
                ColumnWithPadding(
                    edgeInsets: EdgeInsets.all(2),
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage('assets/nemesis.jpg'),
                                      fit: BoxFit.fill
                                  ),
                                ),
                                height: 50,
                                width: 50,
                              ),
                            ),
                            Text("Nemesis", style: Theme.of(context).textTheme.headline,),
                          ]
                      ),
                      TextFormField(
                        controller: _nemesisNameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter the name of the nemesis player!";
                          }
                        },
                        decoration: InputDecoration(labelText: "Nemesis player name"),
                      ),
                      ButtonTheme(
                        padding: EdgeInsets.all(0),
                        child:
                          ButtonBar(
                            mainAxisSize: MainAxisSize.max,
                            alignment: MainAxisAlignment.spaceAround,
                            children: [
                              FlatButton(
                                child: Text("Power cards"),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MultiSelectListScreen(
                                    fullList: Power.getAll(),
                                    selectedList: campaign.nemesis.powers,
                                    title: "Nemesis Power Cards",
                                  )));
                                },
                              ),
                              FlatButton(
                                child: Text("Moloch stones"),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MultiSelectListScreen(
                                    fullList: molochStonesCache.allMolochStone,
                                    selectedList: campaign.nemesis.molochStones,
                                    title: "Nemesis Moloch Stone Cards",
                                  )));
                                },
                              ),
                            ],
                          ),
                      )
                    ]),
            )
      );
  }

  Widget _buildPlayerInput(int index, TextEditingController controller) {
    return Card(
        color: CustomTheme.cardBackgroundColor,
      elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: EdgeInsets.all(5),
        child:
          Container(
            /*decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage("assets/rust_card.jpg"),
                fit: BoxFit.cover,
              )
            ),*/
            child: Padding(
                padding: EdgeInsets.all(10),
                child:
                  ColumnWithPadding(
                    edgeInsets: EdgeInsets.all(2),
                    children: <Widget>[
                      _buildPlayerHeader(index),
                      _buildPlayerName(index, controller),
                      _buildPlayerGentleman(index, controller),
                      _buildPlayerRole(index, controller),
                      _buildPlayerButtons(index),
                    ],
                  )
            ),
          )
    );
  }

  Widget _buildPlayerHeader(int index) {
    Row result = Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        ]
    );

    if (campaign.characters[index-1]?.picture != null) {
      result.children.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: campaign.characters[index-1].picture == null ? null : DecorationImage(
                    image: AssetImage(campaign.characters[index-1].picture),
                    fit: BoxFit.fill
                ),
              ),
              height: 50,
              width: 50,
            ),
          )
      );
    }

    result.children.add(Text("Player $index.", style: Theme.of(context).textTheme.headline, ));
    return result;
  }

  Widget _buildPlayerRole(int index, TextEditingController controller) {
    return DropdownButtonFormField<Role>(
      items: campaign.getAvailableRoles(campaign.characters[index-1]).map((Role role) {
        return DropdownMenuItem<Role>(
            value: role,
            child: Text(role.toString().split(".").last)
        );
      }).toList(),
      hint: Text("Player's role"),
      value: campaign.characters[index-1].role,
      onChanged: (newVal) {
        setState(() {
          campaign.characters[index-1].role = newVal;
        });
      },
      validator: (value) {
        if (value == null) {
          return "Please choose a role";
        }
      },
    );
  }

  Widget _buildPlayerGentleman(int index, TextEditingController controller) {
    return DropdownButtonFormField<Gentleman>(
      items: campaign.getAvailableGentleman(campaign.characters[index-1]).map((Gentleman gentleman) {
        var job = gentleman.job.toString().split(".").last;
        return DropdownMenuItem<Gentleman>(
            value: gentleman,
            child: Text("${gentleman.name} ($job)")
        );
      }).toList(),
      hint: Text("Player's gentleman"),
      value: (campaign.characters[index-1].name != null ? campaign.characters[index-1] : null),
      onChanged: (newVal) {
        setState(() {
          campaign.characters[index-1].updateMainData(newVal);
        });
      },
      validator: (value) {
        if (value == null || value.name == null) {
          return "Please choose a gentleman";
        }
      },
    );
  }

  Widget _buildPlayerName(int index, TextEditingController controller) {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter the name of the player!";
        }
      },
      controller: controller,
      decoration: InputDecoration(labelText: "Player name"),
    );
  }

  Widget _buildPlayerButtons(int index) {
    return ButtonTheme(
      padding: EdgeInsets.all(0.0),
      child: ButtonBar(
        mainAxisSize: MainAxisSize.max,
        alignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FlatButton(
            child: Text("Items"),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildItemButtons(index);
                  },
              );
            },
          ),
          FlatButton(
            child: Text("Upgrades"),
            onPressed: campaign.characters[index-1]?.job == null ? null : () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MultiSelectListScreen(
                  fullList: Upgrade.getAvaliableUpgrades(campaign.characters[index-1]?.job),
                  selectedList: campaign.characters[index-1].upgrades,
                  title: "Player $index. Upgrades",
                )));
            },
          ),
        ],
      ),
    );
  }

  void _save(BuildContext context) {
    print("qwe");
    if (_formKey.currentState.validate()) {
      if (!campaign.hasLeader()) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text("Gentlemen must have one Leader!"),
          duration: Duration(seconds: 3),
        ));
      } else {
        campaign.name = _campaignNameController.text;
        campaign.nemesis.playerName = _nemesisNameController.text;
        campaign.characters[0].playerName = _player1NameController.text;
        campaign.characters[1].playerName = _player2NameController.text;
        campaign.characters[2].playerName = _player3NameController.text;
        campaign.characters[3].playerName = _player4NameController.text;
        if (widget.crudAction == CRUDAction.CREATE) {
          Navigator.of(context).popAndPushNamed('/list', result: campaign);
        } else {
          Navigator.of(context).pop(campaign);
        }

      }
    }
  }

  Widget _buildItemButtons(int index) {
    return Container(
      color: Colors.black54,
      height: 210,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            ),
            color: Theme.of(context).canvasColor,
        ),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FlatButton(
              child: Text("Arsenals"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MultiSelectListScreen(
                  fullList: arsenalsCache.allArsenal,
                  selectedList: campaign.characters[index-1].arsenals,
                  title: "Player $index. Arsenal Cards",
                )));
              },
            ),
            FlatButton(
              child: Text("Artefacts"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MultiSelectListScreen(
                  fullList: artefactsCache.allArtefact,
                  selectedList: campaign.characters[index-1].artefacts,
                  title: "Player $index. Artefact Cards",
                )));
              },
            ),
            FlatButton(
              child: Text("Gears"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MultiSelectListScreen(
                  fullList: gearsCache.allGear,
                  selectedList: campaign.characters[index-1].gears,
                  title: "Player $index. Gear Cards",
                )));
              },
            ),
            FlatButton(
              child: Text("Moloch stones"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MultiSelectListScreen(
                  fullList: molochStonesCache.allMolochStone,
                  selectedList: campaign.characters[index-1].molochStones,
                  title: "Player $index. Moloch Stone Cards",
                )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
