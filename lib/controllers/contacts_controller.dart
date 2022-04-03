import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:phonebook_flutter/models/contacts.dart';
import 'package:phonebook_flutter/services/connection/api.dart';
import 'package:phonebook_flutter/services/globals.dart' as globals;
import 'dart:convert';

class ContactsController extends GetxController {
  var isLoading = true.obs;
  Rx<Contacts> contactList =
      Contacts(status: 'empty', message: '', data: <Datum>[]).obs;
  Rx<Contacts> contactListFull =
      Contacts(status: 'empty', message: '', data: <Datum>[]).obs;
  final Rx<GlobalKey<FormState>> contactFormKey = GlobalKey<FormState>().obs;

  late Rx<TextEditingController> searchController;
  var search = ''.obs;

  @override
  void onInit() {
    fetchInitialContacts();
    searchController = TextEditingController().obs;
    super.onInit();
  }

  @override
  void onClose() {
    searchController.value.dispose();
  }

  ContactsController();

  void fetchInitialContacts() async {
    try {
      isLoading(true);
      var contacts = await Api.get('/api/contact', headers: {
        'Content-Type': 'application/json',
      });

      if (contacts['status'] == 'success') {
        contactList.value = contactsFromJson(json.encode(contacts));
        contactListFull.value = contactList.value;
      } else {}
    } finally {
      isLoading(false);
    }
  }

  Future<bool> fetchContacts() async {
    isLoading(true);

    try {
      var contacts = await Api.get(globals.host, headers: {
        'Content-Type': 'application/json',
      });

      if (contacts != null) {
        contactList.value = contacts;
        return true;
      } else {
        return false;
      }
    } finally {
      isLoading(false);
    }
  }

  void searchContact(String search) {
    if (search.isNotEmpty) {
      contactList.value.data = contactListFull.value.data
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(search.toLowerCase()))
          .toList();
    } else {
      contactList.value.data = contactListFull.value.data;
    }
  }
}
