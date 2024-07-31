import 'package:flutter/material.dart';

class Itemwidgets extends StatelessWidget {
  const Itemwidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.60,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 1; i < 8; i++)
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4C53A5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "-50%",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    )
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "asstes/images/5.jpeg",
                    height: 200,
                    width: 200,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                ),
                const Expanded(
                  //height: 1000
                  child: Text(
                    "Apple Watch M20s",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "RS.499/-",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Buy Now",
                            style: TextStyle(
                              fontSize: 5,
                              color: Color(0xFF4C53A5),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 30),
                      ),
                      const Expanded(
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Color(0xFF4C53A5),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 1),
                )
              ],
            ),
          ),
      ],
    );
  }
}
