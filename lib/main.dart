import 'package:flutter/material.dart';
import 'package:loja/ui/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    title: 'Flutter Loja',
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.green,
    ),
  ));
}
