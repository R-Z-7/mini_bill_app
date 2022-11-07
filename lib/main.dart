import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini_bill_app/model/data.dart';
import 'package:mini_bill_app/screens/home.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  // Initialize hive
  final applicatonDocumentDir =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.initFlutter(applicatonDocumentDir.path);
  // Registering the adapter
  Hive.registerAdapter(TaskAdapter());
  // Opening the box

  await Hive.openBox<Task>('Box1');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Mini Bill App',
      home: Home(),
    );
  }
}
