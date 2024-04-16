import 'package:flutter/material.dart';
import 'package:foodpanda/src/models/category_data.dart';
import '../../../reuseable_widget/text/custom_text.dart';
import '../../../utils/colors/app_colors.dart';
import '../home_viewmodel.dart';
import 'card.dart';

ListView homeFound(
    BuildContext context, HomeViewModel viewModel, CategoryData model) {
  return ListView(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        height: MediaQuery.sizeOf(context).height * 0.6,
        color: AppColors.lightGreyColor,
        child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2.5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: model.data.length,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: () {
                  viewModel.navigateToCatView(model.data[index].title);
                },
                child: categoryCard(
                    height: MediaQuery.sizeOf(context).height * 0.2,
                    width: MediaQuery.sizeOf(context).width * 0.43,
                    title: viewModel.getData == null
                        ? ''
                        : model.data[index].title,
                    subTitle: viewModel.getData == null
                        ? ''
                        : model.data[index].subtitle,
                    context: context,
                    image: viewModel.categoryImages[index]),
              );
            }),
      ),
      Container(
        color: AppColors.white,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              child: CustomText.customSizedText(
                text: 'Your daily deals',
                fontWeight: FontWeight.w800,
                size: 18,
                maxFontSize: 18,
              ),
            ),
            SizedBox(
              height: 170,
              child: ListView.builder(
                itemCount: viewModel.dealImages.length,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        viewModel.dealImages[index],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      const SizedBox(
        height: 25,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
        child: CustomText.customSizedText(
          text: 'Cuisines',
          fontWeight: FontWeight.w800,
          size: 18,
          maxFontSize: 18,
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            SizedBox(
              height: 120,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: viewModel.cuisinesImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            viewModel.cuisinesImages[index],
                            fit: BoxFit.cover,
                            height: 90,
                            width: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: CustomText.customSizedText(
                            text: '${viewModel.cuisinesData[index]}',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: viewModel.cuisinesImages.length,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            viewModel.cuisinesImages[index],
                            fit: BoxFit.cover,
                            height: 90,
                            width: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: CustomText.customSizedText(
                            text: '${viewModel.cuisinesData[index]}',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
        child: CustomText.customSizedText(
          text: 'Popular restaurants',
          fontWeight: FontWeight.w800,
          size: 18,
          maxFontSize: 18,
        ),
      ),
      SizedBox(
        height: 225,
        child: ListView.builder(
          itemCount: viewModel.popularResImg.length,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return popularRestaurants(viewModel, index, context);
          },
        ),
      ),
      // const SizedBox(
      //   height: 20,
      // ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
        child: CustomText.customSizedText(
          text: 'pandamart',
          fontWeight: FontWeight.w800,
          size: 18,
          maxFontSize: 18,
        ),
      ),
      SizedBox(
        height: 140,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          itemCount: viewModel.pandaMartImg.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                      color: AppColors.lightLightGreyColor,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      viewModel.pandaMartImg[index],
                      fit: BoxFit.cover,
                      height: 90,
                      width: 80,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: SizedBox(
                    width: 90,
                    child: CustomText.customSizedText(
                        text: viewModel.pandaMartText[index],
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                        maxLine: 2,
                        maxFontSize: 16),
                  ),
                ),
              ],
            );
          },
          scrollDirection: Axis.horizontal,
        ),
      ),
      const SizedBox(
        height: 40,
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 17),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyColor),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            CustomText.customSizedText(
              text: 'Try panda rewards!',
              fontWeight: FontWeight.w800,
              size: 18,
              maxFontSize: 18,
            ),
            CustomText.customSizedText(
              text: 'Earn points and win prizes',
              fontWeight: FontWeight.w800,
              size: 14,
              maxFontSize: 14,
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 40,
      ),
    ],
  );
}


// categoryCard(
//                       height: MediaQuery.sizeOf(context).height * 0.2,
//                       width: MediaQuery.sizeOf(context).width * 0.43,
//                       title: viewModel.getData == null
//                           ? ''
//                           : viewModel.getData!.data[0].title,
//                       subTitle: viewModel.getData == null
//                           ? ''
//                           : viewModel.getData!.data[0].subtitle,
//                       context: context),












//old code





// Padding(
//           padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 children: [
                  
                  
//                   categoryCard(
//                       height: MediaQuery.sizeOf(context).height * 0.1,
//                       width: MediaQuery.sizeOf(context).width * 0.43,
//                       title: viewModel.getData == null
//                           ? ''
//                           : viewModel.getData!.data[4].title,
//                       subTitle: viewModel.getData == null
//                           ? ''
//                           : viewModel.getData!.data[4].subtitle,
//                       context: context),
//                 ],
//               ),
//               Column(
//                 children: [
//                   categoryCard(
//                       height: MediaQuery.sizeOf(context).height * 0.2,
//                       width: MediaQuery.sizeOf(context).width * 0.43,
//                       title: viewModel.getData == null
//                           ? ''
//                           : viewModel.getData!.data[1].title,
//                       subTitle: viewModel.getData == null
//                           ? ''
//                           : viewModel.getData!.data[3].subtitle,
//                       context: context),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10),
//                     child: categoryCard(
//                         height: MediaQuery.sizeOf(context).height * 0.1,
//                         width: MediaQuery.sizeOf(context).width * 0.43,
//                         title: viewModel.getData == null
//                             ? ''
//                             : viewModel.getData!.data[5].title,
//                         subTitle: viewModel.getData == null
//                             ? ''
//                             : viewModel.getData!.data[5].subtitle,
//                         context: context),
//                   ),
//                   categoryCard(
//                       height: MediaQuery.sizeOf(context).height * 0.1,
//                       width: MediaQuery.sizeOf(context).width * 0.43,
//                       title: 'Pandago',
//                       subTitle: 'Send parcels in a tap',
//                       context: context),
//                 ],
//               ),
//             ],
//           ),
//         ),