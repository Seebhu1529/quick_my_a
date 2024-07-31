import 'package:flutter/material.dart';
import '/widgets/Notification_Itmes.dart';
import '/widgets/Notification_bar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const NotificationBar(),
          Container(
            // temporary height
            height: 700,
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: const Column(
              children: [
                NotificationItmes(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
