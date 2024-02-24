import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../config/values/values.dart';
import '../../config/widget/container_widget.dart';
import '../../responsive.dart';
import '../home/components/user_details_widget.dart';
import 'components/header.dart';


class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        //padding: EdgeInsets.all(defaultPadding),
        child: Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              HeaderSingle(title: "Analysis"),
              const SizedBox(height: kDefaultPadding),
              //if(!Responsive.isMobile(context))
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  ContainerWithOutBorder(
                    text: "Ajouter ici",
                    color:Colors.white,
                    press: () {
                    },
                  ),
                ],
              ),
              const SizedBox(height: kDefaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(kDefaultPadding),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Analysis page",
                                    style: Theme.of(context).textTheme.subtitle1,
                                  ),
                                ]
                            )
                        ),
                        //RecentDiscussions(),
                        if (Responsive.isMobile(context))
                          const SizedBox(height: kDefaultPadding),
                        if (Responsive.isMobile(context)) const UserDetailsWidget(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    const SizedBox(width: kDefaultPadding),
                  // On Mobile means if the screen is less than 850 we dont want to show it
                  if (!Responsive.isMobile(context))
                    const Expanded(
                      flex: 2,
                      child: UserDetailsWidget(),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
