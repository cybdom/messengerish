import 'package:flutter/material.dart';
import 'package:messengerish/global.dart';

import 'messageWidget.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(backgroundImage: NetworkImage("${friendsList[0]['imgUrl']}")),
            SizedBox(width: 5),
            Text(
              "Cybdom Tech",
              style: TextStyle(color: Colors.black),
              overflow: TextOverflow.clip,
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: messages.length,
              itemBuilder: (ctx, i) {
                if (messages[i]['status'] == MessageType.received) {
                  return MessageWidget(i: i, isASendMessage: false,);
                } else {
                  return MessageWidget(i: i, isASendMessage: true,);
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            height: 61,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 5,
                            color: Colors.grey)
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 10.0,),
                        Expanded(
                          child: TextField(
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                hintText: "Type Something...",
                                border: InputBorder.none),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.attach_file, color: Colors.grey,),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  decoration: BoxDecoration(
                      color: myGreen, shape: BoxShape.circle),
                  child: IconButton(icon: Icon(Icons.send, color: Colors.white,), onPressed: null))
              ],
            ),
          )
        ],
      ),
    );
  }
}