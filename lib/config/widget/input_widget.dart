// ignore_for_file: unnecessary_this, prefer_const_constructors
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../style/fonts.dart';
import '../values/values.dart';


class InputWidget extends StatelessWidget {

  final String? hintText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? height;
  final String? topLabel;
  final bool? obscureText;
  final int? minLines;
  final int? maxLines;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final Key? kKey;
  final TextEditingController? kController;
  final String? kInitialValue;

  const InputWidget({super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.height = 36.0,
    this.topLabel = "",
    this.minLines,
    this.maxLines,
    this.obscureText = false,
    this.onSaved,
    this.keyboardType,
    this.errorText,
    this.onChanged,
    this.validator,
    this.kKey,
    this.kController,
    this.kInitialValue,
  });
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(this.topLabel!,style: TextStyle(
          fontFamily:  Font.poppins,
          fontSize: 12,
          color:  AppColors.kLightBlackColor.withOpacity(0.6),
        ),),
        SizedBox(height: 4.0),
        Container(
          //padding: EdgeInsets.all(kDefaultPadding/4),
          //height: 50,
          decoration: BoxDecoration(
            color:  AppColors.lightSecondaryColor,
            //color: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: TextFormField(
            initialValue: this.kInitialValue,
            controller: this.kController,
            style: TextStyle(
              fontFamily:  Font.poppins,
              fontSize: 12,
              color: AppColors.kLightBlackColor.withOpacity(0.6),
            ),
            minLines:this.minLines ,
            maxLines:this.maxLines ,
            //key: this.kKey,
            keyboardType: this.keyboardType,
            onSaved: this.onSaved,
            onChanged: this.onChanged,
            validator: this.validator,
            obscureText: this.obscureText!,
            decoration: InputDecoration(
                prefixIcon: this.prefixIcon,
                suffixIcon: this.suffixIcon,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(74, 77, 84, 0.2),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  //gapPadding: 16,
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                errorStyle: TextStyle(
                    fontFamily: Font.poppins,
                    fontSize: 12,
                    height: 1, color: Theme.of(context).errorColor),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).errorColor,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  //gapPaddings: 16,
                  borderSide: BorderSide(
                    color: Theme.of(context).errorColor,
                  ),
                ),
                hintText: this.hintText,
                hintStyle: TextStyle(
                  fontFamily:  Font.poppins,
                  color:  AppColors.kLightBlackColor.withOpacity(0.5),
                  fontWeight: FontWeight.normal,
                  fontSize: 12
                ),
                errorText: this.errorText),
          ),
        )
      ],
    );
  }
}

