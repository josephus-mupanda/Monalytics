import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../config/routes/routes.dart';
import '../../config/style/fonts.dart';
import '../../config/values/values.dart';
import '../../config/widget/app_button_widget.dart';
import '../../responsive.dart';
import '../login/components/page_right_side.dart';

class ChooseAccount extends StatefulWidget {
  const ChooseAccount({super.key});

  @override
  State<ChooseAccount> createState() => _ChooseAccountState();
}

class _ChooseAccountState extends State<ChooseAccount> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.lightBgColor,
        body: Container(
          constraints: const BoxConstraints(maxWidth: kMaxWidth),
          child: SafeArea (
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Stack(
                        fit: StackFit.loose,
                        children: [
                          Center(
                            child: SingleChildScrollView(
                              child:  Container(
                                height:size.height,
                                width: size.width,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: const BoxDecoration(
                                  color:AppColors.lightSecondaryColor,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Card(
                                            //elevation: 5,
                                            color: AppColors.white,
                                            child: Column(
                                              children: <Widget>[
                                                const SizedBox(
                                                  height: kDefaultPadding,
                                                ),

                                                Container(
                                                  height: 40,
                                                  width: 250,
                                                  decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(ImagePath.COMPANY_LOGO),
                                                        fit: BoxFit.cover
                                                    ),
                                                  ), // child: Image.asset()
                                                ),
                                                Flexible(
                                                  child: Stack(
                                                      fit: StackFit.loose,
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        _chooseAccount(context),

                                                      ]),
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    if(Responsive.isDesktop(context))
                                      const PageRightSide(
                                        title: "Dear user,\n select here the type of account 🤝",
                                        icon: "assets/images/svg/resetpassword.svg",
                                      ),
                                  ],
                                ),
                              ),
                            ),

                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  Container _chooseAccount(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),

      child: ListView(

        children: [
          const SizedBox(height: kDefaultPadding / 2),
          const Text(
            'Select the type of account you want to create',
            style: TextStyle(
              fontFamily: Font.poppins,
              fontWeight: FontWeight.bold,
              color: AppColors.kLightBlackColor,
            ),
          ),

          const SizedBox(height: kDefaultPadding / 2),
          Column(

            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              const SizedBox(height: 24.0),
              AppButton(
                  type: ButtonType.PRIMARY,
                  text: "Company",
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signUp);
                  }
              ),

              const SizedBox(height: 24.0),
              AppButton(
                  type: ButtonType.PLAIN,
                  text: "Influencer",
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signUp);
                  }
              ),
              const SizedBox(height: 24.0),

            ],
          ),
        ],
      ),
    );
  }
}
