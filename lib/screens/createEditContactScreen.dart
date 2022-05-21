import 'package:flutter/material.dart';

import '../shared/customTextField.dart';

class CreateEditContactScreen extends StatefulWidget {
  const CreateEditContactScreen({Key? key}) : super(key: key);

  @override
  State<CreateEditContactScreen> createState() =>
      _CreateEditContactScreenState();
}

class _CreateEditContactScreenState extends State<CreateEditContactScreen> {

  final TextEditingController nameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();


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
              child: Icon(Icons.person,color:Colors.white),
            ),
            Positioned(
              bottom: 0,right: 0,
              child: Icon(Icons.camera_alt,color: Colors.red,size: 30,))
              ],
            ),
            SizedBox(height: 15,),
            CustomTextField(
              hintText: "Name",
              controller: nameController,
              keyboardType: TextInputType.name,
              prefixIcon: Icon(Icons.person),
            ),
            SizedBox(height: 15,),
            CustomTextField(
              hintText: "Email",
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icon(Icons.email),
            ),
            SizedBox(height: 15,),
            CustomTextField(
              hintText: "Phone No",
              controller: nameController,
              keyboardType: TextInputType.number,
              prefixIcon: Icon(Icons.phone),
            ),
            SizedBox(height: 50,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(onPressed: (){}, child: Text("Create")))
          ],
        ),
      ),
    );
  }
}
