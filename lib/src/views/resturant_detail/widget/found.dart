import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:foodpanda/src/models/order_detail.dart';
import 'package:foodpanda/src/reuseable_widget/custom_text.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/views/resturant_detail/resturant_detail_viewmodel.dart';
import 'package:foodpanda/src/views/resturant_detail/widget/product_container.dart';

Widget productFound(
    {required ResturantDetailViewModel viewModel,
    required String resturantName,
    required String resturantImage,
    required String deliveryType,
    required String deliveryPrice,
    required String discountText,
    required String deliveryTime,
    required String resturantRating,
    required OrderDetailModel model}) {
  return DefaultTabController(
    length: 5,
    child: ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(resturantImage),
                      ),
                    ),
                  ),
                  Flexible(
                    child: CustomText.customSizedText(
                      text: resturantName,
                      fontWeight: FontWeight.w800,
                      maxLine: 2,
                      size: 18,
                      minFontSize: 18,
                      maxFontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomText.customSizedText(
                          text: '1.3km away | ',
                          fontWeight: FontWeight.w500,
                          size: 12,
                          color: AppColors.greyColor),
                      CustomText.customSizedText(
                        text: deliveryType,
                        fontWeight: FontWeight.w500,
                        size: 12,
                      ),
                    ],
                  ),
                  CustomText.customSizedText(
                    text: 'More info',
                    fontWeight: FontWeight.w800,
                    size: 12,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              CustomText.customSizedText(
                  text: 'Rs. $deliveryPrice | Service fee applies',
                  fontWeight: FontWeight.w500,
                  size: 12,
                  color: AppColors.greyColor),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star_border,
                        size: 22,
                        color: AppColors.primaryColor,
                      ),
                      CustomText.customSizedText(
                          text: '   $resturantRating   ',
                          fontWeight: FontWeight.w800,
                          size: 13,
                          color: AppColors.blackColor),
                      CustomText.customSizedText(
                          text: '10000+ ratings',
                          fontWeight: FontWeight.w500,
                          size: 11,
                          color: AppColors.greyColor),
                    ],
                  ),
                  CustomText.customSizedText(
                      text: 'See reviews',
                      fontWeight: FontWeight.w800,
                      size: 12,
                      color: AppColors.primaryColor),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        size: 22,
                        color: AppColors.primaryColor,
                      ),
                      CustomText.customSizedText(
                          text: '   Delivery: $deliveryTime',
                          fontWeight: FontWeight.w800,
                          size: 13,
                          color: AppColors.blackColor),
                    ],
                  ),
                  CustomText.customSizedText(
                      text: 'Change',
                      fontWeight: FontWeight.w800,
                      size: 12,
                      color: Colors.grey[300]),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.tickets,
                    size: 22,
                    color: AppColors.primaryColor,
                  ),
                  CustomText.customSizedText(
                      text: '   Available deals',
                      fontWeight: FontWeight.w800,
                      size: 13,
                      color: AppColors.greyColor),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 253, 240, 245),
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.all(3),
                          child: Icon(
                            Icons.percent_rounded,
                            color: AppColors.white,
                            size: 8,
                          ),
                        ),
                        CustomText.customSizedText(
                            text: discountText,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700,
                            size: 12,
                            maxFontSize: 12,
                            minFontSize: 12),
                      ],
                    ),
                    CustomText.customSizedText(
                        text:
                            'Min. order Rs. 199. Valid for selected items.\nAuto-applied.',
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w500,
                        size: 10,
                        maxLine: 2,
                        maxFontSize: 10,
                        minFontSize: 10),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: TabBar(
              splashFactory: NoSplash.splashFactory,
              // labelPadding: const EdgeInsets.only(left: 10),
              tabAlignment: TabAlignment.start,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.black,
              indicator: UnderlineTabIndicator(
                insets: const EdgeInsets.symmetric(horizontal: 10.0),
                borderSide:
                    BorderSide(color: AppColors.primaryColor, width: 2.0),
              ),
              padding: const EdgeInsets.only(left: 5),
              labelColor: AppColors.primaryColor,
              isScrollable: true,
              tabs: const [
                Tab(
                  text: 'Popular',
                ),
                Tab(
                  text: 'Rice',
                ),
                Tab(
                  text: 'Sides',
                ),
                Tab(
                  text: 'Desserts',
                ),
                Tab(
                  text: 'Beverages',
                ),
              ]),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.local_fire_department_sharp,
                    color: Colors.orange,
                  ),
                  CustomText.customSizedText(
                      text: '  Popular',
                      fontWeight: FontWeight.w800,
                      size: 24,
                      color: AppColors.blackColor),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              CustomText.customSizedText(
                  text: ' Most ordered right now.',
                  fontWeight: FontWeight.w400,
                  size: 14,
                  color: AppColors.blackColor),
              const SizedBox(
                height: 30,
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2.5,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemCount: model.data.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        viewModel.navigateToOrderDetailView(
                          deliveryPrice: deliveryPrice,
                          deliveryType: deliveryType,
                          discountText: discountText,
                          resturantImage: resturantImage,
                          resturantRating: resturantRating,
                          productId: model.data[index].productId,
                          deliveryTime: deliveryTime,
                          resturantName: resturantName,
                          productDiscription: model.data[index].discription,
                          productImg: model.data[index].productImage,
                          productName: model.data[index].productName,
                          productPrice: model.data[index].productPrice,
                          index: index,
                        );
                      },
                      child: productDetailCon(
                          image: model.data[index].productImage,
                          productName: model.data[index].productName,
                          productPrice: model.data[index].productPrice),
                    );
                  }),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          color: AppColors.lightGreyColor,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText.customSizedText(
                        text: 'Fellow foodies say',
                        fontWeight: FontWeight.w800,
                        size: 18,
                        color: AppColors.blackColor),
                    CustomText.customSizedText(
                        text: 'See all',
                        fontWeight: FontWeight.w800,
                        size: 14,
                        color: AppColors.primaryColor),
                  ],
                ),
              ),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ratingContainer();
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 15),
          child: CustomText.customSizedText(
              text: 'Meal Box',
              maxLine: 1,
              maxFontSize: 24,
              fontWeight: FontWeight.w900,
              color: AppColors.blackColor,
              textAlign: TextAlign.left,
              minFontSize: 24),
        ),
        ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: model.data.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 100),
              child: FadeInAnimation(
                duration: const Duration(milliseconds: 500),
                child: GestureDetector(
                  onTap: () {
                    viewModel.navigateToOrderDetailView(
                        deliveryPrice: deliveryPrice,
                        deliveryType: deliveryType,
                        discountText: discountText,
                        resturantImage: resturantImage,
                        resturantRating: resturantRating,
                        productId: model.data[index].productId,
                        deliveryTime: deliveryTime,
                        resturantName: resturantName,
                        index: index,
                        productDiscription: model.data[index].discription,
                        productImg: model.data[index].productImage,
                        productName: model.data[index].productName,
                        productPrice: model.data[index].productPrice);
                  },
                  child: Container(
                    color: AppColors.white,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText.customSizedText(
                                  text: model.data[index].productName,
                                  maxLine: 1,
                                  maxFontSize: 16,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w800,
                                  textAlign: TextAlign.left,
                                  minFontSize: 16),
                              const SizedBox(
                                height: 2,
                              ),
                              CustomText.customSizedText(
                                  text: model.data[index].discription,
                                  maxLine: 2,
                                  maxFontSize: 12,
                                  color: AppColors.greyColor,
                                  textAlign: TextAlign.left,
                                  minFontSize: 12),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomText.customSizedText(
                                  text:
                                      'from Rs. ${model.data[index].productPrice}',
                                  maxLine: 1,
                                  maxFontSize: 14,
                                  color: AppColors.blackColor,
                                  textAlign: TextAlign.left,
                                  minFontSize: 14),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: SizedBox(
                            height: 100,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    model.data[index].productImage,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      viewModel.navigateToOrderDetailView(
                                          deliveryPrice: deliveryPrice,
                                          deliveryType: deliveryType,
                                          discountText: discountText,
                                          resturantImage: resturantImage,
                                          resturantRating: resturantRating,
                                          productId:
                                              model.data[index].productId,
                                          deliveryTime: deliveryTime,
                                          resturantName: resturantName,
                                          index: index,
                                          productDiscription:
                                              model.data[index].discription,
                                          productImg:
                                              model.data[index].productImage,
                                          productName:
                                              model.data[index].productName,
                                          productPrice:
                                              model.data[index].productPrice);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      padding: const EdgeInsets.all(3),
                                      child: Icon(
                                        Icons.add,
                                        color: AppColors.white,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 100),
              child: FadeInAnimation(
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 5),
                  child: Divider(
                    color: Colors.grey[300],
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(
          height: 30,
        ),
        Divider(
          height: 10,
          thickness: 8,
          color: Colors.grey[300],
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.customSizedText(
                  text: resturantName,
                  maxLine: 1,
                  maxFontSize: 20,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w800,
                  textAlign: TextAlign.left,
                  minFontSize: 20),
              const SizedBox(
                height: 20,
              ),
              CustomText.customSizedText(
                  text: dummyText,
                  maxLine: 10,
                  maxFontSize: 12,
                  color: AppColors.primaryColor,
                  textAlign: TextAlign.left,
                  minFontSize: 12),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    ),
  );
}
