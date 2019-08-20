import 'package:flutter/material.dart';

class ChatMessage extends StatefulWidget {
  @override
  _ChatMessageState createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://www.stickees.com/files/avatars/male-avatars/1697-andrew-sticker.png"),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Lucas",
                  style: Theme.of(context).textTheme.subhead,
                ),
                Container(
                  child: Text("Meu teste e msg!"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
