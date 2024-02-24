import 'package:flutter/material.dart';
import '../controllers/MenuProjectController.dart';
import '../controllers/enums.dart';

List<MenuProjectController> menuItems = [
  MenuProjectController(
      MenuType.home, svgSrc:"assets/icons/menu_dashbord.svg", title: 'Home'
  ),
  MenuProjectController(
      MenuType.analysis, svgSrc:"assets/icons/menu_tran.svg",title: 'Analysis'
  ),
  MenuProjectController(
      MenuType.searchEngine,svgSrc: "assets/icons/Search.svg", title: 'SearchEngine'
  ),
  MenuProjectController(
      MenuType.influencers, svgSrc:"assets/icons/menu_doc.svg",title: 'Influencers'
  ),
  MenuProjectController(
      MenuType.stock, svgSrc:"assets/icons/menu_store.svg",title: 'Stock'
  ),
];
