import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../config/constants.dart';
import '../../../../config/values/values.dart';
import '../../../../responsive.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu))
          ),
          /*IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),*/
        if (!Responsive.isMobile(context))
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, Josephus 👋",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Bienvenu(e) sur votre dashboard",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        const Expanded(child: SearchField()),
        const ProfileCard()
      ],
    );
  }
}


class ProfileCard extends StatefulWidget {


  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: kDefaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightSecondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(ImagePath.COMPANY_LOGO),
          ),
          if (!Responsive.isMobile(context))
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              child: Text("Josephus M."),
            ),
          DropdownButton(
            icon: const Icon(Icons.keyboard_arrow_down, size: 18),
            underline: const SizedBox(),
            style: Theme.of(context).textTheme.button,
            value: _value,
            items: const [
              DropdownMenuItem(
                value: 1,
                child: Text(""),
              ),
            ],
            onChanged: (int? value) {
              setState(() {

                //_value = value!;
              });
            },
          ),
          //Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Chercher un utilisateur",
        fillColor: AppColors.lightSecondaryColor,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(kDefaultPadding * 0.75),
            margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            decoration: const BoxDecoration(
              color: AppColors.kGreenColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset(
              "assets/icons/Search.svg",
            ),
          ),
        ),
      ),
    );
  }
}
