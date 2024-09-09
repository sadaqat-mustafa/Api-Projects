import 'package:flutter/material.dart';
import 'package:integration_api/Integration%20using%20Dio/dio_home_screen.dart';
import 'package:integration_api/Without%20Model/get_method_without_model.dart';
import 'package:integration_api/home_screen.dart';
import 'package:integration_api/post_register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DioHomeScreen(),
    );
  }
}
