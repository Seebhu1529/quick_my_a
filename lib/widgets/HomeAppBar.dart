import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shop_app/theme.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          const Icon(Icons.sort,
            size: 30,
            color: Color(0xFF53AE71),
          ),
          const Padding(padding: EdgeInsets.only(left: 20),
            child: Text("Quick Shop",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF53AE71),
              ),
            ),
          ),
          const Spacer(),
          badges.Badge(
            badgeContent: const Text("3",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, "Cartpage");
              },
              child: const Icon(Icons.shopping_bag_outlined,
                size: 30,
                color: Color(0xFF53AE71),
              ),
            ),
          ),
          const Spacer(),
          badges.Badge(badgeContent: const Text("9",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "Notification");
              },
              child: const Icon(Icons.notifications_outlined,
                size: 30,
                color: Color(0xFF53AE71),
              ),
            ),
          ),

        ],
      ),
    );
  }
}




