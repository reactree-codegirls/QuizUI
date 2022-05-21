import 'package:flutter/cupertino.dart';
import 'package:quizui/model/contactModel.dart';

class ContactProvider with ChangeNotifier {
  final List<ContactModel> contacts = [];

  addContact(ContactModel newContact) {
    contacts.add(newContact);
    notifyListeners();
  }

  deleteContact(String id) {
    contacts.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  editContact( ContactModel contact) {
    final index = contacts.indexWhere((element) => element.id == contact.id);

    if (index != -1) {
      contacts[index] = contact;
      notifyListeners();
    }
  }
}
