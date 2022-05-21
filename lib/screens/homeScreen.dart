import 'package:flutter/material.dart';
import 'package:quizui/screens/createEditContactScreen.dart';
import 'package:quizui/shared/contactContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text("Welcome, XYZ"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (ctx, i) => ContactContainer(),
              separatorBuilder: (ctx, i) => SizedBox(
                height: 10,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => CreateEditContactScreen())),
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
