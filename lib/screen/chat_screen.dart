import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunday_training/core/style_text.dart';
import 'package:sunday_training/model/chat_riide_model.dart';
import 'package:sunday_training/screen/invit_screen.dart';
import 'package:sunday_training/screen/welcome_page.dart';
import 'package:sunday_training/service/chat_riide_service.dart';

class ChatScreen extends StatelessWidget {
  List<ChatRiideModel> search = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomePage()));
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 30,
            )),
        backgroundColor: Colors.grey[200],
        title: Center(
          child: Text(
            "Invite Friends",
            style: first,
          ),
        ),
        actions: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Icon(Icons.delete_outline_outlined),
          )
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: ChatServiceImpl().getChat(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ChatRiideModel> chat =
                    snapshot.data as List<ChatRiideModel>;
                search = chat;
                return StatefulBuilder(builder: (context, refresh) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 300,
                              child: TextField(
                                onChanged: (value) {
                                  search = [];
                                  refresh(() {
                                    chat.forEach(
                                      (element) {
                                        if (element.name.contains(value)) {
                                          search.add(element);
                                        }
                                      },
                                    );
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              )),
                          Icon(Icons.search),
                        ],
                      ),
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                            itemCount: chat.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Image.network(chat[index].image),
                                title: Text(
                                  chat[index].name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400),
                                ),
                                subtitle: Text(chat[index].message,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w200)),
                              );
                            }),
                      )
                    ],
                  );
                });
              } else {
                return Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 300,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Icon(Icons.search)
                      ],
                    ),
                    LinearProgressIndicator()
                  ],
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => InvitScreen()));
        },
        child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(color: Colors.white),
            child: Icon(Icons.add)),
      ),
    );
  }
}
