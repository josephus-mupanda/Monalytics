import 'package:monalystics/controllers/MenuInfluencerController.dart';
import 'package:monalystics/screens/InfluencerSection/analysis/analysis_screen.dart';
import 'package:monalystics/screens/InfluencerSection/influencers/influencer_screen.dart';
import 'package:monalystics/screens/InfluencerSection/searchEngine/search_screen.dart';
import 'package:monalystics/screens/InfluencerSection/stock/stock_screen.dart';
import 'package:monalystics/screens/analysis/analysis_screen.dart';
import 'package:monalystics/screens/influencers/influencer_screen.dart';
import 'package:monalystics/screens/searchEngine/search_screen.dart';
import 'package:monalystics/screens/stock/stock_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../../config/style/colors.dart';
import '../../../controllers/MenuProjectController.dart';
import '../../../controllers/enums.dart';
import '../../../responsive.dart';
import '../home/home_screen.dart';
import 'components/hidden_side_menu.dart';
import 'components/side_menu.dart';

class DashboardInfluencerScreen extends StatefulWidget {
  const DashboardInfluencerScreen({
    Key? key
  }) : super(key: key);

  @override
  State<DashboardInfluencerScreen> createState() => _DashboardInfluencerScreenState();
}

class _DashboardInfluencerScreenState extends State<DashboardInfluencerScreen>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
       return Scaffold(
         backgroundColor:  AppColors.white,
         drawer: const HiddenSideMenuInfluencer(
         ),
         body: Stack(
           fit: StackFit.loose,
           children: [
             SafeArea(
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   if(Responsive.isDesktop(context))
                     const Expanded(
                       child:SideMenuInfluencer (
                       ),
                     ),
                   Expanded(
                     // It takes 5/6 part of the screen
                     flex: 5,
                     child: Consumer<MenuInfluencerController>(

                       builder: (BuildContext context, MenuInfluencerController value, Widget? child) {
                         if (value.menuType == InfluencerMenuType.home) {
                           return const HomeInfluencerScreen();
                         } else  if (value.menuType  == InfluencerMenuType.analysis) {
                           return const AnalysisInfluencerScreen();
                         }
                         else if (value.menuType  == InfluencerMenuType.searchEngine) {
                           return const SearchEngineInfluencerScreen();
                         }
                         else if (value.menuType  == InfluencerMenuType.influencers) {
                           return const InfluencersScreen();
                         }
                         else {
                           return const StockInfluencerScreen();
                         }
                       },
                     ),
                   ),
                 ],
               ),
             ),
           ],
         ),
       );
    }
}
