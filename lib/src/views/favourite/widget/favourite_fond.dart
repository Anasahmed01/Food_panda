import 'package:flutter/material.dart';

import '../../../del_custom_model/order_del_model.dart';
import '../../../reuseable_widget/custom_text.dart';
import '../../../utils/colors/app_colors.dart';
import '../../category/widget/card.dart';

Widget favoriteFound() {
  return ListView.builder(
    itemCount: favourite.length,
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGreyColor),
            borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.asset(
                  favourite[index][1],
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              Positioned(
                left: 10,
                top: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    discountContainerForCat(text: favourite[index][4]),
                    discountContainerForCat(text: favourite[index][3]),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                top: 8,
                child: GestureDetector(
                  onTap: () {
                    // favourite.add(favouriteData);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.all(5),
                    child: const Icon(
                      size: 16,
                      Icons.favorite_outline_rounded,
                    ),
                  ),
                ),
              ),
            ]),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              //    width: MediaQuery.sizeOf(context).width * 0.65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: CustomText.customSizedText(
                          text: favourite[index][0],
                          fontWeight: FontWeight.w800,
                          size: 14,
                          minFontSize: 14,
                          maxFontSize: 14,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: Colors.orangeAccent,
                              size: 18,
                            ),
                            CustomText.customSizedText(
                              text: ' ${favourite[index][5]}',
                              fontWeight: FontWeight.w800,
                              size: 12,
                              maxFontSize: 12,
                            ),
                            CustomText.customSizedText(
                              text: ' (5000+)',
                              fontWeight: FontWeight.w800,
                              color: AppColors.greyColor,
                              size: 12,
                              maxFontSize: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: CustomText.customSizedText(
                      text: "\$\$\$  -  ${favourite[index][6]}",
                      color: AppColors.greyColor,
                      size: 12,
                      maxFontSize: 12,
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            color: Colors.grey[700],
                            size: 14,
                          ),
                          CustomText.customSizedText(
                            text: ' ${favourite[index][2]}  -  ',
                            fontWeight: FontWeight.w800,
                            color: AppColors.greyColor,
                            size: 12,
                            maxFontSize: 12,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.delivery_dining_sharp,
                            color: AppColors.primaryColor,
                            size: 18,
                          ),
                          CustomText.customSizedText(
                            color: AppColors.primaryColor,
                            text: ' Gift: Free',
                            fontWeight: FontWeight.w900,
                            size: 12,
                            maxFontSize: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
