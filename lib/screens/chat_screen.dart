import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_progress/widgets/widgets.dart';
import 'package:profanity_filter/profanity_filter.dart';

class ChatScreen extends StatefulWidget {

  final String chatId;
  final String user;

  const ChatScreen({Key key, this.chatId, this.user})
      : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textInput = new TextEditingController();

  @override
  void initState() {
    super.initState();

  }

  Future sendMessage(String message) async {
    final filter = ProfanityFilter(); //Creates filter with default list.
    
    textInput.clear();
    await Firestore.instance.collection("messages").add({
      'sender': widget.user,
      'message': filter.censorString(message),
      'chatid': widget.chatId,
      'date': DateTime.now().millisecondsSinceEpoch.toString()
    });
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  ScrollController scrollController = ScrollController();

  Future<void> callback() async {
    print(widget.user);
    if (textInput.text.length > 0) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MyCircleAvatar(
              imgUrl: 'https://identicons.github.com/jasonlong.png',
            ),
            SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Cinco Ranch High School",
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  "Online",
                  style: Theme.of(context).textTheme.subtitle2.apply(
                    color: Colors.orangeAccent,
                  ),
                )
              ],
            )
          ],
        ),
        actions: [IconButton(icon: Icon(Icons.more_horiz),)],
      ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Column(
              children: <Widget>[
                Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance
                          .collection("messages")
                          .orderBy("date")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return Center(
                            child: CircularProgressIndicator(),
                          );

                        List<DocumentSnapshot> docs = snapshot.data.documents;

                        List<Widget> messages = new List<Widget>();

                        for (DocumentSnapshot d in docs) {
                          if (d.data['chatid'] == widget.chatId) {
                            if (d.data['sender'] == widget.user) {
                              messages.add(SentMessageWidget(
                                message: d.data["message"],
                              ));
                            } else {
                              messages.add(ReceivedMessagesWidget(
                                  message: d.data["message"]));
                            }
                          }
                        }
                        return ListView(
                          controller: scrollController,
                          children: messages,
                        );
                      },
                    )),
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
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: textInput,
                                  decoration: InputDecoration(
                                      hintText: "Type Something...",
                                      border: InputBorder.none),
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.send),
                                  onPressed: () {
                                    sendMessage(textInput.text);
                                  }),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                    ],
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
