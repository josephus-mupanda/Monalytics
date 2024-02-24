import 'package:flutter/material.dart';
import 'enums.dart';

class MenuProjectController extends ChangeNotifier {

  MenuType menuType;
  String? title;
  String? svgSrc;

  MenuProjectController(this.menuType, {this.title,this.svgSrc});

  updateMenu(MenuProjectController menuInfo) {
    menuType = menuInfo.menuType;
    title = menuInfo.title;
    svgSrc = menuInfo.svgSrc;

//Important
    notifyListeners();
  }

}


