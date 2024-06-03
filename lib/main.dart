import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunday_training/model/chat_riide_model.dart';
import 'package:sunday_training/screen/chat_screen.dart';
import 'package:sunday_training/screen/invit_screen.dart';
import 'package:sunday_training/screen/welcome_page.dart';
import 'package:sunday_training/service/chat_riide_service.dart';

void main() {
  runApp(app());
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}
