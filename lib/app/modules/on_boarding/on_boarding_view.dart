import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'on_boarding_logic.dart';
import 'widgets/custom_on_boarding_widget.dart';
import 'widgets/UI/pages.dart';


class OnBoardingPage extends GetView<OnBoardingLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            color: Get.theme.backgroundColor,
            child: CustomOnBoardingWidget(
              pages: <PageViewModel>[
                PageViewModel(
                  Get.theme.backgroundColor,
                  Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Center(
                            child: Image(
                          image: AssetImage('./assets/img/illu-1.png'),
                          width: 300,
                          height: 320,
                        )),
                        SizedBox(height: 30),
                        Text('Find lots of product\naround the world',
                            style: Get.textTheme.bodyText1
                                .copyWith(fontWeight: FontWeight.w700)),
                        SizedBox(height: 16),
                        Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                            style: Get.textTheme.bodyText2
                                .copyWith(fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
                PageViewModel(
                  Get.theme.backgroundColor,
                  Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Center(
                            child: Image(
                          image: AssetImage('./assets/img/illu-2.png'),
                          width: 300,
                          height: 320,
                        )),
                        SizedBox(height: 30),
                        Text('Secure payment\nwith SSL ',
                            style: Get.textTheme.bodyText1
                                .copyWith(fontWeight: FontWeight.w700)),
                        SizedBox(height: 16),
                        Text(
                            'Lorem ipsum dolor sit amet, consect adipiing elit, sed do eiusmod tempor incididunt ut labore et.',
                            style: Get.textTheme.bodyText2
                                .copyWith(fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                ),
                PageViewModel(
                  Get.theme.backgroundColor,
                  Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                            child: Image(
                          image: AssetImage('./assets/img/illu-3.png'),
                          width: 300,
                          height: 320,
                        )),
                        SizedBox(height: 30),
                        Text('Fast delivery\nat a snap',
                            style: Get.textTheme.bodyText1
                                .copyWith(fontWeight: FontWeight.w700)),
                        SizedBox(height: 16),
                        Text(
                            'Lorem ipsum dolor sit amet, consect adicing elit, sed do eiusmod tempor incididunt ut labore et.',
                            style: Get.textTheme.bodyText2
                                .copyWith(fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
              ],
              unSelectedIndicatorColor: Get.theme.colorScheme.secondary,
              selectedIndicatorColor: Get.theme.colorScheme.primary,
              doneWidget: Material(
                borderRadius: BorderRadius.circular(40),
                child: InkWell(
                  splashColor: Get.theme.colorScheme.secondary,
                  onTap: controller.completeOnBoarding,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Text("DONE".toUpperCase(),
                        style: Get.textTheme.subtitle2.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Get.theme.colorScheme.primary)),
                  ),
                ),
              ),
              skipWidget: Material(
                borderRadius: BorderRadius.circular(40),
                child: InkWell(
                  splashColor: Get.theme.colorScheme.secondary,
                  onTap: controller.completeOnBoarding,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Text("Skip".toUpperCase(),
                        style: Get.theme.textTheme.subtitle2.merge(TextStyle(
                            color: Get.theme.colorScheme.secondary,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.6))),
                  ),
                ),
              ),
            )));
  }
}
