
import 'package:flutter/cupertino.dart';
import '../../config/constants.dart';
import '../../responsive.dart';
import 'components/header.dart';
import 'components/mini_information_card.dart';
import 'components/recent_forums.dart';
import 'components/recent_users.dart';
import 'components/user_details_widget.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        //padding: EdgeInsets.all(defaultPadding),
        child: Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: kDefaultPadding),
              const MiniInformation(),
              const SizedBox(height: kDefaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        //MyFiels(),
                        //SizedBox(height: defaultPadding),
                        const RecentUsers(),
                        const SizedBox(height: kDefaultPadding),
                        const RecentDiscussions(),
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