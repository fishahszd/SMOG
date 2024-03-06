import 'package:flutter/material.dart';
import 'package:smog_moloch/campaign_list.dart';
import 'package:smog_moloch/custom_widgets/crud_widget.dart';
import 'package:smog_moloch/custom_widgets/custom_theme.dart';
import 'package:smog_moloch/custom_widgets/smog_image_button.dart';
import 'package:smog_moloch/edit_campaign.dart';
import 'custom_widgets/image_button.dart';
import 'game_objects/campaigns.dart';
import 'game_objects/campaign.dart';
import 'state_container.dart';

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Campaigns campaigns = StateContainer.of(context).campaigns;
    final Shadow shadow = Shadow(color: Colors.black, offset: Offset.fromDirection(1, 10));

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/rusty.jpg'), fit: BoxFit.cover)),
        child: Center(
          child:
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
                child: Column(
                  children: [
                    Text("SMOG: Rise of Moloch", style: TextStyle(fontFamily: 'steamwreck', fontSize: 50, color: Colors.amber, shadows: [shadow]),),
                    Text("Campaign Tracker", style: TextStyle(fontFamily: 'steamwreck', fontSize: 35, color: Colors.amber, shadows: [shadow]),),
                  ]
                ),
              ),

              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SmogImageButton(
                      onPressed: () async {
                        Campaign newCampaign = await Navigator.push(context, MaterialPageRoute(builder: (context) => EditCampaign(title: "New Campaign", crudAction: CRUDAction.CREATE,)));
                        if (newCampaign != null) {
                          campaigns.campaigns.add(newCampaign);
                          StateContainer.of(context).updateCampaigns();
                        }
                      },
                      title: "New Campaign"
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SmogImageButton(
                        onPressed: () async {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CampaignList()));
                        },
                        title: "Load Campaigns"
                    )
                  ),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }

}
