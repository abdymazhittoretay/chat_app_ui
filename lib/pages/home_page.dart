import 'package:chat_app_ui/models/message_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

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
      body: Column(
        children: [
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        hintText: "Type your message here",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(40.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(40.0))),
                  )),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(40.0)),
                      child: IconButton(
                          onPressed: () {
                            if (_controller.text.isNotEmpty) {
                              setState(() {
                                messages.add(MessageModel(
                                    text: _controller.text,
                                    dateTime: DateTime.now(),
                                    isSentByMe: true));
                                _controller.clear();
                              });
                            }
                          },
                          icon: Icon(
                            Icons.send,
                            color: Colors.white,
                          )))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
