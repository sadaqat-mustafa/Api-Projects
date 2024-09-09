import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:integration_api/Integration%20using%20Dio/cart_model.dart';

class DioHomeScreen extends StatefulWidget {
  const DioHomeScreen({super.key});

  @override
  State<DioHomeScreen> createState() => _DioHomeScreenState();
}

class _DioHomeScreenState extends State<DioHomeScreen> {
  Cart? cart;
  Future<void> getData() async {
    const String apiUrl = "https://dummyjson.com/carts";
    try {
      Response response = await Dio().get(apiUrl);
      if (response.data != null) {
        setState(() {
          cart = Cart.fromJson(response.data);
        });
      } else {
        print("Unexpected error, non supported format");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Api Integration with Dio Package'),
          centerTitle: true,
        ),
        body: GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 12,
              crossAxisCount: 2,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return Material(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20),
                elevation: 5,
              );
            }));
  }
}
