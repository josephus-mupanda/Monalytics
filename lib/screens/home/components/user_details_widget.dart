
import 'package:flutter/material.dart';
import '../../../config/constants.dart';
import '../../../config/values/values.dart';
import 'calendart_widget.dart';
import 'charts.dart';
import 'user_details_mini_card.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
        color: AppColors.lightSecondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarWidget(),
          Text(
            "Employment Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: kDefaultPadding),
          // const Chart(),
          UserDetailsMiniCard(
            color: Color(0xff0293ee),
            title: "Technical Interview",
            amountOfFiles: "%28.3",
            numberOfIncrease: 1328,
          ),
          UserDetailsMiniCard(
            color: Color(0xfff8b250),
            title: "HR Interview",
            amountOfFiles: "%16.7",
            numberOfIncrease: 1328,
          ),
          UserDetailsMiniCard(
            color: Color(0xff845bef),
            title: "Final Interview",
            amountOfFiles: "%22.4",
            numberOfIncrease: 1328,
          ),
          UserDetailsMiniCard(
            color: Color(0xff13d38e),
            title: "Rejected",
            amountOfFiles: "%2.3",
            numberOfIncrease: 140,
          ),
        ],
      ),
    );
  }
}
