import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reon_task/controller/keybord_controller.dart';
import 'package:reon_task/view/styles/color.dart';

class CustomKeyboardWidget extends StatelessWidget {
  CustomKeyboardWidget({
    super.key,
    this.onTextInput,
    this.onBackspace,
  });
  final ValueSetter<String>? onTextInput;
  final void Function()? onBackspace;

  final List<String> keyboardKeys = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
    '0',
  ];

  final keyboardController = Get.put(KeyboardController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 12,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 5),
        itemBuilder: (context, index) {
          return GetX<KeyboardController>(builder: (controller) {
            return GestureDetector(
              onTap: () {
                controller.selectItem(index);
                index == 11
                    ? onBackspace?.call()
                    : onTextInput?.call(keyboardKeys[index]);
              },
              child: SizedBox(
                height: 45.h,
                width: 86.w,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 35.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                        color: controller.selectedIndex.value == index
                            ? baseColor
                            : white,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: index == 11
                        ? const Center(
                            child: Icon(
                              Icons.backspace_outlined,
                              size: 20,
                            ),
                          )
                        : Center(
                            child: Text(
                              keyboardKeys[index],
                              style: GoogleFonts.roboto(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: controller.selectedIndex.value == index
                                    ? white
                                    : black,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
