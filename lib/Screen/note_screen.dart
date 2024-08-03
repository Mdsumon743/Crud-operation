import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/controller.dart';
import '../Custom Widget/custom_text.dart';
import '../Custom Widget/custom_textfeild.dart';
import '../Model/model.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final noteController = Get.put(NoteController());
    final arg = Get.arguments != null
        ? Get.arguments as Map
        : {'isUpdate': false, 'note': null};
    final bool isUpdate = arg['isUpdate'] ?? false;
    final noteList = arg['note'] == null ? null : arg['note'] as Model;
    final int? index = arg['index'] == null ? null : arg['index'] as int;

    final textTittle = TextEditingController(
      text: isUpdate ? noteList!.tittle : null,
    );

    final textDescription =
        TextEditingController(text: isUpdate ? noteList!.instutute : null);
    final textDepartment =
        TextEditingController(text: isUpdate ? noteList!.department : null);
    final textRoll = TextEditingController(
        text: isUpdate ? noteList!.roll.toString() : null);
    final textRegistration = TextEditingController(
        text: isUpdate ? noteList!.roll.toString() : null);
    final textSession = TextEditingController(
        text: isUpdate ? noteList!.session.toString() : null);
    final textSemester = TextEditingController(
        text: isUpdate ? noteList!.semester.toString() : null);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Theme.of(context).colorScheme.surface,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                CustomText(
                    tittle: 'Information',
                    size: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface),
                const SizedBox(
                  height: 20,
                ),
                CustomTextfeild(
                  inputType: TextInputType.text,
                  textEditingController: textTittle,
                  tittle: 'Name',
                  fontWeight: FontWeight.normal,
                  textsize: 18,
                  maxLine: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfeild(
                  inputType: TextInputType.text,
                  textEditingController: textDescription,
                  tittle: 'institute Name',
                  fontWeight: FontWeight.normal,
                  textsize: 18,
                  hinttextsize: 18,
                  hintfontWeight: FontWeight.normal,
                  maxLine: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfeild(
                  textEditingController: textDepartment,
                  inputType: TextInputType.text,
                  tittle: 'Department',
                  fontWeight: FontWeight.normal,
                  textsize: 18,
                  hinttextsize: 18,
                  hintfontWeight: FontWeight.normal,
                  maxLine: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfeild(
                  textEditingController: textRoll,
                  inputType: TextInputType.number,
                  tittle: 'Roll',
                  fontWeight: FontWeight.normal,
                  textsize: 18,
                  hinttextsize: 18,
                  hintfontWeight: FontWeight.normal,
                  maxLine: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfeild(
                  inputType: TextInputType.number,
                  textEditingController: textRegistration,
                  tittle: 'Registration number',
                  fontWeight: FontWeight.normal,
                  textsize: 18,
                  hinttextsize: 18,
                  hintfontWeight: FontWeight.normal,
                  maxLine: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfeild(
                  inputType: TextInputType.number,
                  textEditingController: textSession,
                  tittle: 'Session',
                  fontWeight: FontWeight.normal,
                  textsize: 18,
                  hinttextsize: 18,
                  hintfontWeight: FontWeight.normal,
                  maxLine: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfeild(
                  inputType: TextInputType.number,
                  textEditingController: textSemester,
                  tittle: 'Semester',
                  fontWeight: FontWeight.normal,
                  textsize: 18,
                  hinttextsize: 18,
                  hintfontWeight: FontWeight.normal,
                  maxLine: 1,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              if (textTittle.text.isEmpty ||
                  textDescription.text.isEmpty ||
                  textDepartment.text.isEmpty ||
                  textRoll.text.isEmpty ||
                  textRegistration.text.isEmpty ||
                  textSession.text.isEmpty ||
                  textSemester.text.isEmpty) {
                Get.snackbar('Error', 'Please Fill up the all required',
                    animationDuration: const Duration(seconds: 1));
              } else {
                isUpdate
                    ? noteController.updateNote(
                        index!,
                        Model(
                            department: textDepartment.text,
                            roll: textRoll.text,
                            session: textSession.text,
                            tittle: textTittle.text,
                            instutute: textDescription.text,
                            date: noteList!.date,
                            registration: textRegistration.text,
                            semester: textSemester.text))
                    : noteController.addNote(Model(
                        roll: textRoll.text,
                        session: textSession.text,
                        semester: textSemester.text,
                        department: textDepartment.text,
                        registration: textRegistration.text,
                        tittle: textTittle.text,
                        instutute: textDescription.text,
                        date: DateTime.now()));
                Get.back();
              }
            },
            label: const CustomText(
                tittle: 'Save',
                size: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }
}
