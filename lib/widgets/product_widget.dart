import 'package:flutter/material.dart';

import '../models/product_search.dart';
import '../pages/product_details.dart';
import '../theme.dart';

class ProductItemCardViewWidget extends StatefulWidget {
  final Product product;
  const ProductItemCardViewWidget({super.key, required this.product});

  @override
  State<ProductItemCardViewWidget> createState() =>
      _ProductItemCardViewWidgetState();
}

class _ProductItemCardViewWidgetState extends State<ProductItemCardViewWidget> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => ProductDetails(widget.product),
          ),
        );
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            color: MyTheme.widgetColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: MyTheme.primaryColor,
                  blurRadius: 10,
                  spreadRadius: -7,
                  offset: const Offset(0, 10))
            ]),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1.25,
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.network(
                      widget.product.productPhoto,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.product.productTitle,
                  maxLines: 1,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: MyTheme.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.product.productPrice.toString(),
                  style: TextStyle(
                      color: MyTheme.primaryColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 16),
                )
              ],
            ),
            // Positioned(
            //   right: 0,
            //   child: IconButton(
            //     icon: Icon(
            //       isFavourite ? Icons.favorite : Icons.favorite_border,
            //       size: 30,
            //       color:
            //           isFavourite ? MyTheme.primaryColor : MyTheme.subTextColor,
            //       shadows: isFavourite
            //           ? [BoxShadow(color: MyTheme.primaryColor, blurRadius: 8)]
            //           : [],
            //     ),
            //     onPressed: () {
            //       setState(() {
            //         isFavourite = !isFavourite;
            //         if (isFavourite) {
            //           // MyLocalData().saveFavouriteData(itemData: itemData)
            //         }
            //       });
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
