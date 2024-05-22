import 'package:flutter/material.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/panda_pro/widget/bottom_sheet.dart';
import '../../../../../reuseable_widget/custom_text.dart';
import '../../../../../utils/colors/app_colors.dart';

Widget pandaProListTile(
    {required String title, required String subtitle, required leading}) {
  return ListTile(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: AppColors.lightGreyColor),
      borderRadius: BorderRadius.circular(12),
    ),
    leading: leading,
    title: CustomText.customSizedText(
      text: title,
      fontWeight: FontWeight.w800,
      textAlign: TextAlign.start,
      maxLine: 2,
      size: 14,
    ),
    subtitle: Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: CustomText.customSizedText(
        text: subtitle,
        textAlign: TextAlign.start,
        maxLine: 2,
        size: 12,
      ),
    ),
  );
}

Widget pandaProExpTile({required String title, required String subTitle}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
        color: AppColors.white, borderRadius: BorderRadius.circular(15)),
    child: ExpansionTile(
      iconColor: AppColors.primaryColor,
      collapsedIconColor: AppColors.primaryColor,
      childrenPadding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      shape: Border.all(color: Colors.transparent),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
      children: [
        Text(
          subTitle,
        ),
      ],
    ),
  );
}

Future pandaProbottomSheetX(
  BuildContext context,
) {
  return showModalBottomSheet(
    backgroundColor: AppColors.white,
    context: context,
    builder: (context) {
      return const PandaProBottomSheet();
    },
  );
}

Widget topText({required BuildContext context, required Color color}) {
  return Container(
    height: 30,
    width: MediaQuery.sizeOf(context).width,
    decoration: BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: CustomText.customSizedText(
        text: 'SAVE 34%',
        color: AppColors.white,
        size: 13,
        minFontSize: 12,
        maxFontSize: 15,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Container pandaproDisContainer({required String text}) {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      color: AppColors.primaryColor.withOpacity(0.1),
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    child: CustomText.customSizedText(
      size: 12,
      text: text,
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w900,
    ),
  );
}

Widget cardContainer({required Color color, required image}) => Container(
      margin: const EdgeInsets.only(right: 10, top: 5),
      padding: const EdgeInsets.all(2),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
      child: Image.asset(
        image,
        height: 10,
        width: 15,
      ),
    );
