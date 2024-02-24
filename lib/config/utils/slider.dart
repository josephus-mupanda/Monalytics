// ignore_for_file: prefer_const_constructors


import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../values/values.dart';

class Sliders extends StatelessWidget {

  final List imgs;
  final String? title;
  final String? subTitle;

  const Sliders({
    Key? key,
    this.title,
    this.subTitle,
    required this.imgs,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return imgs == null
        ?
    Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
        AppColors.kLightBlackColor,
          ),
        )
    )
        :
    Stack(
      children: [

        CarouselSlider.builder(
            itemCount: imgs.length,
            itemBuilder: (ctx,index,opt) {
              return CachedNetworkImage(
                imageUrl: imgs[index],
                imageBuilder: (_, p) {
                  return Container(
                    margin: const EdgeInsets.all(kDefaultPadding/2),
                    width: width,
                    height: height / 2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: p,
                            fit: BoxFit.cover,
                        ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  );
                },
                progressIndicatorBuilder: (context, url, progress) {
                  return Container(
                    width: width,
                    height: height / 2,
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey.withOpacity(.4),
                    ),
                    child: Center(
                        child: SpinKitThreeBounce(
                            size: 30,
                            color: AppColors.kLightBlackColor,
                        )),
                  );
                },
              );
            },
            options: CarouselOptions(
              height: 220,
              autoPlay: true,
              viewportFraction: 1,

              enlargeCenterPage: true,
              aspectRatio: 16/9,
            )),
        Align(
            alignment: Alignment.topCenter,
            child: Text(title!.toUpperCase(),
              style:GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                color: AppColors.kLightBlackColor,
              ) ,
            )
        ),
        Align(
            alignment: Alignment.center,
            child: Text(subTitle!.toUpperCase(),
              style:GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                color: AppColors.kLightBlackColor,
              ) ,
            )
        )
      ],
    );
  }
}
