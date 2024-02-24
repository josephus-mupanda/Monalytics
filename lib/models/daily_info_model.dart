

// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import '../config/values/values.dart';

class DailyInfoModel {
  IconData? icon;
  String? title;
  String? totalStorage;
  //int? volumeData;
  int? percentage;
  Color? color;
  //List<Color>? colors;
  //List<FlSpot>? spots;

  DailyInfoModel({
    this.icon,
    this.title,
    this.totalStorage,
    //this.volumeData,
    this.percentage,
    this.color,
    //this.colors,
    //this.spots,
  });

  DailyInfoModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    //volumeData = json['volumeData'];
    icon = json['icon'];
    totalStorage = json['totalStorage'];
    color = json['color'];
    percentage = json['percentage'];
    //colors = json['colors'];
    //spots = json['spots'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    //data['volumeData'] = this.volumeData;
    data['icon'] = this.icon;
    data['totalStorage'] = this.totalStorage;
    data['color'] = this.color;
    data['percentage'] = this.percentage;
    //data['colors'] = this.colors;
    //data['spots'] = this.spots;
    return data;
  }
}

List<DailyInfoModel> dailyDatas =
    dailyData.map((item) => DailyInfoModel.fromJson(item)).toList();

//List<FlSpot> spots = yValues.asMap().entries.map((e) {
//  return FlSpot(e.key.toDouble(), e.value);
//}).toList();

var dailyData = [
  {
    "title": "Utilisateurs",
    //"volumeData": 1328,
    "icon": Icons.supervised_user_circle,
    "totalStorage": "3000",
    "color": AppColors.primaryColor,
    "percentage": 50,
    /*"colors": [
      Color(0xff23b6e6),
      Color(0xff02d39a),
    ],
    "spots": [
      FlSpot(
        1,
        2,
      ),
      FlSpot(
        2,
        1.0,
      ),
      FlSpot(
        3,
        1.8,
      ),
      FlSpot(
        4,
        1.5,
      ),
      FlSpot(
        5,
        1.0,
      ),
      FlSpot(
        6,
        2.2,
      ),
      FlSpot(
        7,
        1.8,
      ),
      FlSpot(
        8,
        1.5,
      )
    ]*/
  },
  {
    "title": "Evenements",
    //"volumeData": 1328,
    "icon":   Icons.event,
    "totalStorage": "1500",
    "color": Color(0xFFFFA113),
    "percentage": 50,
    /*"colors": [Color(0xfff12711), Color(0xfff5af19)],
    "spots": [
      FlSpot(
        1,
        1.3,
      ), FlSpot(
        2,
        1.0,
      ), FlSpot(
        3,
        4,
      ), FlSpot(
        4,
        1.5,
      ),
      FlSpot(
        5,
        1.0,
      ), FlSpot(
        6,
        3,
      ), FlSpot(
        7,
        1.8,
      ), FlSpot(
        8,
        1.5,
      )
    ]*/
  },
  {
    "title": "Publications",
    //"volumeData": 1328,
    "icon": Icons.post_add,
    "totalStorage": "1200",
    "color": const Color(0xFFA4CDFF),
    "percentage": 50,
    /*"colors": [Color(0xff2980B9), Color(0xff6DD5FA)],
    "spots": [
      FlSpot(
        1,
        1.3,
      ),
      FlSpot(
        2,
        5,
      ),
      FlSpot(
        3,
        1.8,
      ),
      FlSpot(
        4,
        6,
      ),
      FlSpot(
        5,
        1.0,
      ),
      FlSpot(
        6,
        2.2,
      ),
      FlSpot(
        7,
        1.8,
      ),
      FlSpot(
        8,
        1,
      )
    ]*/
  },
  {
    "title": "Sermons",
    //"volumeData": 1328,
    "icon": Icons.ad_units_outlined,
    "totalStorage": "2800",
    "color": Color(0xFFd50000),
    "percentage": 50,
    /*"colors": [Color(0xff93291E), Color(0xffED213A)],
    "spots": [
      FlSpot(
        1,
        3,
      ),
      FlSpot(
        2,
        4,
      ),
      FlSpot(
        3,
        1.8,
      ),
      FlSpot(
        4,
        1.5,
      ),
      FlSpot(
        5,
        1.0,
      ),
      FlSpot(
        6,
        2.2,
      ),
      FlSpot(
        7,
        1.8,
      ),
      FlSpot(
        8,
        1.5,
      )
    ]*/
  },
  /*{
    "title": "Efficiency",
    "volumeData": 5328,
    "icon": FlutterIcons.bell_faw5s,
    "totalStorage": "- %5",
    "color": Color(0xFF00F260),
    "percentage": 78,
    "colors": [Color(0xff0575E6), Color(0xff00F260)],
    "spots": [
      FlSpot(
        1,
        1.3,
      ),
      FlSpot(
        2,
        1.0,
      ),
      FlSpot(
        3,
        1.8,
      ),
      FlSpot(
        4,
        1.5,
      ),
      FlSpot(
        5,
        1.0,
      ),
      FlSpot(
        6,
        2.2,
      ),
      FlSpot(
        7,
        1.8,
      ),
      FlSpot(
        8,
        1.5,
      )
    ]
  }*/
];

//final List<double> yValues = [
//  2.3,
//  1.8,
//  1.9,
//  1.5,
//  1.0,
//  2.2,
//  1.8,
//  1.5,
//];
