// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, prefer_const_constructors_in_immutables, unnecessary_null_comparison, avoid_print, prefer_interpolation_to_compose_strings, curly_braces_in_flow_control_structures
/*
import 'package:acpe_church/core/utils/loading.dart';
import 'package:acpe_church/models/user.dart';
import 'package:acpe_church/screens/login/components/resetPassword.dart';
import 'package:acpe_church/services/auth.dart';
import 'package:acpe_church/services/database.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:acpe_church/admin/screens/home/dashboard_screen.dart';
import 'package:acpe_church/config/style/colors.dart';
import 'package:acpe_church/constants.dart';
import 'package:acpe_church/controllers/darkThemeController.dart';
import 'package:acpe_church/core/widget/app_button_widget.dart';
import 'package:acpe_church/core/widget/input_widget.dart';
import 'package:acpe_church/responsive.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'components/page_right_side.dart';

class Login extends StatefulWidget {
  Login({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {

  var tweenLeft = Tween<Offset>(begin: Offset(-3, 0), end: Offset(0, 0))
      .chain(CurveTween(curve: Curves.ease));
  var tweenRight = Tween<Offset>(begin: Offset(0, 0), end: Offset(-3, 0))
      .chain(CurveTween(curve: Curves.ease));

  AnimationController? _animationController;
  AnimationController? rippleController;

  Animation<double>? rippleAnimation;

  var _isMoved = false;

  bool isChecked = false;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );

    rippleController = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    rippleAnimation = Tween<double>(begin:45.0 , end:50.0)
        .animate(rippleController!)..addStatusListener((status){
      if(status == AnimationStatus.completed){
        rippleController!.reverse();
      }
      else  if(status == AnimationStatus.dismissed){
        rippleController!.forward();
      }
    });

    rippleController!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<DarkThemeProvider>(context);
    final Size _size = MediaQuery.of(context).size;

    //final userm = Provider.of<UserM>(context);
    //UserM.currentUser = userm;
    return Scaffold(
      backgroundColor: themeProvider.darkTheme
          ? AppColors.darkBgColor: AppColors.lightBgColor,
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[

          Center(
            child: SingleChildScrollView(

              child: Container(
                height: 640,
                width: 1180,
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color:themeProvider.darkTheme
                      ? AppColors.darkSecondaryColor: AppColors.lightSecondaryColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white10),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      //flex:1,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          child: Card(
                            //elevation: 5,
                            color:themeProvider.darkTheme
                                ? AppColors.darkBgColor: AppColors.lightBgColor,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/logo/logo_icon.png"),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                  // child: Image.asset()
                                ), //scale: 1
                                //Flexible(
                                //  child: _loginScreen(context),
                                //),
                                //_loginScreen(context),

                                Flexible(
                                  //flex: 1,
                                  //fit: FlexFit.loose,
                                  child: Stack(
                                    fit: StackFit.loose,
                                    clipBehavior: Clip.none,
                                    children: [
                                      SlideTransition(
                                        position:
                                        _animationController!.drive(tweenLeft),
                                        child: _loginScreen(context),
                                        /*Stack(
                                            fit: StackFit.loose,
                                            clipBehavior: Clip.none,
                                            children: [

                                            ]
                                        ),*/
                                      ),
                                      SlideTransition(
                                        position:
                                        _animationController!.drive(tweenRight),
                                        child: _registerScreen(context),
                                        /*Stack(
                                            fit: StackFit.loose,
                                            clipBehavior: Clip.none,
                                            children: [

                                            ]
                                        ),*/
                                      ),
                                    ],
                                  ),
                                ),

                                //Flexible(
                                //  child: SlideTransition(
                                //    position: _animationController!.drive(tweenLeft),
                                //    child: Stack(
                                //        fit: StackFit.loose,
                                //        clipBehavior: Clip.none,
                                //        children: [
                                //          _registerScreen(context),
                                //        ]),
                                //  ),
                                //),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    if(!Responsive.isMobile(context))
                      PageRightSide(
                        title: "Very good works are\nwaiting for you 🤝",
                      ),
                    /*Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width / 2,
                        color: Colors.white,
                        child: SliderWidget(),
                      ),*/
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            //bottom: 0,
            bottom: Responsive.isDesktop(context)?
            _size.height-80
                :
            Responsive.isTablet(context)?
            _size.height-80
                :
            _size.height-80,
            right: _size.width-60,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: AnimatedBuilder(
                animation: rippleAnimation!,
                builder: (_,child)=>Container(
                  width: rippleAnimation!.value,
                  height: rippleAnimation!.value,
                  margin: const EdgeInsets.only(bottom:5),
                  decoration:const  BoxDecoration(
                    shape: BoxShape.circle,
                    color:AppColors.kPrimaryColor,
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_left,
                    color:AppColors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  final keysR = GlobalKey<FormState>();
  final keysL = GlobalKey<FormState>();

  String? emailR, passR, cPass, pseu;
  String? emailL, passL;

  AuthServices auth = AuthServices();

  Container _registerScreen(BuildContext context) {

    final themeProvider = Provider.of<DarkThemeProvider>(context);
    //final userm = Provider.of<UserM>(context);
    //UserM.currentUser = userm;

    return Container(
      padding: const EdgeInsets.only(left:30.0,right: 30.0),
      //width: double.infinity,
      /*constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 0.0,
      ),*/
      child: ListView(

        children: [
          const SizedBox(height:kDefaultPadding/2,),
          Text('Inscrivez-vous ici',
            style:GoogleFonts.aBeeZee(
              fontWeight: FontWeight.bold,
              color: !themeProvider.darkTheme
                  ?
              AppColors.kDarkBlackColor: AppColors.kLightBlackColor,
            ) ,
          ),
          const SizedBox(height:kDefaultPadding/2,),

          Form(
            key:keysR,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                InputWidget(
                  keyboardType: TextInputType.text,
                 // onSaved: (String? value) {},
                  onChanged: (String? value) => pseu = value!,
                  validator: (String? value)=> value!.isEmpty ? "Champ vide" : null,
                  topLabel: "Nom",
                  hintText: "Entrer votre nom",
                  // prefixIcon: FlutterIcons.chevron_left_fea,
                ),
                const SizedBox(height: 8.0),
                InputWidget(
                  keyboardType: TextInputType.emailAddress,
                 // onSaved: (String? value) {},
                  onChanged: (String? value) => emailR = value!,
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
                const SizedBox(height: 8.0),
                InputWidget(
                  topLabel: "Password",
                  obscureText: true,
                  hintText: "Entrer votre Password",
                  //onSaved: (String? uPassword) {},
                  onChanged: (String? value) {
                    passR = value!;
                  },
                  validator: (String? value) {
                    return value!.isEmpty  //NULL SAFETY
                        ? "Champ vide"
                        : value.length < 6
                        ? "le password doit être plus de 6"
                        : null;
                  },
                ),
                const SizedBox(height: 8.0),
                InputWidget(
                  topLabel: "Confirmer Password",
                  obscureText: true,
                  hintText: "Confirmer votre Password",
                  //onSaved: (String? uPassword) {},
                  onChanged: (String? value) {
                    cPass = value!;
                  },
                  validator: (String? value) {
                    return value!.isEmpty  //NULL SAFETY
                        ? "Champ vide"
                        : value.length < 6
                        ? "le password doit être plus de 6"
                        : null;
                  },
                ),
                const SizedBox(height: 24.0),
                AppButton(
                  type: ButtonType.PRIMARY,
                  text: "S'inscrire",
                  onPressed: () async {
                    if (keysR.currentState!.validate() &&  passR == cPass ) {
                      loading(context);
                      print(emailR! + "    " + passR!);
                      bool register = await auth.signUp(emailR!, passR!, pseu!);
                      if (register != null) {
                        Navigator.of(context).pop();
                        if (register) {
                          Navigator.of(context).pop();
                          messages(context,
                              msg: 'Inscription avec succes');
                        }
                      }
                      else{
                        messages(context,
                            msg:"L'inscription a echoue");
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
                          checkColor:themeProvider.darkTheme
                              ?
                          AppColors.kDarkBlackColor: AppColors.kLightBlackColor,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text("Se souvenir de moi",
                          style:GoogleFonts.aBeeZee(
                            color: !themeProvider.darkTheme
                                ?
                            AppColors.kDarkBlackColor: AppColors.kLightBlackColor,
                          ) ,
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
                        "Avez-vous deja un compte?",
                        style:GoogleFonts.aBeeZee(
                          color: !themeProvider.darkTheme
                              ?
                          AppColors.kDarkBlackColor: AppColors.kLightBlackColor,
                        ) ,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      TextButton(
                        onPressed: () {
                          if (_isMoved) {
                            _animationController!.reverse();
                          } else {
                            _animationController!.forward();
                          }
                          _isMoved = !_isMoved;
                        },
                        child: Text("Connectez-vous ici",
                            style: GoogleFonts.aBeeZee(
                              color: AppColors.kPrimaryColor
                            ) ,
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

  Container _loginScreen(BuildContext context) {

    final themeProvider = Provider.of<DarkThemeProvider>(context);

    //final userm = Provider.of<UserM>(context);
    //UserM.currentUser = userm;

    return Container(
      padding: const EdgeInsets.only(left:30.0,right: 30.0),
      /*width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 0.0,
      ),*/
      child: ListView(
        children: [
          SizedBox(height: kDefaultPadding/2,),
          Text('Connectez-vous ici',
            style:GoogleFonts.aBeeZee(
              fontWeight: FontWeight.bold,
              color: !themeProvider.darkTheme
                  ?
              AppColors.kDarkBlackColor: AppColors.kLightBlackColor,
            ) ,
          ),
          SizedBox(height: kDefaultPadding/2,),
          Form(
            key: keysL,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InputWidget(
                  keyboardType: TextInputType.emailAddress,
                  // onSaved: (String? value) {},
                  onChanged: (String? value) => emailL = value!,
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
                  // prefixIcon: FlutterIcons.chevron_left_fea,
                ),
                SizedBox(height: 8.0),
                InputWidget(
                  topLabel: "Password",
                  obscureText: true,
                  hintText: "Entrer votre Password",
                  //onSaved: (String? uPassword) {},
                  onChanged: (String? value) {
                    passL = value!;
                  },
                  validator: (String? value) {
                    return value!.isEmpty  //NULL SAFETY
                        ? "Champ vide"
                        : value.length < 6
                        ? "le password doit être plus de 6"
                        : null;
                  },
                ),
                SizedBox(height: 24.0),
                AppButton(
                  type: ButtonType.PRIMARY,
                  text: "Se connecter",
                  onPressed: ()  async{
                    if (keysL.currentState!.validate()) {
                      loading(context);
                      print(emailL! + "    " + passL!);
                      bool login = await auth.signIn(emailL!, passL!);
                      if (login != null) {
                        Navigator.of(context).pop();

                        /*
                        Navigator.push(context, MaterialPageRoute(
                            builder: (_) => HomeAdminScreen(),
                            fullscreenDialog: true
                        ));
                        //

                        Navigator.push(context, MaterialPageRoute(
                            builder: (_) =>
                            StreamProvider<UserM?>.value(
                              value: DBServices().getCurrentUser,
                              initialData: null,
                              child: HomeAdminScreen(),
                            ),
                            fullscreenDialog: true
                        ));

                         */
                        //ADMIN ????????????????
                        /*
                        if (userm != null) {
                          messages(context,
                              msg:" La connexion a ete faite avec succes");
                          if (userm.admin) {

                          }
                          else {
                            setState(() {
                              Navigator.of(context).pop();
                            });
                          }
                        }
*/
                        if (!login) {
                          messages(context,
                            msg: 'email ou mot de passe incorrect');
                        }
                      }
                      else{
                        messages(context,
                            msg:" La connexion a echouee");
                      }
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
                          checkColor:themeProvider.darkTheme
                              ?
                          AppColors.kDarkBlackColor: AppColors.kLightBlackColor,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text("Se souvenir de moi"
                        , style:GoogleFonts.aBeeZee(
                            color: !themeProvider.darkTheme
                                ?
                            AppColors.kDarkBlackColor: AppColors.kLightBlackColor,
                          ) ,
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        /*Navigator.push(context, MaterialPageRoute(
                            builder:(_)=> ResetPassword(),
                          fullscreenDialog: true,
                        ));*/
                      },
                      child: Text(
                        "Mot de passe oublie?",
                        textAlign: TextAlign.right,
                        style: GoogleFonts.aBeeZee(
                          height: 1.5,
                          color:AppColors.kPrimaryColor

                        ),
                      ),
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
                        "N'avez-vous pas encore creer de compte?",
                        style: GoogleFonts.aBeeZee(
                          color: !themeProvider.darkTheme
                              ?
                          AppColors.kDarkBlackColor: AppColors.kLightBlackColor,
                        ) ,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      TextButton(
                        onPressed: () {
                          if (_isMoved) {
                            _animationController!.reverse();
                          } else {
                            _animationController!.forward();
                          }
                          _isMoved = !_isMoved;
                        },
                        child: Text("Inscrivez-vous ici",
                            style: GoogleFonts.aBeeZee(
                              color:
                              AppColors.kPrimaryColor,
                            ) ,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kDefaultPadding/2,),
          Row(children: [
            Expanded(
              child: Divider(
                color: !themeProvider.darkTheme
                    ?
                Colors.black12:Colors.white10,
                height: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("Ou continuez avec",
                style:GoogleFonts.aBeeZee(
                  color: !themeProvider.darkTheme
                      ?
                  AppColors.kDarkBlackColor: AppColors.kLightBlackColor,
                ) ,
              ),
            ),
            Expanded(
              child: Divider(
                color: !themeProvider.darkTheme
                    ?
                Colors.black12:Colors.white10,
                height: 50,
              ),
            ),
          ]
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //_loginWithButton(image: 'images/github.png'),

              _loginWithButton(image: 'images/google.png'),

              //_loginWithButton(image: 'images/facebook.png'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _loginWithButton({String? image}) {

    final themeProvider = Provider.of<DarkThemeProvider>(context);
    final userm = Provider.of<UserM>(context);
    return GestureDetector(
      onTap: () async {
        loading(context);
        //bool googleSignIn = await auth.googleSignIn();
        //if (googleSignIn != null) Navigator.of(context).pop();
      },
      child: Container(
        width: 90,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:!themeProvider.darkTheme
                ?
            Colors.black12:Colors.white10,
          ),
        ),
        child: Center(
            child: Container(
              decoration: BoxDecoration(),
              child: Image.asset(
                '$image',
                width: 35,
              ),
            )),
      ),
    );
  }
}


 */