
// ignore_for_file: prefer_const_constructors, use_build_context_synchronously;, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monalystics/config/utils/functions.dart';
import 'package:monalystics/config/utils/loading.dart';
import 'package:provider/provider.dart';

import '../../../config/constants.dart';
import '../../../config/routes/routes.dart';
import '../../../config/sizedBox_config.dart';
import '../../../config/style/fonts.dart';
import '../../../config/title_config.dart';
import '../../../config/values/values.dart';
import '../../../config/widget/app_button_widget.dart';
import '../../../config/widget/input_widget.dart';
import '../../../models/company.dart';
import '../../../responsive.dart';
import '../../../services/database.dart';
import 'page_right_side.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register>  {

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.lightBgColor,
        body: Container(
          constraints: BoxConstraints(maxWidth: kMaxWidth),
          child: SafeArea(
              child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          //SimpleSizedBoxHeight(),
                          Stack(
                            fit: StackFit.loose,
                            children: [
                              Center(
                                child: SingleChildScrollView(
                                  child:  Container(
                                    height:size.height ,
                                    //640,
                                    width: size.width,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                      //borderRadius: BorderRadius.circular(kDefaultPadding),
                                      color: AppColors.lightSecondaryColor,
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
                                                            _registerScreen(context),
                                                          ]
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        if(Responsive.isDesktop(context))
                                          PageRightSide(
                                            title: "Dear user,\nCreate your account here. 🤝",
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
                    )
                ]
            )
          ),
        ),
    );
  }

  final keysR = GlobalKey<FormState>();

  String? companyEmail, passR, cPass, companyName, companySector;

  bool showPassword = false;
  bool isRegistering = false;

  Container _registerScreen(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: ListView(
        children: [
          const SizedBox(height: kDefaultPadding / 2),
          Text(
            'Sign up here.',
            style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.bold,
              color: AppColors.kLightBlackColor,
            ),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          Form(
            key: keysR,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InputWidget(
                  topLabel: "Company",
                  hintText: "Enter your company name",
                  keyboardType: TextInputType.text,
                  prefixIcon: Icon(
                    FontAwesomeIcons.person,
                    size: 20,
                    color: AppColors.kLightBlackColor,
                  ),
                  onChanged: (String? value) => companyName = value!,
                  validator: (String? value) => value!.isEmpty ? "Field is required" : null,
                ),
                const SizedBox(height: 8.0),
                InputWidget(
                  topLabel: "Email",
                  hintText: "Enter your E-mail",
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(
                    FontAwesomeIcons.mailchimp,
                    size: 20,
                    color: AppColors.kLightBlackColor,
                  ),
                  onChanged: (String? value) => companyEmail = value!,
                  validator: (String? value) {
                    RegExp emailRegex = RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
                    return value!.isEmpty ? "Field is required" : !emailRegex.hasMatch(value) ? "Invalid email format" : null;
                  },
                ),
                const SizedBox(height: 8.0),
                InputWidget(
                  topLabel: "Sector",
                  hintText: "Enter your sector",
                  onChanged: (String? value) => companySector = value!,
                  validator: (String? value) => value!.isEmpty ? "Field is required" : null,
                  prefixIcon: Icon(
                    FontAwesomeIcons.building,
                    size: 20,
                    color: AppColors.kLightBlackColor,
                  ),
                ),
                const SizedBox(height: 8.0),
                InputWidget(
                  topLabel: "Password",
                  hintText: "Enter your Password",
                  prefixIcon: Icon(
                    FontAwesomeIcons.key,
                    size: 20,
                    color: AppColors.kLightBlackColor,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      showPassword ? Icons.visibility_off : Icons.visibility,
                      size: 20,
                      color: AppColors.kLightBlackColor,
                    ),
                  ),
                  maxLines: 1,
                  obscureText: showPassword ? false : true,
                  onChanged: (String? value) {
                    passR = value!;
                  },
                  validator: (String? value) {
                    return value!.isEmpty
                        ? "Field is required"
                        : value.length < 6
                        ? "Password must be at least 6 characters"
                        : null;
                  },
                ),
                const SizedBox(height: 8.0),
                InputWidget(
                  topLabel: "Confirm Password",
                  hintText: "Confirm your Password",
                  prefixIcon: Icon(
                    FontAwesomeIcons.key,
                    size: 20,
                    color: AppColors.kLightBlackColor,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      showPassword ? Icons.visibility_off : Icons.visibility,
                      size: 20,
                      color: AppColors.kLightBlackColor,
                    ),
                  ),
                  maxLines: 1,
                  obscureText: showPassword ? false : true,

                  onChanged: (String? value) {
                    cPass = value!;
                  },
                  validator: (String? value) {
                    return value!.isEmpty
                        ? "Field is required"
                        : value.length < 6
                        ? "Password must be at least 6 characters"
                        : value != passR
                        ? "Passwords do not match"
                        : null;
                  },
                ),
                const SizedBox(height: 24.0),
                AppButton(
                  type: ButtonType.PRIMARY,
                  text: "Sign up",
                  onPressed: () async {
                    if (keysR.currentState!.validate() && passR == cPass) {
                      final company = Company(
                        companyName: companyName!,
                        email: companyEmail!,
                        sector: companySector!,
                        password: passR!,
                      );
                      loading(context);
                      bool register = await DBServices.registerCompany(company);
                      Navigator.of(context).pop();
                      if (register != null) {
                        if (register) {
                          // Registration successful - navigate to home
                          //Navigator.of(context).pop();
                          messageSuccess(context, msg: "Registration successful");
                          Navigator.pushNamed(context, AppRoutes.signIn);
                        } else {
                          messageError(context, msg: "Registration failed");
                          //Navigator.of(context).pop();
                        }
                      }
                    }
                  },
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: isChecked,
                          checkColor: AppColors.kLightBlackColor,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text(
                          "Remember me",
                          style: TextStyle(
                            fontFamily: Font.poppins,
                            color: AppColors.kLightBlackColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24.0),
                Center(
                  child: Wrap(
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        "Do you already have an account?",
                        style: TextStyle(
                          fontFamily: Font.poppins,
                          color: AppColors.kLightBlackColor,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.signIn);
                        },
                        child: Text(
                          "Log in here",
                          style: TextStyle(
                            fontFamily: Font.poppins,
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      )
                    ],
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