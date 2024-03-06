import 'package:flutter/material.dart';

abstract class CRUDWidget extends StatefulWidget {
  CRUDAction crudAction;

  EditCampaign({@required crudAction}) {
    this.crudAction = crudAction;
  }
}

enum CRUDAction{CREATE, READ, UPDATE, DELETE}