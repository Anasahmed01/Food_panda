import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import '../utils/colors/app_colors.dart';

Widget switchButton({
  void Function(dynamic)? onChanged,
}) {
  return AdvancedSwitch(
    activeColor: AppColors.primaryColor,
    inactiveColor: AppColors.greyColor,
    borderRadius: BorderRadius.circular(8),
    height: 25,
    width: 45,
    onChanged: onChanged,
  );
}
