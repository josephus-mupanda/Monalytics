// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../style/fonts.dart';
import '../values/values.dart';
import '../widget/container_widget.dart';

class GetImage extends StatelessWidget {

  final String title;
  final String content;

  const GetImage({
    required this.title,
    required this.content,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();
    return AlertDialog(
      backgroundColor: AppColors.lightSecondaryColor ,
      title: Center(
        child: Column(
          children: [
            Icon(Icons.warning_outlined,
                size: 36, color: Colors.red),
            SizedBox(height:kDefaultPadding/2),
            Text(title,
              style:TextStyle(
                fontFamily: Font.poppins,
                color:  AppColors.kLightBlackColor,
              ) ,
            ),
          ],
        ),
      ),
       content: Container(
         color:AppColors.lightSecondaryColor,
         height: 90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              content,
              style:TextStyle(
                fontFamily: Font.poppins,
                color: AppColors.kLightBlackColor,
              ) ,
            ),
            SizedBox(
              height:kDefaultPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContainerWithOutBorder(
                  text:"camera",
                  color: AppColors.white,
                  press: () async {
                    //PickedFile? result = await picker.getImage(source: ImageSource.camera);
                    XFile? result = await picker.pickImage(source: ImageSource.camera);
                    //File? file = File(result!.path);
                    //PickedFile pickedFile = PickedFile(file.path);

                    Navigator.of(context).pop(result);
                  },
                ),
                SizedBox(
                  width: kDefaultPadding,
                ),
                ContainerWithBorder(
                    text:"Gallery",
                    color: Colors.redAccent,
                    press: ()  async {

                      XFile? result = await picker.pickImage(source: ImageSource.gallery);
                      //File? file = File(result!.path);
                      //PickedFile pickedFile = PickedFile(file.path);

                      Navigator.of(context).pop(result);
                    },
                ),
                /*
                ElevatedButton.icon(
                    icon: Icon(
                      Icons.camera_alt,
                      size: 14,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey),
                    onPressed: () async {
                     final result = await picker.getImage(source: ImageSource.camera);
                      Navigator.of(context).pop(File(result!.path));
                    },
                    label: Text("Camera")),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton.icon(
                    icon: Icon(
                      Icons.image,
                      size: 14,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red),
                    onPressed: ()  async {
                     final result = await picker.getImage(source: ImageSource.gallery);
                     Navigator.of(context).pop(File(result!.path));
                    },
                    label: Text("Gallery"))
                */
              ],
            ),
          ],
        ),
    ),
      );
  }
}