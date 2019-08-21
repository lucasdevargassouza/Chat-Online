import 'package:chat_online/share/services/firebase_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  TextEditingController _msgToSend = TextEditingController();
  bool _isComposing = false;

  _handleSubmitted(text) async {
    await ensureLoggedIn();
    sendMessage(text: text);

    _msgToSend.clear();
    setState(() {
     _isComposing = false; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: Theme.of(context).platform == TargetPlatform.iOS
            ? BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey[200])),
              )
            : null,
        child: Row(
          children: <Widget>[
            Container(
              child: IconButton(
                icon: Icon(Icons.photo_camera),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: TextField(
                controller: _msgToSend,
                decoration: InputDecoration(hintText: "Enviar uma mensagem..."),
                onChanged: (text) {
                  setState(() {
                    _isComposing = text.replaceAll(' ', '').length > 0;
                  });
                },
                onSubmitted: (text) {
                  _handleSubmitted(text);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Theme.of(context).platform == TargetPlatform.iOS
                  ? CupertinoButton(
                      child: Text("Enviar"),
                      onPressed: _isComposing ? () { _handleSubmitted(_msgToSend.text); } : null,
                    )
                  : IconButton(
                      icon: Icon(Icons.send),
                      onPressed: _isComposing ? () { _handleSubmitted(_msgToSend.text); } : null,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

