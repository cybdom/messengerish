import 'package:flutter/material.dart';
import 'package:messengerish/global.dart';

class MessageWidget extends StatelessWidget {
  final int i;
  final bool isASendMessage;
  const MessageWidget({Key key,@required this.i, @required this.isASendMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isASendMessage)
      return _SentMessageWidget(i: i,key: key);
    return _ReceivedMessagesWidget(i: i,key: key);
  }
  
}

class _ReceivedMessagesWidget extends StatelessWidget {
  final int i;
  const _ReceivedMessagesWidget({
    Key key,
    @required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(backgroundImage: NetworkImage("${messages[i]['contactImgUrl']}")),
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .6),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Color(0xfff9f9f9),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Text(
              "${messages[i]['message']}",
            ),
          ),
          SizedBox(width: 5),
          Text(
            "${messages[i]['time']}",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)
          ),
        ],
      ),
    );
  }
}

class _SentMessageWidget extends StatelessWidget {
  final int i;
  const _SentMessageWidget({
    Key key,
    this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            "${messages[i]['time']}",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)
          ),
          SizedBox(width: 5),
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .6),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Color(0xff4bb17b),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            child: Text(
              "${messages[i]['message']}",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
