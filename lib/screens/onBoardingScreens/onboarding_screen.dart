import 'package:flutter/material.dart';
import 'package:monalystics/config/routes/routes.dart';
import '../../config/constants.dart';
import '../../config/style/fonts.dart';
import '../../config/values/values.dart';
import '../../responsive.dart';
import '../login/components/page_right_side.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> with TickerProviderStateMixin {

  final PageController _pageController = PageController(
    initialPage: 0,
  );

  AnimationController? rippleController;

  Animation<double>? rippleAnimation;
  int currentIndex = 0;
  @override
  void initState() {

    rippleController = AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
    rippleAnimation = Tween<double>(begin:45.0 , end:50.0)
        .animate(rippleController!)..addStatusListener((status){
      if(status == AnimationStatus.completed){
        rippleController!.reverse();
      }
      else  if(status == AnimationStatus.dismissed){
        rippleController!.forward();
      }
    });

    rippleController!.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lightBgColor,
      body: Container(
        constraints: const BoxConstraints(maxWidth: kMaxWidth),
        child: SafeArea(
            child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Stack(
                          fit: StackFit.loose,
                          children: [
                            Center(
                              child: SingleChildScrollView(
                                child:  Container(
                                  height:size.height ,
                                  width: size.width,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: const BoxDecoration(
                                    color: AppColors.lightSecondaryColor,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Card(
                                              //elevation: 5,
                                              color: AppColors.lightBgColor,
                                              child: Column(
                                                children: <Widget>[
                                                  const SizedBox(
                                                    height: kDefaultPadding/2,
                                                  ),
                                                  Container(
                                                    height: 40,
                                                    width: 250,
                                                    decoration: const BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(ImagePath.COMPANY_LOGO),
                                                          fit: BoxFit.cover
                                                      ),
                                                    ), // child: Image.asset()
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(vertical:kDefaultPadding/2),
                                                    child: const Text(
                                                      "Unleash the power of combined strategy and technology",
                                                      style: TextStyle(
                                                        fontFamily: Font.poppins,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 24,
                                                        color: AppColors.kLightBlackColor,
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Stack(
                                                        fit: StackFit.loose,
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          _onBoardingScreen(context),
                                                        ]
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if(Responsive.isDesktop(context))
                                        const PageRightSide(
                                          title: "Dear user,\n  explore these onboarding screens. 🤝",
                                          icon:  "assets/images/svg/register.svg",
                                        ),
                                    ],
                                  ),
                                ),
                              ),

                            ),

                          ],
                        ),
                      ],
                    ),
                  )
                ]
            )
        ),
      ),
    );
  }

  Container _onBoardingScreen(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child:  Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            //color: Colors.white,
            /*decoration: BoxDecoration(
                image: DecorationImage(
                    image:AssetImage('assets/background.png'),
                  fit:BoxFit.cover,
                ),
              ),
             ),*/
          ),
          ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: kDefaultPadding/2),
                  Container(
                    alignment: Alignment.center,
                    height: 300,
                    child:PageView(
                      controller: _pageController,
                      children: <Widget>[
                        onBoardingItem(Icons.wifi, "Social Media Analysis", "Stay ahead with live analytics on engagement, reach, and sentiment.Track competitor analysis, customer trends, and industry shifts, all in one place.Get customized dashboards and reports to track what matters most to your business."),
                        onBoardingItem(Icons.manage_search_rounded, "Market research", "Uncover market trends & competitor insights in seconds and make informed decisions. \n"),
                        onBoardingItem(Icons.person_search, "Influencer Marketing", "Effortlessly identify, connect, and manage influencer partnerships for your brand. No matter where your business sets its sights, connect with authentic voices that resonate with your target audience. Collaborate with Instagram influencers with bloggers, YouTubers, , and more."),
                      ],
                      onPageChanged: (value){
                        currentIndex = value;
                        setState(() {
                        });
                      },
                    ),
                  ),
                  const SizedBox(height:kDefaultPadding/2),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:List.generate(3,(index)=> getIndicator(index))
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: (){
                if(currentIndex == 2){

                  Navigator.pushReplacementNamed(context, AppRoutes.chooseAccount);
                }
                else{
                  _pageController.animateToPage(currentIndex+1, duration: const Duration(milliseconds: 100), curve:Curves.linear);
                }
              },
              child: AnimatedBuilder(
                animation: rippleAnimation!,
                builder: (_,child)=>Container(
                  width: rippleAnimation!.value,
                  height: rippleAnimation!.value,
                  margin: const EdgeInsets.only(bottom:5),
                  decoration: BoxDecoration(
                    shape: currentIndex == 2 ? BoxShape.rectangle :BoxShape.circle,
                    // borderRadius: Radius.circular(30),
                    color: AppColors.kThemeYellow,
                  ),
                  child: currentIndex == 2 ?
                   Container(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width:kDefaultPadding/2,),
                        Text(
                          "Get Started".toUpperCase(),
                          style: const TextStyle(
                            fontFamily: Font.poppins,
                            fontWeight: FontWeight.bold,
                            color:AppColors.kLightBlackColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width:kDefaultPadding/2,),
                        const Icon(Icons.keyboard_arrow_right,
                          color: AppColors.kLightBlackColor,
                          size: 30,
                        ),
                        const SizedBox(width:kDefaultPadding/2,),
                      ],
                  ),
                   ) :
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: AppColors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  AnimatedContainer getIndicator(int pageNumerotation){
    return AnimatedContainer(
      duration:const Duration(milliseconds: 300),
      height: kDefaultPadding/2,
      width:(currentIndex == pageNumerotation)?
      kDefaultPadding : kDefaultPadding/2 ,
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding/4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color:(currentIndex == pageNumerotation)?
            AppColors.kThemeYellow:Colors.grey,
      ),
    );
  }

  ListView onBoardingItem(IconData iconData,String title,String description){
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 80,
              width: 80,
              // width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kThemeDarkYellowShadow,
                  // image: DecorationImage(
                  //   image: AssetImage(image),
                  // )
              ),
              child:Icon(
                iconData,
                color: AppColors.kThemeYellow,
                size: 50,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: Font.poppins,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kLightBlackColor,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40.0),
              child: Text(
                description,
                style: TextStyle(
                  fontFamily: Font.poppins,
                  fontWeight: FontWeight.normal,
                  color:AppColors.kLightBlackColor.withOpacity(0.5),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
