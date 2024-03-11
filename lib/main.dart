import 'package:flutter/material.dart';
import 'package:monalystics/controllers/MenuInfluencerController.dart';
import 'package:monalystics/screens/InfluencerSection/dashboard/dashboard_screen.dart';
import 'package:monalystics/screens/forms/input_form.dart';
import 'package:provider/provider.dart';
import 'controllers/MenuProjectController.dart';
import 'controllers/enums.dart';
import 'screens/chooseAccounts/chooseAccount.dart';
import 'screens/companySection/dashboard/dashboard_screen.dart';
import 'screens/login/components/login.dart';
import 'screens/login/components/register.dart';
import 'screens/login/components/resetPassword.dart';
import 'config/constants.dart';
import 'config/routes/routes.dart';
import 'config/style/fonts.dart';
import 'config/values/values.dart';
import 'screens/onBoardingScreens/onboarding_screen.dart';
import 'screens/splashScreen/splashScreen.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  // ErrorWidget.builder = (FlutterErrorDetails details) => Material(
  //   color: AppColors.kGreenColor.withOpacity(0.5),
  //   borderRadius: BorderRadius.circular(kDefaultPadding/2),
  //   child:Center(
  //     child: Text(details.exception.toString(),
  //       style: const TextStyle(
  //         fontFamily: Font.poppins,
  //         color: AppColors.white,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuProjectController(MenuType.home),
        ),
        ChangeNotifierProvider(
          create: (context) => MenuInfluencerController(InfluencerMenuType.home),
        ),
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Monalytics',
        initialRoute: AppRoutes.initialRoute,

        routes: {
          AppRoutes.initialRoute: (context) => const SplashScreen(),

          AppRoutes.splashScreen : (context) => const SplashScreen(),
          AppRoutes.onBoarding : (context) => const OnBoardingScreen(),
          AppRoutes.chooseAccount: (context) => const ChooseAccount(),
          AppRoutes.formMaterial :(context) => FormMaterial(),

          AppRoutes.signIn : (context) => const LoginPage(),
          AppRoutes.resetPassword : (context) => const ResetPassword(),
          AppRoutes.signUp : (context) => const Register(),

          AppRoutes.companyDashboard : (context) => const DashboardScreen(),
          AppRoutes.influencerDashboard : (context) => const DashboardInfluencerScreen(),
          // AppRoutes.analysis : (context) => const AnalysisScreen(),
          // AppRoutes.searchEngine : (context) => const SearchEngineScreen(),
          // AppRoutes.influencer : (context) => const InfluencerScreen(),
          // AppRoutes.stock : (context) => const StockScreen(),

          },
        theme: ThemeData(
          primaryColor:AppColors.kPrimaryColor,
        //   dialogBackgroundColor:  AppColors.lightSecondaryColor,
        //   scaffoldBackgroundColor:  AppColors.lightBgColor,
        //   brightness:Brightness.light,
        //   elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: TextButton.styleFrom(
        //         backgroundColor: AppColors.white
        //     ),
        //   ),
        //   appBarTheme: const AppBarTheme(
        //     backgroundColor: AppColors.lightBgColor,
        //     elevation: 0.0,
        //   ),
        //   textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme).apply(
        //       bodyColor:AppColors.kLightBlackColor
        //   ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(
        //     background: AppColors.lightBgColor
        // ),
        ),
        //home: const Register(),
      ),
    );
  }
}

