import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunday_training/core/style_text.dart';

class InvitScreen extends StatelessWidget {
  const InvitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.grey[400],
          leading: Icon(Icons.arrow_back_ios),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset("assets/images/image1.png").image)),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                  child: Text(
                "Invite Friends",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                  child: Text(
                "code and earn \$RIIDE and/or free rides.",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              )),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: TextField(
                  decoration: InputDecoration(
                      helperText: "Share your invite code",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ))),
            ),
            Container(
              width: 400,
              height: 58,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Color(0xFF4CE5B1)),
              child: Center(
                child: Text(
                  "Invite Friends",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 14),
                ),
              ),
            )
          ],
        ));
  }
}
