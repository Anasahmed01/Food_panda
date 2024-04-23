import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/colors/app_colors.dart';

Widget feedbackField() {
  return TextFormField(
    keyboardType: TextInputType.multiline,
    maxLength: 500,
    minLines: 3,
    maxLines: 100,
    inputFormatters: [
      LengthLimitingTextInputFormatter(500),
    ],
    decoration: InputDecoration(
        hintText: 'e.g. no mayo',
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.blackColor,
            )),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blackColor),
            borderRadius: BorderRadius.circular(10))),
  );
}

extension SB on num {
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );
  SizedBox get pw => SizedBox(
        height: toDouble(),
      );
}

// BottomSheet bottomSheet(CartViewModel viewModel, VoidCallback back) {
//   return BottomSheet(
//     shadowColor: AppColors.blackColor,
//     onClosing: () {},
//     builder: (context) {
//       return Container(
//         color: AppColors.white,
//         padding: const EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
//         height: 300,
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 10.0, bottom: 10),
//               child: CustomText.customSizedText(
//                   text: 'If this product is not available',
//                   size: 20,
//                   fontWeight: FontWeight.w800),
//             ),
//             ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: viewModel.bottomSheetIsSelected.length,
//               itemBuilder: (context, index) {
//                 return Row(
//                   children: [
//                     Radio(
//                       visualDensity: const VisualDensity(
//                         horizontal: VisualDensity.minimumDensity,
//                       ),
//                       activeColor: AppColors.primaryColor,
//                       value: index,
//                       groupValue: viewModel.bottomSheetIsSelected.indexOf(true),
//                       onChanged: (int? value) {
//                         viewModel.rebuildUi();
//                         for (int i = 0;
//                             i < viewModel.bottomSheetIsSelected.length;
//                             i++) {
//                           viewModel.bottomSheetIsSelected[i] = (value == i);
//                         }
//                         viewModel.rebuildUi();
//                       },
//                     ),
//                     CustomText.customSizedText(
//                         text: viewModel.bottomSheetItem[index]),
//                   ],
//                 );
//               },
//             ),
//             GestureDetector(
//               onTap: back,
//               child: Container(
//                 margin: const EdgeInsets.only(left: 8, top: 15, right: 8),
//                 width: double.infinity,
//                 height: 60,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: AppColors.primaryColor),
//                 child: Center(
//                   child: CustomText.customSizedText(
//                       text: 'Apply', color: AppColors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
