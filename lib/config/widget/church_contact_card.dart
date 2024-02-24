
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../values/values.dart';
import 'empty.dart';
import 'spaces.dart';

class ContactChurchCardData {
  IconData leadingIcon;
  IconData trailingIcon;
  Color trailingIconColor;
  Color leadingIconColor;
  Color circleBgColor;
  String title;
  String subtitle;


  ContactChurchCardData({
    required this.leadingIcon,
    required this.trailingIcon,
    this.circleBgColor = AppColors.black,
    this.leadingIconColor = AppColors.white,
    this.trailingIconColor = AppColors.grey300,
    required this.title,
    required this.subtitle,
  });
}

class ContactChurchCard extends StatefulWidget {
  const ContactChurchCard({
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.columnMainAxisAlignment = MainAxisAlignment.start,
    this.columnCrossAxisAlignment = CrossAxisAlignment.start,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.rowCrossAxisAlignment = CrossAxisAlignment.center,
    this.width,
    this.height,
    this.offsetY = -40,
    this.elevation = Sizes.ELEVATION_4,
    this.hasAnimation = true,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.padding = const EdgeInsets.symmetric(
      horizontal: Sizes.PADDING_0,
      vertical: Sizes.PADDING_12,
    ),
    Key? key,
  }) : super(key: key);

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final double? width;
  final double? height;
  final double? elevation;
  final double offsetY;
  final MainAxisAlignment columnMainAxisAlignment;
  final CrossAxisAlignment columnCrossAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final MainAxisAlignment rowMainAxisAlignment;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final bool hasAnimation;


  @override
  _ContactChurchCardState createState() => _ContactChurchCardState();
}

class _ContactChurchCardState extends State<ContactChurchCard>
    with SingleTickerProviderStateMixin {
  bool _hovering = false;
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween(begin: 0.0, end: widget.offsetY).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuart),
    );
  }

  Future<void> _animateCard() async {
    if (_hovering) {
      try {
        await _controller.forward().orCancel;
      } on TickerCanceled {}
    } else {
      try {
        await _controller.reverse().orCancel;
      } on TickerCanceled {}
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.hasAnimation
        ? MouseRegion(
            onEnter: (e) => _mouseEnter(true),
            onExit: (e) => _mouseEnter(false),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, animation.value),
                  child: _buildCard(context),
                );
              },
            ),
          )
        : _buildCard(context);
  }

  Widget _buildCard(BuildContext context ) {

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: AppColors.lightSecondaryColor,
        borderRadius: BorderRadius.circular(kDefaultPadding/2),
        border: Border.all(color:Colors.black12
        ),
      ),
      child: ClipRRect(
        //borderRadius: widget.borderRadius,
        child: Card(
          //elevation: widget.elevation,
          color: AppColors.lightSecondaryColor,

          child: Padding(
            padding: widget.padding,
            child: Row(
              mainAxisAlignment: widget.rowMainAxisAlignment,
              crossAxisAlignment: widget.rowCrossAxisAlignment,
              children: [
                widget.leading != null ? const Spacer() : Empty(),
                widget.leading ?? Empty(),
                widget.leading != null ? const Spacer() : Empty(),
                Column(
                  mainAxisAlignment: widget.columnMainAxisAlignment,
                  crossAxisAlignment: widget.columnCrossAxisAlignment,
                  children: [
                    const Spacer(),
                    widget.title ?? Empty(),
                    widget.title != null ? SpaceH8() : Empty(),
                    widget.subtitle ?? Empty(),
                    const Spacer(),
                  ],
                ),
                widget.trailing != null ? const Spacer() : Empty(),
                widget.trailing ?? Empty(),
                widget.trailing != null ? const Spacer() : Empty(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
    _animateCard();
  }
}
