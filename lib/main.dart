import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myproject/firebase_options.dart';
import 'package:myproject/models/itemcart.dart';
import 'package:myproject/view/home.dart';
import 'package:myproject/view/login.dart';
import 'package:myproject/view/register.dart';

import 'package:myproject/viewmodel/controller_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return ControllerProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
          builder: (context, child) =>
              MaterialApp(debugShowCheckedModeBanner: false, home: Login()),
        ),
      ],
    );
  }
}
