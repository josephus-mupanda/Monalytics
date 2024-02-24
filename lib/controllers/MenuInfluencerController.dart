import 'package:flutter/material.dart';
import 'enums.dart';

class MenuInfluencerController extends ChangeNotifier {

  InfluencerMenuType menuType;
  String? title;
  String? svgSrc;

  MenuInfluencerController(this.menuType, {this.title,this.svgSrc});

  updateMenu(MenuInfluencerController menuInfo) {
    menuType = menuInfo.menuType;
    title = menuInfo.title;
    svgSrc = menuInfo.svgSrc;

//Important
    notifyListeners();
  }

}


