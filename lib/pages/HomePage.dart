// ignore_for_file: file_names
// Packages
import 'package:flutter/material.dart';
import 'package:shop_app/widgets/HomeAppBar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// Providers
import '../widgets/product_widget.dart';
import '/services/api/api_service.dart';
import '../models/product_search.dart';
import '/theme.dart';
import '/widgets/CategoriesWidgets.dart';
import '../models/product.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // APIService().fetchRecipes();
    APIService.searchData();
    // Future<BestSellersModel> bestSellerData = APIService().bestSellerData();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: APIService.searchData(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(body: Center(child: Text("Loading...")));
          } else {
            return ListView(
              children: [
                HomeAppBar(),
                Container(
                  decoration: BoxDecoration(
                      color: MyTheme.backgroundColor,
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(35))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      searchBar(),
                      titleWidget("Categories"),
                      const CategoriesWidgets(),
                      titleWidget("Best Selling"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: GridView.builder(
                          itemCount: snapshot.data!.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: .9),
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              ProductItemCardViewWidget(
                                  product: snapshot.data![index]),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(),
    );
  }

  Container searchBar() {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      decoration: BoxDecoration(
        color: MyTheme.widgetColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Search
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search Items",
              ),
            ),
          ),
          Icon(
            Icons.camera_alt_rounded,
            size: 25,
            color: MyTheme.subTextColor,
          ),
        ],
      ),
    );
  }

  Row titleWidget(String title) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.all(12),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: MyTheme.textColor,
            ),
          ),
        ),
      ],
    );
  }
  // BottomNavigationBar
  Widget BottomNavigationBar() {
    return CurvedNavigationBar(
      color: MyTheme.primaryColor,
      buttonBackgroundColor: MyTheme.primaryColor,
      backgroundColor: Colors.white,
      height: 60,
      items: <Widget>[
        Icon(Icons.home_outlined, size: 30),
        Icon(Icons.shopping_cart_outlined, size: 30),
        Icon(Icons.search_outlined, size: 30),
        Icon(Icons.people_outline, size: 30),
      ],
      index: 0,
      onTap: (index) {},
    );
  }
}
