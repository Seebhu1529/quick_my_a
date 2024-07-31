import 'package:flutter/material.dart';
import 'package:shop_app/widgets/CartAppBar.dart';
import 'package:shop_app/widgets/CartBottomNavBar.dart';
import 'package:shop_app/widgets/CartItemSample.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const CartAppBar(),
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
            child: Column(
              children: [
                const CartItemSample(),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF4C53A5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Add Coupon Code",
                          style: TextStyle(
                              color: Color(0xFF4C53A5),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CartBottomNavBar(),
    );
  }
}
