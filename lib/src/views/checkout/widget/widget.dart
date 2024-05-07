import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../reuseable_widget/custom_text.dart';
import '../../../utils/colors/app_colors.dart';

Tab timeLineForCheckOut(BuildContext context) {
  return Tab(
    height: 51,
    child: Row(
      children: [
        Flexible(
          flex: 2,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: TimelineTile(
              beforeLineStyle: LineStyle(color: AppColors.primaryColor),
              axis: TimelineAxis.horizontal,
              indicatorStyle: IndicatorStyle(
                  height: 30,
                  width: 30,
                  indicator: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: CustomText.customSizedText(
                            text: '1', color: AppColors.white)),
                  )),
              endChild: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: CustomText.customSizedText(
                    text: 'Menu', fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 4,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: TimelineTile(
              beforeLineStyle: LineStyle(color: AppColors.primaryColor),
              axis: TimelineAxis.horizontal,
              indicatorStyle: IndicatorStyle(
                  height: 30,
                  width: 30,
                  indicator: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: CustomText.customSizedText(
                            text: '2', color: AppColors.white)),
                  )),
              endChild: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: CustomText.customSizedText(
                    text: 'Cart', fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: TimelineTile(
              afterLineStyle: LineStyle(color: AppColors.lightGreyColor),
              beforeLineStyle: LineStyle(color: AppColors.primaryColor),
              axis: TimelineAxis.horizontal,
              indicatorStyle: IndicatorStyle(
                  height: 30,
                  width: 30,
                  indicator: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.primaryColor, width: 4),
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: CustomText.customSizedText(
                            text: '3', color: AppColors.white)),
                  )),
              endChild: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: CustomText.customSizedText(
                    text: 'Checkout', fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
