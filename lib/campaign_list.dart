import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smog_moloch/add_play.dart';
import 'package:smog_moloch/custom_widgets/crud_widget.dart';
import 'package:smog_moloch/custom_widgets/smog_image_button.dart';
import 'package:smog_moloch/game_objects/gentleman.dart';
import 'package:smog_moloch/game_objects/play.dart';

import 'custom_icon_button.dart';
import 'edit_campaign.dart';
import 'game_objects/campaign.dart';
import 'game_objects/campaigns.dart';
import 'state_container.dart';
import 'my_flutter_app_icons.dart';

class CampaignList extends StatefulWidget {
  @override
  _CampaignListState createState() => _CampaignListState();
}

class _CampaignListState extends State<CampaignList> {
  _CampaignListState() {

  }

  @override
  Widget build(BuildContext context) {
    final Campaigns campaigns = StateContainer
        .of(context)
        .campaigns;
    final DateFormat df = StateContainer
        .of(context)
        .df;

    if (campaigns == null) {
      return Scaffold();
    }


    return Stack(
      children: <Widget>[
        new Container(
          child: Container(),
          decoration: BoxDecoration(image: DecorationImage(
              image: AssetImage('assets/rusty.jpg'), fit: BoxFit.cover)),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("Campaign List", style: TextStyle(fontFamily: 'steamwreck', fontSize: 36, color: Colors.amber)),
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
          body:
          Container(
              child:
                PageView.builder(
                  itemBuilder: (context, index) {
                    return _buildCampaignCard(context, campaigns, index);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: campaigns.campaigns.length,
                )
          ),
        ),
      ],
    );
  }



  Widget _buildCampaignCard(BuildContext context, Campaigns campaigns, index) {
    Campaign campaign = campaigns.campaigns[index];
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Card(
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Stack(
                      alignment: AlignmentDirectional(0, 0),
                      children: <Widget>[
                        Text("${campaign.name}", style: Theme.of(context).textTheme.headline, ),
                        Positioned(
                          right: 0,
                          child: ButtonTheme (
                            padding: EdgeInsets.all(0),
                            child:
                            ButtonBar (
                              alignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                CustomIconButton(
                                  icon: Icon(MyFlutterApp.trash_1),
                                  onPressed: () {
                                    _deleteCampaignDialog(context, campaigns, index);
                                  },
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(
                                    minHeight: 20.0,
                                    minWidth: 30.0,
                                  ),
                                ),
                                CustomIconButton(
                                  icon: Icon(MyFlutterApp.feather),
                                  onPressed: () async {
                                    Campaign returnedCampaign = await Navigator.push(context, MaterialPageRoute(builder: (context) => EditCampaign(campaign: campaign, title: "Edit Campaign", crudAction: CRUDAction.UPDATE,)));
                                    if (returnedCampaign != null) {
                                      setState(() {
                                        StateContainer.of(context).updateCampaigns();
                                      });
                                    }
                                  },
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(
                                    minHeight: 20.0,
                                    minWidth: 30.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    _buildPlayersBlock(context, campaign),
                    _buildPlaysBlock(context, campaign),
                  ],
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SmogImageButton(
              title: "Next chapter",
              onPressed: () async {
                Play returnedPlay = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddPlay(title: "Add play", crudAction: CRUDAction.CREATE,)));
                if (returnedPlay != null) {
                  setState(() {
                    campaign.plays.add(returnedPlay);
                    StateContainer.of(context).updateCampaigns();
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPlayersBlock(BuildContext context, Campaign campaign) {
    Column column = Column (
      crossAxisAlignment: CrossAxisAlignment.stretch,
       children: <Widget>[
         Text("Players", style: Theme.of(context).textTheme.title,),
         Padding(
           padding: const EdgeInsets.fromLTRB(8, 4, 0, 4),
           child: Row(
             children: <Widget>[
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
                   height: 60,
                   width: 60,
                 ),
               ),
               Column (
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text('Nemesis', style: Theme.of(context).textTheme.body1, textAlign: TextAlign.left,),
                   Text(campaign.nemesis?.playerName ?? "", style: Theme.of(context).textTheme.body2,  ),
                 ],
               ),
             ],
           )
         ),
         Divider(),
       ],
    );

    campaign.characters.forEach((Gentleman gentleman) {
      column.children.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 0, 4),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: gentleman.picture == null ? null : DecorationImage(
                          image: AssetImage(gentleman.picture),
                          fit: BoxFit.fill
                        ),
                    ),
                    height: 60,
                    width: 60,
                  ),
                ),
                Flexible (
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("${gentleman.name} (${gentleman.shortRole})", style: Theme.of(context).textTheme.body1, overflow: TextOverflow.fade, softWrap: false,),
                      Text(gentleman.playerName, style: Theme.of(context).textTheme.body2, overflow: TextOverflow.fade,),
                    ],
      ),
                ),
              ],
            ),
          ));
    });

    Widget result = new Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: column,
    );

    return result;
  }

  Widget _buildPlaysBlock(BuildContext context, Campaign campaign) {
    final DateFormat df = StateContainer.of(context).df;

    Column column = Column (
      //crossAxisAlignment: CrossAxisAlignment.stretch,
       children: <Widget>[
         Padding(
           padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Text("Plays", style: Theme.of(context).textTheme.title, textAlign: TextAlign.left,),
             ],
           ),
         ),
       ],
    );

    for(int playIndex = 0; playIndex < campaign.plays.length; playIndex++) {
      Play play = campaign.plays[playIndex];
      column.children.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 0, 4),
            child: Tooltip(
              message: "Tap to see ot edit details",
              child: GestureDetector(
                onTap: () async {
                  Play returnedPlay = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddPlay(title: "Edit play", play: play, crudAction: CRUDAction.UPDATE,)));
                  if (returnedPlay != null) {
                    setState(() {
                      StateContainer.of(context).updateCampaigns();
                    });
                  }
                },

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(play.scenario?.title ?? "", style: Theme.of(context).textTheme.body1,),
                        Text(df.format(play.date), style: Theme.of(context).textTheme.body2,),
                      ],
                    ),
                    ButtonTheme (
                      padding: EdgeInsets.all(0),
                      child: ButtonBar(
                          mainAxisSize: MainAxisSize.min,
                          alignment: MainAxisAlignment.end,
                          children: <Widget>[
                            CustomIconButton(
                              icon: Icon(MyFlutterApp.trash_1),
                              onPressed: () {
                                _deletePlayDialog(context, campaign, playIndex);
                              },
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(
                                minHeight: 20.0,
                                minWidth: 30.0,
                              ),
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
    }

    Widget result = new Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
        child: column,
    );

    return result;
  }


  void _deleteCampaignDialog(BuildContext context, Campaigns campaigns, int i) {
    Campaign campaign = campaigns.campaigns[i];
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Delete Campaign"),
            content: Text("This will delete all you campaign data for ${campaign.name}"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("Delete"),
                onPressed: () {
                  setState(() {
                    campaigns.campaigns.removeAt(i);
                    StateContainer.of(context).updateCampaigns();
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        }
    );
  }

  void _deletePlayDialog(BuildContext context, Campaign campaign, int playIndex) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Delete Play"),
            content: Text("Are you sure to delete this play?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("Delete"),
                onPressed: () {
                  setState(() {
                    campaign.plays.removeAt(playIndex);
                    StateContainer.of(context).updateCampaigns();
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        }
    );
  }
}