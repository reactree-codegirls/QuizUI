import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizui/constants.dart';
import 'package:quizui/services/providers.dart';

class DeleteDialog extends StatefulWidget {
  final String id;

  DeleteDialog({required this.id});

  @override
  State<DeleteDialog> createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {

  late ContactProvider contactProvider;

  @override
  void initState() {
    contactProvider=Provider.of<ContactProvider>(context,listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(
        color: Theme.of(context).accentColor,width: 3
      )),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize:  MainAxisSize.min,
          children: [
            Text("Delete?",style: TextStyle(
              color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 10,),
            Text("Are you sure you want to delete this contact?",style: whiteTextStyle.copyWith(
              color: Colors.red
            )),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(onPressed: ()=>Navigator.of(context).pop(), child: Text("Cancel")),
                  ElevatedButton(onPressed: (){
                    contactProvider.deleteContact(widget.id);
                    Navigator.of(context).pop();
                  }, child: Text("OK"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}