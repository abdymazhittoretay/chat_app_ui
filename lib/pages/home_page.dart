import 'package:chat_app_ui/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

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
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: GroupedListView<MessageModel, DateTime>(
                reverse: true,
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                floatingHeader: true,
                elements: messages,
                groupBy: (message) => DateTime(message.dateTime.year,
                    message.dateTime.month, message.dateTime.day),
                groupHeaderBuilder: (MessageModel message) => SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Card(
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${message.dateTime.day} ${message.dateTime.month} ${message.dateTime.year}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                itemBuilder: (context, MessageModel message) {
                  return Align(
                    alignment: message.isSentByMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Card(
                      color: Colors.white,
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(message.text),
                      ),
                    ),
                  );
                },
              ),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                              FocusScope.of(context).unfocus();
                            }
                          },
                          icon: Icon(
                            Icons.send,
                            color: Colors.white,
                          )))
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
