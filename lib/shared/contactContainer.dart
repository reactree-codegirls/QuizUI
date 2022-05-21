import 'package:flutter/material.dart';
import 'package:quizui/constants.dart';
import 'package:quizui/shared/deleteDialog.dart';

class ContactContainer extends StatefulWidget {
  const ContactContainer({Key? key}) : super(key: key);

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
            child: Icon(Icons.person),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Maaz Khan",
                  style: whiteTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "khanmaaz1998@gmail.com",
                  style: whiteTextStyle,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "090078601",
                  style: whiteTextStyle,
                )
              ],
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Colors.yellow,
              )),
          IconButton(
              onPressed: () => showDialog(
                  context: context, builder: (ctx) => DeleteDialog()),
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
