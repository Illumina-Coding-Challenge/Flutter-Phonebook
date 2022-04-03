import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phonebook_flutter/controllers/contacts_controller.dart';
import 'package:phonebook_flutter/views/Contact/show_screen.dart';

class HomeScreen extends StatelessWidget {
  final ContactsController contactsController = Get.put(ContactsController());
  late Timer _timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PhoneBook'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            // Form(
            //   key: contactsController.contactFormKey.value,
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       errorStyle: TextStyle(color: Colors.yellow[700]),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       labelText: "Search Contacts",
            //       prefixIcon: const Icon(Icons.search),
            //       fillColor: Colors.white54,
            //     ),
            //     keyboardType: TextInputType.name,
            //     controller: contactsController.searchController.value,
            //     onChanged: (value) {
            //       contactsController.searchContact(value);
            //     },
            //   ),
            // ),
            // const SizedBox(height: 10),
            Expanded(
              child: Obx(
                () => ListView.builder(
                    itemCount: contactsController.contactList.value.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(ContactShowScreen(
                              name: contactsController
                                  .contactList.value.data[index].name,
                              phone: contactsController
                                  .contactList.value.data[index].phone,
                              address: contactsController
                                  .contactList.value.data[index].address));
                        },
                        child: ListTile(
                          title: Text(
                            contactsController
                                .contactList.value.data[index].name,
                            style: Get.textTheme.headline6,
                          ),
                          trailing: InkWell(
                              onTap: () {
                                Get.bottomSheet(
                                  Obx(() {
                                    return Container(
                                      decoration: BoxDecoration(
                                          // color: bgColor,
                                          shape: BoxShape.rectangle,
                                          border: Border.all(width: 0),
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12))),
                                      child: Wrap(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top:20.0, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [Text(
                                                contactsController.contactList.value
                                                    .data[index].name,
                                                textAlign: TextAlign.center,
                                                style: Get.textTheme.headline6,
                                              ),]
                                            ),
                                          ),
                                          ListTile(
                                            leading: const Icon(
                                              Icons.edit,
                                            ),
                                            title: const Text(
                                              'Edit',
                                            ),
                                            onTap: () {},
                                          ),
                                          ListTile(
                                            leading: const Icon(
                                              Icons.delete,
                                            ),
                                            title: const Text(
                                              'Delete',
                                            ),
                                            onTap: () {},
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                  backgroundColor:
                                      Theme.of(context).backgroundColor,
                                  isDismissible: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12)),
                                    side: BorderSide(
                                      color: Theme.of(context).backgroundColor,
                                      style: BorderStyle.none,
                                      width: 0.0,
                                    ),
                                  ),
                                );
                              },
                              child: Icon(Icons.more_vert_outlined)),
                          subtitle: Text(
                            contactsController
                                .contactList.value.data[index].phone,
                            style: Get.textTheme.bodyText2,
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
