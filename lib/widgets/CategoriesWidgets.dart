import 'package:flutter/material.dart';
import 'package:shop_app/theme.dart';

class CategoriesWidgets extends StatefulWidget {
  const CategoriesWidgets({super.key});

  @override
  State<CategoriesWidgets> createState() => _CategoriesWidgetsState();
}

class _CategoriesWidgetsState extends State<CategoriesWidgets> {
  List<String> categoriesList = [
    "Electronics",
    "Home & Kitchen",
    "Gift Cards",
    "Grocery & Gourmet Food",
    "Computer"
  ];

  int seleceted = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < categoriesList.length; i++)
            InkWell(
              onTap: () => setState(() => seleceted = i),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: seleceted == i
                        ? MyTheme.primaryColor
                        : MyTheme.widgetColor,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: seleceted == i
                        ? [
                            BoxShadow(
                                color: MyTheme.primaryColor, blurRadius: 6)
                          ]
                        : []),
                child: Text(
                  categoriesList[i],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: seleceted == i
                        ? MyTheme.backgroundColor
                        : MyTheme.textColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
