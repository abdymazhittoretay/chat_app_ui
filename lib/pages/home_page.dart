import 'package:chat_app_ui/models/message_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MessageModel> messages = [
    MessageModel(
        text: "Hey, how are you?",
        dateTime: DateTime(2025, 1, 1, 10, 30),
        isSentByMe: true),
    MessageModel(
        text: "I'm good, thanks! How about you?",
        dateTime: DateTime(2025, 1, 1, 10, 32),
        isSentByMe: false),
    MessageModel(
        text: "I'm doing well. Have you finished the project?",
        dateTime: DateTime(2025, 1, 2, 14, 15),
        isSentByMe: true),
    MessageModel(
        text: "Not yet, but I'm almost done. Just a few tweaks left.",
        dateTime: DateTime(2025, 1, 2, 14, 17),
        isSentByMe: false),
    MessageModel(
        text: "That's great to hear! Need any help?",
        dateTime: DateTime(2025, 1, 3, 9, 5),
        isSentByMe: true),
    MessageModel(
        text: "Thanks, but I think I've got it covered.",
        dateTime: DateTime(2025, 1, 3, 9, 10),
        isSentByMe: false),
    MessageModel(
        text: "Alright, let me know if you change your mind.",
        dateTime: DateTime(2025, 1, 4, 16, 20),
        isSentByMe: true),
    MessageModel(
        text: "Sure, will do. What about your side?",
        dateTime: DateTime(2025, 1, 4, 16, 25),
        isSentByMe: false),
    MessageModel(
        text: "I've completed most of it. Just reviewing now.",
        dateTime: DateTime(2025, 1, 5, 11, 45),
        isSentByMe: true),
    MessageModel(
        text: "Nice! Good luck with the review.",
        dateTime: DateTime(2025, 1, 5, 11, 50),
        isSentByMe: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
    );
  }
}
