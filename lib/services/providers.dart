import 'package:flutter/cupertino.dart';
import 'package:quizui/model/contactModel.dart';

class ContactProvider with ChangeNotifier{

  final List<ContactModel> contacts=[];

  addContact(ContactModel newContact){
    contacts.add(newContact);
    notifyListeners();
  }

  deleteContact(String id){
    contacts.removeWhere((element) => element.id==id);
    notifyListeners();
  }
}