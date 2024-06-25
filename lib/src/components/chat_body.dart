import 'package:chatbot/src/constants.dart';
import 'package:chatbot/src/data/models/ChatMessage.dart';
import 'package:flutter/material.dart';

import 'chat_input_field.dart';
import 'message.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: ListView.builder(
                itemCount: demeChatMessages.length,
                itemBuilder: (context, index) =>
                    Message(message: demeChatMessages[index]),
              ),
            ),
          ),
        ),
        const ChatInputField(),
      ],
    );
  }
}
