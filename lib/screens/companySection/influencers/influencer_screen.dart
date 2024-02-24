import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../../config/constants.dart';
import '../../../config/values/values.dart';
import '../../../config/widget/container_widget.dart';
import '../../../controllers/enums.dart';
import '../../../responsive.dart';
import '../analysis/components/header.dart';
import '../dashboard/components/hidden_side_menu.dart';
import '../home/components/user_details_widget.dart';

class InfluencerScreen extends StatefulWidget {
  const InfluencerScreen({super.key});

  @override
  State<InfluencerScreen> createState() => _InfluencerScreenState();
}

class _InfluencerScreenState extends State<InfluencerScreen> {

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
              const HeaderSingle(title: "Influencers"),
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
                                    "influencer page",
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
