import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/controller.dart';
import '../Custom Widget/custom_container.dart';
import '../Custom Widget/custom_text.dart';
import 'note_screen.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
    final controller = Get.put(NoteController());
    final themechange = Get.put(Controller());
    final Color onsurface = Theme.of(context).colorScheme.onSurface;
    final Color surface = Theme.of(context).colorScheme.surface;
    final Color primary = Theme.of(context).colorScheme.primary;
    final size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        key: key,
        backgroundColor: surface,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CustomText(
                    tittle: 'Student list',
                    size: 25,
                    fontWeight: FontWeight.w700,
                    color: onsurface),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu_rounded)),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search_rounded)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert_rounded)),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      tittle: 'Today',
                      size: 20,
                      fontWeight: FontWeight.bold,
                      color: onsurface),
                  CustomText(
                      tittle: 'view all',
                      size: 18,
                      fontWeight: FontWeight.w600,
                      color: primary),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Expanded(
                  child: Obx(
                () => SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      controller.notes.isEmpty
                          ? Center(
                              child: CustomText(
                                  tittle: 'No Student information',
                                  size: 18,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              reverse: true,
                              itemCount: controller.notes.length,
                              itemBuilder: (context, index) {
                                //   final note = controller.notes[index];

                                return CustomContainer(
                                  index: index,
                                );
                              },
                            ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primary,
          tooltip: 'Add Note',
          onPressed: () {
            Get.to(const NoteScreen());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        drawer: NavigationDrawer(
            backgroundColor: surface,
            elevation: 10,
            shadowColor: Colors.grey,
            children: [
              DrawerHeader(
                  child: Center(
                      child: Column(
                children: [
                  Image.asset(
                    'assets/images/men.png',
                    height: 100,
                    width: 100,
                  ),
                  CustomText(
                      tittle: 'Sumon',
                      size: 20,
                      fontWeight: FontWeight.bold,
                      color: onsurface)
                ],
              ))),
              ListTile(
                onTap: () {
                  Get.back();
                },
                leading: const Icon(Icons.list),
                title: CustomText(
                    tittle: 'List',
                    size: 18,
                    fontWeight: FontWeight.w600,
                    color: onsurface),
              ),
              ListTile(
                onTap: () {
                  themechange.changeTheme();

                },
                leading: const Icon(Icons.color_lens_rounded),
                title: CustomText(
                    tittle: 'Theme',
                    size: 18,
                    fontWeight: FontWeight.w600,
                    color: onsurface),

              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.settings),
                title: CustomText(
                    tittle: 'Setting',
                    size: 18,
                    fontWeight: FontWeight.w600,
                    color: onsurface),
              )
            ]),
      ),
    );
  }
}
