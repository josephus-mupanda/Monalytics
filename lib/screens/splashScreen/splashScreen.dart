
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:monalystics/config/constants.dart';

import '../../config/routes/routes.dart';
import '../../config/style/fonts.dart';
import '../../config/values/values.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    displayScreen();
    super.initState();
  }

  displayScreen(){
    Timer(const Duration(seconds: 2),() async{

      Navigator.pushReplacementNamed(context, AppRoutes.onBoarding);

      // if(await EmiHome.auth.currentUser()!= null){
      //   Navigator.pushReplacement(context, MaterialPageRoute(
      //       builder:(_)=> HomePage()));
      // }
      // else{
      //   Navigator.pushReplacement(context, MaterialPageRoute(
      //       builder:(_)=> AstucePage()));
      // }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Container(
              height: 40,
              width: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImagePath.COMPANY_LOGO),
                    fit: BoxFit.cover
                ),
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            const Text(
              'We Help With Your Organizations  Growth',
              style: TextStyle(
                fontFamily: Font.poppins,
                fontWeight: FontWeight.bold,
                fontSize: 36,
                color: AppColors.kLightBlackColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: kDefaultPadding*1.5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding*2),
              child: Text(
                'Harness the Power of Social Media Insights,Forge Lucrative Influencer Partnerships, and Outsmart Your Competitors.\n Let us redefine success together!',
                style: TextStyle(
                  fontFamily: Font.poppins,
                  fontWeight: FontWeight.normal,
                  fontSize: 24,
                  color: AppColors.kLightBlackColor.withOpacity(0.5),
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const Spacer(),
            Container(
              alignment: Alignment.bottomCenter,
              height: 40,
              width: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImagePath.COMPANY_LOGO),
                    fit: BoxFit.cover
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
