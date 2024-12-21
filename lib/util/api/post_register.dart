import 'package:flutter/material.dart';

class PostRegisterScreen extends StatefulWidget {
  const PostRegisterScreen({super.key});

  @override
  State<PostRegisterScreen> createState() => _PostRegisterScreenState();
}

class _PostRegisterScreenState extends State<PostRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Email",
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Email",
            ),
          ),
        ],
      ),
    );
  }
}
