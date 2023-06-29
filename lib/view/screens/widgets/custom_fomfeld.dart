import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reon_task/view/styles/color.dart';
import 'package:reon_task/view/styles/fonts.dart';

class TextformWidget extends StatelessWidget {
  const TextformWidget(
      {super.key,
      required this.controller,
      required this.readOnly,
      required this.lebel1,
      required this.lebel2,
      required this.ontap});

  final TextEditingController controller;
  final bool readOnly;
  final String lebel1;
  final String lebel2;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lebel1,
            style: AppsFonts.headlineFonts,
          ),
          Text(
            lebel2,
            style: AppsFonts.lebelLightFont,
          ),
          TextField(
            cursorColor: baseColor,
            onTap: ontap,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(2.w),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: baseColor),
              ),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: baseColor)),
            ),
            style: const TextStyle(fontWeight: FontWeight.bold),
            autofocus: true,
            showCursor: true,
            readOnly: readOnly,
          ),
        ],
      ),
    );
  }
}
