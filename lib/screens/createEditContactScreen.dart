import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:quizui/model/contactModel.dart';
import 'package:quizui/services/providers.dart';

import '../shared/customTextField.dart';

class CreateEditContactScreen extends StatefulWidget {
  final ContactModel? contact;

  CreateEditContactScreen({this.contact});

  @override
  State<CreateEditContactScreen> createState() =>
      _CreateEditContactScreenState();
}

class _CreateEditContactScreenState extends State<CreateEditContactScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late ContactProvider contactProvider;

  @override
  initState() {
    contactProvider = Provider.of<ContactProvider>(context, listen: false);

    if (widget.contact != null) {
      nameController = TextEditingController(text: widget.contact!.name);
      emailController = TextEditingController(text: widget.contact!.email);
      phoneController = TextEditingController(text: widget.contact!.phoneNo);
      if (widget.contact!.imagePath != null)
        file = File(widget.contact!.imagePath!);
    }
    super.initState();
  }

  File? file;

  onEdit() {}

  onCreate() {
    if (nameController.text.isEmpty || phoneController.text.isEmpty) return;

    final contact = ContactModel(
        id: DateTime.now().toString(),
        name: nameController.text,
        email: emailController.text.isEmpty ? null : emailController.text,
        imagePath: file == null ? null : file!.path,
        phoneNo: phoneController.text);

    contactProvider.addContact(contact);

    Navigator.of(context).pop();
  }

  getImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      file = File(pickedImage.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Contact"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  child: file == null
                      ? Icon(Icons.person, color: Colors.white)
                      : null,
                  backgroundImage: file == null ? null : FileImage(file!),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                        onTap: getImage,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.red,
                          size: 30,
                        )))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              hintText: "Name",
              controller: nameController,
              keyboardType: TextInputType.name,
              prefixIcon: Icon(Icons.person),
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              hintText: "Email",
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icon(Icons.email),
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              hintText: "Phone No",
              controller: phoneController,
              keyboardType: TextInputType.number,
              prefixIcon: Icon(Icons.phone),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: widget.contact == null ? onCreate : onEdit,
                    child: Text(widget.contact==null?"Create":"Edit")))
          ],
        ),
      ),
    );
  }
}
