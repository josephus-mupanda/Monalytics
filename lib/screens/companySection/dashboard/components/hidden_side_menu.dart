// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../controllers/enums.dart';
import '../../../../config/constants.dart';
import '../../../../config/routes/routes.dart';
import '../../../../config/style/fonts.dart';
import '../../../../config/utils/functions.dart';
import '../../../../config/values/values.dart';
import '../../../../controllers/MenuProjectController.dart';
import '../../../../controllers/enums.dart';
import '../../../../models/menu_model.dart';

class HiddenSideMenu extends StatefulWidget {
  final MenuType? isMenuType;

  const HiddenSideMenu({
    this.isMenuType,
    Key? key
  }) : super(key: key);

  @override
  State<HiddenSideMenu> createState() => _HiddenSideMenuState();
}

class _HiddenSideMenuState extends State<HiddenSideMenu> {

  bool isHover = false;

  void socialMediaLink(String url) async{
    if(await canLaunch(url)){
      try{
        await launch(url);
        messageSuccess(context, msg:" Votre lien a été lancé avec succes");
      }
      catch(error){
        messageError(context, msg: "Impossible de lancer cet url avec ce navigateur");
      }
    }
    else{
      //throw "il ya une erreur au niveau de $url";
      messageWarning(context, msg: "il ya une erreur au niveau de $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: SingleChildScrollView(
        child: Column(
            children: [
              DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: kDefaultPadding ,
                              vertical: kDefaultPadding
                          ),
                          child: Center(
                            child: Image.asset(
                              ImagePath.COMPANY_LOGO,
                              filterQuality: FilterQuality.none,
                              excludeFromSemantics: true,
                              fit: BoxFit.cover,
                            ),
                          )
                      ),
                      // const SizedBox(width: kDefaultPadding / 2),
                      // Text("Administrateur",
                      //   style: TextStyle(
                      //     fontFamily: Font.poppins,
                      //     color: !themeProvider.darkTheme
                      //         ?
                      //     AppColors.kDarkBlackColor: AppColors.kLightBlackColor,
                      //   ),
                      // )
                    ],
                  )
              ),

              Column (
                //mainAxisAlignment: MainAxisAlignment.start,
                children: menuItems.map((currentMenuInfo) =>
                    buildMenuAdminButton(currentMenuInfo)).toList(),
              ),

              // Column (
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     buildMenuAdmin(MenuType.home, Icons.home,'Home', context),
              //     buildMenuAdmin(MenuType.analysis,Icons.analytics, 'Analysis', context,),
              //     buildMenuAdmin(MenuType.searchEngine, Icons.search,'Search Engine', context),
              //     buildMenuAdmin(MenuType.influencers,Icons.person, 'Influencers', context),
              //     buildMenuAdmin(MenuType.stock,Icons.dashboard, 'Stock', context),
              //   ],
              //
              // ),
              const Divider(thickness: 1),
            ]
        ),
      ),
    );
  }
  Widget buildMenuAdmin(MenuType menuType, IconData icon, String title, BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
      child: Material(
        color:menuType == widget.isMenuType ?
         AppColors.kItemsBlueColor
            :  AppColors.lightBgColor,
        borderRadius: BorderRadius.circular(kDefaultPadding/2),
        child:  InkWell(
            borderRadius: BorderRadius.circular(kDefaultPadding/2),
            onTap: (){
              Navigator.pushNamed(context, _getRoute(menuType));
              Scaffold.of(context).closeDrawer();
            },
            onHover: (value) {
              setState(() {
                isHover = value;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding/2 ),
              child: Row(
                children: [
                  //const SizedBox(width: kDefaultPadding / 2),
                  Expanded (
                      child:Padding(
                        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2 ),
                        child: Row(
                          children: [
                            Icon(
                              icon,
                              color:
                              menuType == widget.isMenuType?
                              AppColors.kItemsBlueColor
                                  :
                              Colors.black
                            ),
                            const SizedBox(width: kDefaultPadding / 2),
                            Text(
                              title,
                              style: TextStyle(
                                fontFamily:  Font.poppins,
                                fontSize: 12,
                                color: menuType == widget.isMenuType?
                                AppColors.kItemsBlueColor
                                    :
                                Colors.black12,
                                fontWeight: menuType == widget.isMenuType ? FontWeight.w600 : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

  String _getRoute(MenuType menuTypeAdmin) {
    switch (menuTypeAdmin) {
      case MenuType.home:
        return AppRoutes.companyDashboard;
      case MenuType.analysis:
        return AppRoutes.analysis;
      case MenuType.searchEngine:
        return AppRoutes.searchEngine;
      case MenuType.influencers:
        return AppRoutes.influencer;
      case MenuType.stock:
        return AppRoutes.stock;
      default:
        return AppRoutes.companyDashboard;
    }
  }

  Widget buildMenuAdminButton(MenuProjectController currentMenuInfo) {

    return Consumer<MenuProjectController>(
      builder: (BuildContext context, MenuProjectController value, Widget? child) {
        return ListTile(
          onTap: (){
            var menuInfo = Provider.of<MenuProjectController>(context, listen: false);
            menuInfo.updateMenu(currentMenuInfo);
            Scaffold.of(context).closeDrawer();
          },
          horizontalTitleGap: 0.0,
          leading: SvgPicture.asset(
            currentMenuInfo.svgSrc ?? '',
            color:
            currentMenuInfo.menuType == value.menuType
                ?
            AppColors.kItemsBlueColor:Colors.black38,
            height: 16,
          ),
          title: Text(
            currentMenuInfo.title ?? '',
            style: TextStyle(
              fontFamily:  Font.poppins,
              fontSize: 12,
              color:
              currentMenuInfo.menuType == value.menuType
                  ?
              AppColors.kItemsBlueColor:Colors.black38,
              fontWeight: currentMenuInfo.menuType == value.menuType ?
                FontWeight.w600 : FontWeight.normal,
            ),
          ),
        );
      },
    );
  }
}
