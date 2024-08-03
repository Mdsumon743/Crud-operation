import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Controller/controller.dart';
import '../Screen/note_screen.dart';
import 'custom_text.dart';

class CustomContainer extends StatelessWidget {
  final int index;
  const CustomContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NoteController());
    final noteList = controller.notes.elementAt(index);
    final formatDate = DateFormat.yMMMMd().format((noteList.date));
    final formatTime = DateFormat.jm().format((noteList.date));
    return InkWell(
      onTap: () {
        Get.to(const NoteScreen(),
            arguments: {'isUpdate': true, 'note': noteList, 'index': index});
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.onSurface,
                blurRadius: 1,
                spreadRadius: 0.5,
                blurStyle: BlurStyle.normal,
              )
            ]),
        child: ListTile(
          title: CustomText(
              tittle: 'Name : ${noteList.tittle}',
              textOverflow: TextOverflow.ellipsis,
              maxline: 1,
              size: 18,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  tittle: 'Institute : ${noteList.instutute}',
                  maxline: 1,
                  textOverflow: TextOverflow.ellipsis,
                  size: 18,
                  fontWeight: FontWeight.w600,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
              CustomText(
                  tittle: 'Department : ${noteList.department}',
                  maxline: 1,
                  textOverflow: TextOverflow.ellipsis,
                  size: 18,
                  fontWeight: FontWeight.w600,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
              CustomText(
                  tittle: 'Roll : ${noteList.roll}',
                  maxline: 1,
                  textOverflow: TextOverflow.ellipsis,
                  size: 18,
                  fontWeight: FontWeight.w600,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
              CustomText(
                  tittle: 'Registration : ${noteList.registration}',
                  maxline: 1,
                  textOverflow: TextOverflow.ellipsis,
                  size: 18,
                  fontWeight: FontWeight.w600,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
              CustomText(
                  tittle: 'Session : ${noteList.session}',
                  maxline: 1,
                  textOverflow: TextOverflow.ellipsis,
                  size: 18,
                  fontWeight: FontWeight.w600,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
              CustomText(
                  tittle: 'Semester : ${noteList.semester}',
                  maxline: 1,
                  textOverflow: TextOverflow.ellipsis,
                  size: 18,
                  fontWeight: FontWeight.w600,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      tittle: '$formatTime-$formatDate',
                      size: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6)),
                  InkWell(
                      onTap: () {
                        Get.defaultDialog(
                            barrierDismissible: false,
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(0.8),
                            title: 'Delete Information',
                            content: CustomText(
                                tittle: 'Are you sure ?',
                                size: 18,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.onSurface),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text('No')),
                              const SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                  onPressed: () {
                                    controller.deleteNote(index);
                                    Get.back();
                                    Get.snackbar('Successful', 'Delete Done',
                                        snackPosition: SnackPosition.BOTTOM);
                                  },
                                  child: const Text('Yes')),
                            ]);
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
