import 'package:flutter/material.dart';
import 'package:messengerish/global.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black45),
        iconTheme: IconThemeData(color: Colors.black45),
        title: Text("Chat"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: friendsList.length,
        itemBuilder: (ctx, i) {
          return Column(
            children: <Widget>[
              ListTile(
                isThreeLine: true,
                onTap: () => Navigator.of(context).pushNamed('chat'),
                leading: Container(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage(friendsList[i]['imgUrl']),
                  ),
                ),
                title: Text(
                  "${friendsList[i]['username']}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${friendsList[i]['lastMsg']}"
                ),
                trailing: Container(
                  width: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text("${friendsList[i]['lastMsgTime']}"),
                      SizedBox(
                        height: 5.0,
                      ),
                      friendsList[i]['hasUnSeenMsgs']
                          ? Container(
                              alignment: Alignment.center,
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: myGreen,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                "${friendsList[i]['unseenCount']}",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ),
              Divider()
            ],
          );
        },
      ),
    );
  }
}
