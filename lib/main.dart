import 'package:car_wash_center/screens/add_services.dart';
import 'package:car_wash_center/screens/home_page.dart';
import 'package:car_wash_center/screens/services.dart';
import 'package:car_wash_center/screens/sign_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignPage(),
      routes: {
        SignPage.id: (context) => const SignPage(),
        HomePage.id: (context) => const HomePage(),
        AddServices.id: (context) => const AddServices(),
        ServicesPage.id: (context) => const ServicesPage(),
      },
    );
  }
}
