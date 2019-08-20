import 'package:chat_online/share/components/chat_message.dart';
import 'package:chat_online/share/components/text_composer.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
          centerTitle: true,
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 40.0,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  ChatMessage(),
                  ChatMessage(),
                  ChatMessage(),
                  ChatMessage(), 
                  ChatMessage(), 
                  ChatMessage(), 
                  ChatMessage(), 
                  ChatMessage(), 
                  ChatMessage(), 
                  ChatMessage(), 
                  ChatMessage(), 
                  ChatMessage(), 
                  ChatMessage(), 
                  ChatMessage(), 
                  ChatMessage(), 
                  ChatMessage(), 
                  ChatMessage(), 
                  ChatMessage(), 
                  ChatMessage(), 
                  ChatMessage(), 
                  ChatMessage(), 
                  ChatMessage(), 
                  ChatMessage(), 
                ],
              ),
            ),
            Divider(
              height: 1.0,
            ),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: TextComposer(),
            ),
          ],
        ),
      ),
    );
  }
}
