import 'package:flutter/material.dart';
import '../../../reuseable_widget/custom_text.dart';

Widget socialButton(
    {required Color color,
    required icon,
    required String text,
    required Color textColor}) {
  return Container(
    height: 50,
    margin: const EdgeInsets.only(top: 12),
    width: double.infinity,
    padding: const EdgeInsets.symmetric(
      vertical: 5,
    ),
    decoration: BoxDecoration(
      color: color,
      border: Border.all(color: Colors.black12),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        icon,
        CustomText.customSizedText(
            text: text, fontWeight: FontWeight.w900, color: textColor),
        const SizedBox(
          width: 40,
        ),
      ],
    ),
  );
}
