import 'package:flutter/material.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/views/cart/cart_viewmodel.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../reuseable_widget/custom_text.dart';

Widget expansionTile(
    {required CartViewModel viewModel,
    required String requideItems,
    required String optionalItem,
    required BuildContext context}) {
  return Theme(
    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
    child: ExpansionTile(
      
      iconColor: AppColors.blackColor,
      tilePadding: EdgeInsets.zero,
      expandedAlignment: Alignment.topLeft,
      //enabled: true,
      title: CustomText.customSizedText(
        text: requideItems,
        maxLine: 2,
        size: 12,
      ),
      children: [
        CustomText.customSizedText(text: optionalItem),
      ],
      onExpansionChanged: (bool expanded) {
        viewModel.rebuildUi();
        viewModel.customIcon = expanded;
        viewModel.rebuildUi();
      },
    ),
  );
}

Tab timeLineForCart(BuildContext context) {
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
              beforeLineStyle: LineStyle(color: AppColors.lightGreyColor),
              axis: TimelineAxis.horizontal,
              indicatorStyle: IndicatorStyle(
                  height: 30,
                  width: 30,
                  indicator: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.lightGreyColor, width: 4),
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: CustomText.customSizedText(
                            text: '3', color: AppColors.blackColor)),
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
