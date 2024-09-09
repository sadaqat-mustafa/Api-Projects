import 'package:flutter/material.dart';
import 'package:integration_api/Model/get_model.dart';
import 'package:integration_api/Services/api_services.dart';
import 'package:integration_api/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CommentsModel> commentsModel = [];
  List<UserModel> userModel = [];

  getComments() {
    ApiServices().getCommentsModel().then((value) {
      setState(() {
        commentsModel = value!;
      });
    });
  }

  getUsers() {
    ApiServices().getUsersModel().then((value) {
      setState(() {
        userModel = value!;
      });
    });
  }

  @override
  void initState() {
    getComments();
    getUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Api Tutorial'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: commentsModel.length,
        itemBuilder: (context, index) {
          final apiData = commentsModel[index];

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      child: Text(
                        apiData.id.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${apiData.name.toUpperCase()}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Email: ${apiData.email}',
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Text(
                          'Body: ${apiData.body}',
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
