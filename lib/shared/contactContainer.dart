import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quizui/constants.dart';
import 'package:quizui/model/contactModel.dart';
import 'package:quizui/screens/createEditContactScreen.dart';
import 'package:quizui/shared/deleteDialog.dart';

class ContactContainer extends StatefulWidget {
  final ContactModel contact;

  ContactContainer({required this.contact});

  @override
  State<ContactContainer> createState() => _ContactContainerState();
}

class _ContactContainerState extends State<ContactContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            child: widget.contact.imagePath == null ? Icon(Icons.person) : null,
            backgroundImage: widget.contact.imagePath == null
                ? null
                : FileImage(File(widget.contact.imagePath!)),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.contact.name,
                  style: whiteTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                Visibility(
                  visible: widget.contact.email != null,
                  child: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      widget.contact.email == null
                          ? 'NA'
                          : widget.contact.email!,
                      style: whiteTextStyle,
                      maxLines: 1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.contact.phoneNo,
                  style: whiteTextStyle,
                )
              ],
            ),
          ),
          IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => CreateEditContactScreen(
                        contact: widget.contact,
                      ))),
              icon: Icon(
                Icons.edit,
                color: Colors.yellow,
              )),
          IconButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (ctx) => DeleteDialog(id: widget.contact.id)),
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
