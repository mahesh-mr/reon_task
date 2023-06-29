import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reon_task/controller/keybord_controller.dart';
import 'package:reon_task/view/screens/widgets/custom_fomfeld.dart';
import 'package:reon_task/view/screens/widgets/custom_keybord.dart';
import 'package:reon_task/view/styles/color.dart';
import 'package:reon_task/view/styles/fonts.dart';
import 'package:reon_task/view/styles/constraints.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final KeyboardController keybordcontroller = Get.put(KeyboardController());

    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          title: Text("SALERY PAYMENT", style: AppsFonts.appbarText),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 25.w),
              child: const Icon(CupertinoIcons.clear_thick_circled),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Felicia Rodriguez',
                      style: AppsFonts.headlineFonts,
                    ),
                    Text(
                      'Total payment: KD 1200.000',
                      style: AppsFonts.sublineFonts,
                    ),
                  ],
                ),
              ),
              AppsConstraint.h10,
              const Divider(
                color: baseColor,
              ),
              AppsConstraint.h10,
              TextformWidget(
                ontap: () {
                  keybordcontroller.currentTextContrioller(
                      keybordcontroller.bonusController);
                },
                controller: keybordcontroller.bonusController,
                readOnly: keybordcontroller.readOnly,
                lebel1: 'Bonus',
                lebel2: "(max amount KD 250)",
              ),
              Obx(() {
                return Visibility(
                  visible: keybordcontroller.isChecked.value,
                  child: TextformWidget(
                    ontap: () {
                      keybordcontroller.currentTextContrioller(
                          keybordcontroller.loanController);
                    },
                    controller: keybordcontroller.loanController,
                    readOnly: keybordcontroller.readOnly,
                    lebel1: 'Loan',
                    lebel2: "(loan amount)",
                  ),
                );
              }),
              TextformWidget(
                ontap: () {
                  keybordcontroller.currentTextContrioller(
                      keybordcontroller.installmentController);
                },
                controller: keybordcontroller.installmentController,
                readOnly: keybordcontroller.readOnly,
                lebel1: 'Loan installment',
                lebel2: "(This month's installment amount)",
              ),
              Row(
                children: [
                  Obx(() {
                    return Checkbox(
                      activeColor: baseColor,
                      value: keybordcontroller.isChecked.value,
                      onChanged: (value) {
                        keybordcontroller.toggleCheckbox(value!);
                      },
                    );
                  }),
                  Text(
                    "Remove the scheduled amount",
                    style: AppsFonts.lebelLightFont,
                  )
                ],
              ),
              AppsConstraint.h30,
              const Divider(
                color: baseColor,
              ),
              CustomKeyboardWidget(
                onTextInput: (value) {
                  keybordcontroller.insertText(
                      value, keybordcontroller.controller4);
                },
                onBackspace: () =>
                    keybordcontroller.backspace(keybordcontroller.controller4),
              ),
              const Divider(
                color: baseColor,
              ),
              AppsConstraint.h10,
              Align(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Save",
                      style: AppsFonts.headlineFonts,
                    )),
              )
            ],
          ),
        ));
  }
}
