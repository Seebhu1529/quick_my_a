import 'package:flutter/material.dart';

class NotificationItmes extends StatelessWidget {
  const NotificationItmes({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //color: Colors.grey[350],
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.all(10),
              child: const Text(
                "New",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF4C53A5),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              color: Colors.white,
              child: const ListTile(
                isThreeLine: false,
                title: Text(
                  "50% off on your first order",
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  "Just Now",
                  style: TextStyle(fontSize: 15),
                ),
                trailing: Icon(Icons.more_horiz),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/3.jpeg'),
                ),
              ),
            ),
            Container(
              // height: 700,
              color: Colors.white,
              // padding: EdgeInsets.all(10),
              // margin: EdgeInsets.only(top: 10),
              //   width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(9),
                        child: const Text(
                          "Earlier",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF4C53A5),
                              fontWeight: FontWeight.bold),
                        )),
                    Container(
                      color: Colors.white,
                      child: const ListTile(
                        isThreeLine: false,
                        title: Text(
                          "One Step Ahead With New Collection of ladies sandels",
                          style: TextStyle(fontSize: 16),
                        ),
                        subtitle: Text(
                          "Tue at 12:54 AM",
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Icon(Icons.more_horiz),
                        leading: CircleAvatar(
                          radius: 30,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              'assets/images/delivered2.png',
                            ),
                          ),
                          // backgroundImage: AssetImage('assets/images/dp.jpeg'),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: const ListTile(
                        isThreeLine: false,
                        title: Text(
                          "80% Off On men Leather Wallet Addidas",
                          style: TextStyle(fontSize: 16),
                        ),
                        subtitle: Text(
                          "Mar 23 at 5:46 PM",
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Icon(Icons.more_horiz),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/2.jpeg'),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: const ListTile(
                        isThreeLine: false,
                        title: Text(
                          "Buy One and Get one free Ladies purse of Rebook",
                          style: TextStyle(fontSize: 16),
                        ),
                        subtitle: Text(
                          "Mar 22 at 10:40 PM",
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Icon(Icons.more_horiz),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/5.jpeg'),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        isThreeLine: false,
                        title: const Text(
                          "20% off on Men T-Shirt with first order",
                          style: TextStyle(fontSize: 16),
                        ),
                        subtitle: const Text(
                          "Mar 22 at 10:40 PM",
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: const Icon(Icons.more_horiz),
                        leading: Container(
                            child: const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/6.jpg'),
                        )),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        isThreeLine: false,
                        title: const Text(
                          " Your order has been shipped",
                          style: TextStyle(fontSize: 16),
                        ),
                        subtitle: const Text(
                          "Feb 25 at 1:45 AM",
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: const Icon(Icons.more_horiz),
                        leading: Container(
                          child: const Icon(Icons.local_shipping_outlined,
                              size: 50),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        isThreeLine: false,
                        title: const Text(
                          "Specaial Offer for you on Boys Shoes with first order",
                          style: TextStyle(fontSize: 16),
                        ),
                        subtitle: const Text(
                          "Feb 17 at 11:27 AM",
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: const Icon(Icons.more_horiz),
                        leading: Container(
                            child: const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/7.jpeg'),
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ]),
            ),
            ElevatedButton(
              onPressed: () {
                print("clicked on previous notifications button");
              },
              style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF4C53A5),
                  backgroundColor: Colors.grey[350]),
              child: const Text(
                "See previous notifications",
                style: TextStyle(fontSize: 23),
              ),
            ),
            const SizedBox(
              height: 500,
            ),
          ],
        ),
      ),
    );
  }
}
