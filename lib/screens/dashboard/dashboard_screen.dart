import 'package:monalystics/screens/analysis/analysis_screen.dart';
import 'package:monalystics/screens/influencers/influencer_screen.dart';
import 'package:monalystics/screens/searchEngine/search_screen.dart';
import 'package:monalystics/screens/stock/stock_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../config/values/values.dart';
import '../../controllers/MenuProjectController.dart';
import '../../controllers/enums.dart';
import '../../responsive.dart';
import '../home/home_screen.dart';
import 'components/hidden_side_menu.dart';
import 'components/side_menu.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    Key? key
  }) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
       return Scaffold(
         backgroundColor:  AppColors.white,
         drawer: const HiddenSideMenu(
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
                       child:SideMenu (
                       ),
                     ),
                   Expanded(
                     // It takes 5/6 part of the screen
                     flex: 5,
                     child: Consumer<MenuProjectController>(

                       builder: (BuildContext context, MenuProjectController value, Widget? child) {
                         if (value.menuType == MenuType.home) {
                           return const HomeScreen();
                         } else  if (value.menuType  == MenuType.analysis) {
                           return const AnalysisScreen();
                         }
                         else if (value.menuType  == MenuType.searchEngine) {
                           return const SearchEngineScreen();
                         }
                         else if (value.menuType  == MenuType.influencers) {
                           return const InfluencerScreen();
                         }
                         else {
                           return const StockScreen();
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
