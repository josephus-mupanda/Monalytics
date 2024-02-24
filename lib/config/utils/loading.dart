import 'package:flutter/material.dart';
import 'package:monalystics/config/values/values.dart';

loading (context) => showDialog(

    context: context,
    barrierDismissible: false,

    builder: (ctx) => Center(
      child:Container(
        width: 50,
        height: 50,
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
        ),
      ),
    ),
);
