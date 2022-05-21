import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:quizui/screens/registrationScreen.dart';
import 'package:quizui/services/providers.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ContactProvider())],
      child: MaterialApp(
          home: RegistrationScreen(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            accentColor: Colors.teal,
          )),
    );
  }
}
