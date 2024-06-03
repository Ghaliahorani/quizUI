import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunday_training/core/style_text.dart';
import 'package:sunday_training/main.dart';
import 'package:sunday_training/screen/chat_screen.dart';

import '../core/config/get_it_config.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 130),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "r",
                    style: first,
                  ),
                  Text(
                    "ii",
                    style: secound,
                  ),
                  Text(
                    "de",
                    style: first,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 34),
                child: Text(
                  "Welcome to RIIDE",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    onChanged: (username) {
                      core
                          .get<SharedPreferences>()
                          .setString(username, username);
                    },
                    decoration: InputDecoration(
                        label: Text(
                          "USER NAME",
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                      controller: password,
                      decoration: InputDecoration(
                          labelText: "PASSWORD",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Remember me"), Text("Forgot Password")],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatScreen()));
                },
                child: Container(
                  width: 400,
                  height: 58,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Color(0xFF4CE5B1)),
                  child: Center(
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 14),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
