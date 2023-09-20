
import 'package:flutter/material.dart';
import 'package:hulu/src/ui/register/register_screen.dart';
import 'package:hulu/src/widgets/onboard/first_onboard_widget.dart';
import 'package:hulu/src/widgets/onboard/fourth_onboard_widget.dart';
import 'package:hulu/src/widgets/onboard/last_onboard_widget.dart';
import 'package:hulu/src/widgets/onboard/second_onboard_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/utils.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 50 * h),
        child: PageView(
          controller: controller,
          children: [
            FirstOnBoardWidget(),
            SecondOnboardWidget(),
            FourthOnBoardWidget(),
            LastPage(color: Theme.of(context).primaryColor),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 10 * w),
        height: 62 * h,
        color: Colors.black,
        child: Row(
          children: [
            SmoothPageIndicator(
              controller: controller,
              count: 4,
              onDotClicked: (index) => controller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.easeIn),
              effect: WormEffect(
                spacing: 10,
                dotColor: Colors.grey,
                activeDotColor: Colors.white,
                dotWidth: 10,
                strokeWidth: 30,
                dotHeight: 10,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
             return controller.jumpToPage(3);
                },
              child: Container(
                width: 62  *w,
                height: 62 * h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(62),
                  color: Color(0xff1CE783),
                ),
                child: Center(child: Icon(Icons.arrow_right_alt,size: 24 * h,color: Colors.white,)),
              ),
            )
          ],
        )
      ),
    );
  }
}
