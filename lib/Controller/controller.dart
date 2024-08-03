import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/model.dart';

class Controller extends GetxController {
  RxBool isDark = false.obs;

  changeTheme() {
    isDark.value = !isDark.value;
    Get.changeThemeMode(
        isDark.value == true ? ThemeMode.dark : ThemeMode.light);
  }
}

class NoteController extends GetxController {
  RxList<Model> notes = <Model>[].obs;

  addNote(Model model) {
    notes.add(model);
    update();
  }

  deleteNote(int index) {
    notes.removeAt(index);
    update();
  }

  updateNote(int index, Model modelData) {
    notes[index] = modelData;
    update();
  }
}
