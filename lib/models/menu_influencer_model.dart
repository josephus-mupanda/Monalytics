import 'package:flutter/material.dart';
import 'package:monalystics/controllers/MenuInfluencerController.dart';
import '../controllers/MenuProjectController.dart';
import '../controllers/enums.dart';

List<MenuInfluencerController> menuInfluencersItems = [
  MenuInfluencerController(
      InfluencerMenuType.home, svgSrc:"assets/icons/menu_dashbord.svg", title: 'Home'
  ),
  MenuInfluencerController(
      InfluencerMenuType.analysis, svgSrc:"assets/icons/menu_tran.svg",title: 'Analysis'
  ),
  MenuInfluencerController(
      InfluencerMenuType.searchEngine,svgSrc: "assets/icons/Search.svg", title: 'SearchEngine'
  ),
  MenuInfluencerController(
      InfluencerMenuType.influencers, svgSrc:"assets/icons/menu_doc.svg",title: 'Influencers'
  ),
  MenuInfluencerController(
      InfluencerMenuType.stock, svgSrc:"assets/icons/menu_store.svg",title: 'Stock'
  ),
];
