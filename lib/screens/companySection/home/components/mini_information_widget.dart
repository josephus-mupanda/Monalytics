
//import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../config/constants.dart';
import '../../../../config/values/values.dart';
import '../../../../models/daily_info_model.dart';

class MiniInformationWidget extends StatefulWidget {
  const MiniInformationWidget({
    Key? key,
    required this.dailyData,
  }) : super(key: key);
  final DailyInfoModel dailyData;

  @override
  _MiniInformationWidgetState createState() => _MiniInformationWidgetState();
}

int _value = 1;

class _MiniInformationWidgetState extends State<MiniInformationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
        color: AppColors.lightSecondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: widget.dailyData.color!.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Icon(
                    widget.dailyData.icon,
                    color: widget.dailyData.color,
                    size: 18,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Text("Daily",)
                /*DropdownButton(
                  icon: Icon(Icons.more_vert, size: 18),
                  underline: SizedBox(),
                  style: Theme.of(context).textTheme.button,
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("Daily"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Weekly"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("Monthly"),
                      value: 3,
                    ),
                  ],
                  onChanged: (int? value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                ),*/
              ),
            ],
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.dailyData.title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline6,
              ),
              /*SizedBox(
                height: 8,
              ),
              Container(
                child: LineChartWidget(
                  colors: widget.dailyData.colors,
                  spotsData: widget.dailyData.spots,
                )
              )*/
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          ProgressLine(
            color: widget.dailyData.color!,
            percentage: widget.dailyData.percentage!,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*Text(
                "${widget.dailyData.volumeData}",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white70),
              ),*/
              Text(
                widget.dailyData.totalStorage!,
                style: Theme.of(context)
                    .textTheme
                    .caption!
              ),
            ],
          )
        ],
      ),
    );
  }
}

/*class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    Key? key,
    required this.colors,
    required this.spotsData,
  }) : super(key: key);
  final List<Color>? colors;
  final List<FlSpot>? spotsData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 80,
          height: 30,
          child: LineChart(
            LineChartData(
                lineBarsData: [
                  LineChartBarData(
                      spots: spotsData,
                      belowBarData: BarAreaData(show: false),
                      aboveBarData: BarAreaData(show: false),
                      isCurved: true,
                      dotData: FlDotData(show: false),
                      colors: colors,
                      barWidth: 3),
                ],
                lineTouchData: LineTouchData(enabled: false),
                titlesData: FlTitlesData(show: false),
                axisTitleData: FlAxisTitleData(show: false),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false)),
          ),
        ),
      ],
    );
  }
}*/

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = AppColors.primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color color;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
