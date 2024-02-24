
// ignore_for_file: prefer_const_constructors, use_build_context_synchronously;, use_build_context_synchronously
import 'package:monalystics/config/constants.dart';
import 'package:monalystics/config/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:monalystics/config/widget/app_button_widget.dart';
import 'package:monalystics/config/widget/input_widget.dart';
import 'package:monalystics/responsive.dart';
import 'package:monalystics/screens/login/components/page_right_side.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../config/sizedBox_config.dart';
import '../../../config/style/fonts.dart';
import '../../../config/values/values.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.lightBgColor,
      body: Container(
        constraints: BoxConstraints(maxWidth: kMaxWidth),
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
                                decoration: BoxDecoration(
                                  //borderRadius: BorderRadius.circular(kDefaultPadding),
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
                                                SizedBox(
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
                                                        _resetForm(context),

                                                      ]),
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    if(Responsive.isDesktop(context))
                                      PageRightSide(
                                        title: "Dear user,\n Reset your password here 🤝",
                                        icon: ImagePath.ILLUSTRATION_IMAGE,
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

  final keysR = GlobalKey<FormState>();
  final keysL = GlobalKey<FormState>();

  String? emailR, passR, cPass, pseu;
  String? emailL, passL;

  //AuthServices auth = AuthServices();

  final key = GlobalKey<FormState>();

  String? email, msg = "";


  Container _resetForm(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),

      child: ListView(

        children: [
          const SizedBox(height: kDefaultPadding / 2),
          Text(
            'Reset your password',
            style: TextStyle(
              fontFamily: Font.poppins,
              fontWeight: FontWeight.bold,
              color: AppColors.kLightBlackColor,
            ),
          ),
          const SizedBox(height: kDefaultPadding / 2),

          Form(
            key:key,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                InputWidget(
                  keyboardType: TextInputType.emailAddress,
                  // onSaved: (String? value) {},
                  onChanged: (String? value) => email = value!,
                  validator: (String? value) {
                    return value!.isEmpty ?
                    "Champ vide"
                        :
                    value.contains('@')?
                    null
                        :
                    'Votre mail est incorrecte';
                  },

                  topLabel: "Email",
                  hintText: "Entrer votre E-mail",
                  //prefixIcon: FlutterIcons.email_alert_mco,
                ),
                const SizedBox(height: 24.0),
                AppButton(
                    type: ButtonType.PRIMARY,
                    text: "Send",
                    onPressed: () async {
                      if (key.currentState!.validate()) {
                        //loading(context);

                      }
                    }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
