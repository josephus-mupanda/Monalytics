import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:url_launcher/url_launcher.dart';
import '../style/fonts.dart';

const kDuration = Duration(milliseconds: 600);

Future<void> openUrlLink(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  } else {
    throw 'Could not launch $url';
  }
}

scrollToSection(BuildContext context) {
  Scrollable.ensureVisible(
    context,
    duration: kDuration,
  );
}

void messageError(BuildContext context,{required String msg}){
  MotionToast.error(
    title:const Text("Message d'erreur",
      style: TextStyle(
          fontFamily:  Font.poppins
      ),),
    description:Text(msg,
      style: const TextStyle(
          fontFamily:  Font.poppins
      ),
    ),
    position: MotionToastPosition.top,
    animationCurve: Curves.bounceIn,
    animationType: AnimationType.fromTop,
    dismissable: false,
    animationDuration: const Duration(milliseconds: 1000),
    borderRadius: 0,

  ).show(context);
}

void messageWarning(BuildContext context,{required String msg}){
  MotionToast.warning(
    title:const Text("Message d' avertissement",
      style: TextStyle(
          fontFamily:  Font.poppins
      ),),
    description:Text(msg,
      style:const TextStyle(
          fontFamily:  Font.poppins
      ),
    ),
    position: MotionToastPosition.top,
    animationCurve: Curves.bounceIn,
    animationType: AnimationType.fromTop,
    dismissable: false,
    animationDuration: const Duration(milliseconds: 1000),
    borderRadius: 0,

  ).show(context);
}

void messageSuccess(BuildContext context,{required String msg}){
  MotionToast.success(
    title:const Text("Message de succes",
      style: TextStyle(
          fontFamily:  Font.poppins
      ),),
    description:Text(msg,
      style: const TextStyle(
          fontFamily:  Font.poppins
      ),
    ),
    position: MotionToastPosition.top,
    animationCurve: Curves.bounceIn,
    animationType: AnimationType.fromTop,
    dismissable: false,
    animationDuration: const Duration(milliseconds: 1000),
    borderRadius: 0,

  ).show(context);
}

void messageInfo(BuildContext context,{required String msg}){
  MotionToast.info(
    title:const Text("Informations",
      style: TextStyle(
          fontFamily:  Font.poppins
      ),),
    description:Text(msg,
      style: const TextStyle(
          fontFamily:  Font.poppins
      ),
    ),
    position: MotionToastPosition.top,
    animationCurve: Curves.bounceIn,
    animationType: AnimationType.fromTop,
    dismissable: false,
    animationDuration: const Duration(milliseconds: 1000),
    borderRadius: 0,

  ).show(context);
}

void messageDelete(BuildContext context,{required String msg}){
  MotionToast.delete(
    title:const Text("Message de suppression",
      style: TextStyle(
          fontFamily:  Font.poppins
      ),),
    description:Text(msg,
      style: const TextStyle(
          fontFamily:  Font.poppins
      ),),
    position: MotionToastPosition.top,
    animationCurve: Curves.bounceIn,
    animationType: AnimationType.fromTop,
    dismissable: false,
    animationDuration: const Duration(milliseconds: 1000),
    borderRadius: 0,

  ).show(context);
}
