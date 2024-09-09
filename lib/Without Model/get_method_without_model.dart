import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:integration_api/Without%20Model/Services.dart';

class GetMethodWithoutModel extends StatefulWidget {
  const GetMethodWithoutModel({super.key});

  @override
  State<GetMethodWithoutModel> createState() => _GetMethodWithoutModelState();
}

class _GetMethodWithoutModelState extends State<GetMethodWithoutModel> {
  @override
  Widget build(BuildContext context) {
    dynamic postModelData = [];
    bool isLoading = false;
    getPost() {
      isLoading = true;
      ApiService().getMethodWithoutModel().then((value) {
        setState(() {
          isLoading = false;
          postModelData = value;
        });
      }).onError((error, StackTrace) {
        print(error);
      });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Get Method without Model'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: postModelData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(postModelData[index]['name'].toString()),
                  ],
                );
              }),
    );
  }
}
