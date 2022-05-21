import 'package:flutter/material.dart';
import 'package:quizui/constants.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({ Key? key }) : super(key: key);

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
                  ElevatedButton(onPressed: (){}, child: Text("OK"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}