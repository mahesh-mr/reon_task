import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KeyboardController extends GetxController {
  TextEditingController controller4 = TextEditingController();
  final TextEditingController bonusController = TextEditingController();
  final TextEditingController loanController = TextEditingController();
  final TextEditingController installmentController = TextEditingController();
  RxInt selectedIndex = RxInt(-1);
  RxBool isChecked = false.obs;
  bool readOnly = true;

//check box
  void toggleCheckbox(bool value) {
    isChecked.value = value;
  }

//color
  void selectItem(int index) {
    selectedIndex.value = index;
  }

//controll change
  void currentTextContrioller(TextEditingController newController) {
    controller4 = newController;
    update();
  }

  void toggleReadOnly() {
    readOnly = !readOnly;
    update();
  }

  @override
  void onInit() {
    currentTextContrioller(bonusController);

    update();
    super.onInit();
  }

  void insertText(String text, TextEditingController controller) {
    final value = controller.value;
    final selection = value.selection;
    final newText = value.text.replaceRange(
      selection.start,
      selection.end,
      text,
    );
    controller.value = value.copyWith(
      text: newText,
      selection: selection.copyWith(
        baseOffset: selection.start + text.length,
        extentOffset: selection.start + text.length,
      ),
      composing: TextRange.empty,
    );
  }

  void backspace(TextEditingController controller) {
    final value = controller.value;
    final selection = value.selection;
    final text = value.text;
    final selectionLength = selection.end - selection.start;
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        selection.start,
        selection.end,
        '',
      );
      controller.value = value.copyWith(
        text: newText,
        selection: selection.copyWith(
          baseOffset: selection.start,
          extentOffset: selection.start,
        ),
        composing: TextRange.empty,
      );
      return;
    }
    if (selection.start == 0) {
      return;
    }
    final newStart = selection.start - 1;
    final newEnd = selection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    controller.value = value.copyWith(
      text: newText,
      selection: selection.copyWith(
        baseOffset: newStart,
        extentOffset: newStart,
      ),
      composing: TextRange.empty,
    );
  }

  @override
  void dispose() {
    loanController.dispose();
    bonusController.dispose();
    installmentController.dispose();
    super.dispose();
  }
}
