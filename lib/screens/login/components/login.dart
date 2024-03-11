
// ignore_for_file: prefer_const_constructors, use_build_context_synchronously;, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../config/constants.dart';
import '../../../config/routes/routes.dart';
import '../../../config/sizedBox_config.dart';
import '../../../config/style/fonts.dart';
import '../../../config/title_config.dart';
import '../../../config/utils/functions.dart';
import '../../../config/utils/loading.dart';
import '../../../config/values/values.dart';
import '../../../config/widget/app_button_widget.dart';
import '../../../config/widget/input_widget.dart';
import '../../../responsive.dart';
import '../../../services/database.dart';
import 'page_right_side.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>  {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor:  AppColors.lightBgColor,
        body: Container(
          constraints: BoxConstraints(maxWidth: kMaxWidth),
          child: SafeArea(
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
                                  height: size.height,
                                  width: size.width,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    //borderRadius: BorderRadius.circular(kDefaultPadding),
                                    color:  AppColors.lightSecondaryColor,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(kDefaultPadding/2),
                                            child: Card(
                                              //elevation: 5,
                                              color:  AppColors.white,
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
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Stack(
                                                        fit: StackFit.loose,
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          _loginScreen(context),

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
                                            title: "Dear user,\nLog in here🤝",
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
                    )
                )

              ],
            ),
          ),
        )
    );
  }
  final keysL = GlobalKey<FormState>();

  String? emailL, passL;
  bool showPassword = false;
  bool isLoading = false;

  Container _loginScreen(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: ListView(
        children: [
          SizedBox(height: kDefaultPadding / 2),
          Text(
            "Log in here.",
            style: TextStyle(
              fontFamily: Font.poppins,
              fontWeight: FontWeight.bold,
              color: AppColors.kLightBlackColor,
            ),
          ),
          SizedBox(height: kDefaultPadding / 2),
          Form(
            key: keysL,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InputWidget(
                  topLabel: "Email",
                  hintText: "Enter your Email",
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(
                    FontAwesomeIcons.mailchimp,
                    size: 20,
                    color: AppColors.kLightBlackColor,
                  ),
                  onChanged: (String? value) => emailL = value!,
                  validator: (String? value) {
                    RegExp emailRegex = RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
                    return value!.isEmpty
                        ? "Field is required"
                        : !emailRegex.hasMatch(value)
                        ? "Invalid email format"
                        : null;
                  },

                ),
                SizedBox(height: 8.0),
                InputWidget(
                  hintText: "Enter your Password",
                  topLabel: "Password",
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
                    passL = value!;
                  },
                  validator: (String? value) {
                    return value!.isEmpty
                        ? "Field is required"
                        : value.length < 6
                        ? "Password must be at least 6 characters"
                        : null;
                  },
                ),
                SizedBox(height: 24.0),
                AppButton(
                  type: ButtonType.PRIMARY,
                  text: "Login",
                  onPressed: () async {
                    if (keysL.currentState!.validate()) {
                      loading(context);
                      bool login = await DBServices.loginCompany(emailL!, passL!);
                      Navigator.of(context).pop();
                      if (login != null) {

                        if (login) {
                          // login successful - navigate to home
                         // Navigator.of(context).pop();
                          messageSuccess(context, msg: "Login successful");
                          Navigator.pushNamed(context, AppRoutes.companyDashboard);
                        } else {
                          messageError(context, msg: "Login failed");
                          //Navigator.of(context).pop();
                        }
                      }

                      // try {
                      //   await Future.delayed(Duration(seconds: 2));
                      //   String loginResult = await DBServices.loginCompany(emailL!, passL!);
                      //   messageSuccess(context, msg: loginResult);
                      //   Navigator.pushNamed(context, AppRoutes.companyDashboard);
                      //   isLoading = false;
                      // } catch (error) {
                      //   messageError(context, msg: "Login failed");
                      // } finally {
                      //   setState(() {
                      //     isLoading = false;
                      //   });
                      // }

                    }
                  },
                ),
                SizedBox(height: 24.0),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.resetPassword);
                      },
                      child: Text(
                        "Forgot password?",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: Font.poppins,
                          height: 1.5,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: kDefaultPadding),
                Center(
                  child: Wrap(
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        "Haven't created an account yet?",
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
                          Navigator.pushNamed(context, AppRoutes.signUp);
                        },
                        child: Text(
                          "Sign up here",
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
          SizedBox(height: kDefaultPadding / 2),
          Row(
            children: const [
              Expanded(
                child: Divider(
                  color: Colors.black12,
                  height: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Or continue with",
                  style: TextStyle(
                    fontFamily: Font.poppins,
                    color: AppColors.kLightBlackColor,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.black12,
                  height: 50,
                ),
              ),
            ],
          ),
          SizedBox(
            height: kDefaultPadding/2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _loginWithButton(image: 'images/google.png'),
            ],
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
        ],
      ),
    );
  }
  Widget _loginWithButton({String? image}) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          loading(context);
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black12,
            ),
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(),
              child: Image.asset(
                '$image',
                width: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _loginWithButton({String? image}) {
  //
  //   return GestureDetector(
  //     onTap: () async {
  //       loading(context);
  //     },
  //     child: Container(
  //       //width: MediaQuery.of(context).size.width,
  //       height: 60,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(
  //           color:Colors.black12,
  //         ),
  //       ),
  //       child: Center(
  //           child: Container(
  //             decoration: BoxDecoration(),
  //             child: Image.asset(
  //               '$image',
  //               width: 35,
  //             ),
  //           )
  //       ),
  //     ),
  //   );
  // }
}
