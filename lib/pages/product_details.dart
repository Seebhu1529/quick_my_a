// Peckages
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/widgets/custom_button.dart';

// Provider
import '../models/product_details.dart' as productdetails;
import '../services/api/api_service.dart';
import '/models/product_search.dart';
import '/theme.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails(this.product, {super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return FutureBuilder<productdetails.Data?>(
      future: APIService.productDetailData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(body: Center(child: Text("Loading...")));
        } else {
          productdetails.Data product = snapshot.data!;
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        CarouselSlider.builder(
                          itemCount: product.productPhotos!.length,
                          options: CarouselOptions(
                              height: size.height * .45,
                              viewportFraction: 1,
                              autoPlay: true),
                          itemBuilder: (context, index, realIndex) {
                            return Container(
                              padding: const EdgeInsets.all(20),
                              width: size.width,
                              decoration:
                                  BoxDecoration(color: MyTheme.backgroundColor),
                              child: Image.network(
                                product.productPhotos![index],
                                fit: BoxFit.fitHeight,
                                height: size.height * .4,
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text(widget.product.productTitle,
                                  fontSize: 24, isBold: true, bottomPadding: 6),
                              text(widget.product.delivery.toString(),
                                  isPrimaryColor: true, isBold: true),
                              divider(),
                              title('Description'),
                              text(product.productDescription.toString()),
                              divider(),
                              title('About'),
                              for (int i = 0;
                                  i < product.aboutProduct!.length;
                                  i++)
                                text(product.aboutProduct![i],
                                    bottomPadding: 8.0),
                              divider(),
                              title('Specifications'),
                              Container(
                                color: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10),
                                child: Table(
                                  border: TableBorder.all(color: Colors.black),
                                  children: [
                                    tableRow(
                                      'Manufacturer',
                                      product.productInformation?.manufacturer
                                          .toString(),
                                    ),
                                    tableRow(
                                      'Model',
                                      product
                                          .productInformation?.itemModelNumber
                                          .toString(),
                                    ),
                                    tableRow(
                                      'Colour',
                                      product.productInformation?.color
                                          .toString(),
                                    ),
                                    tableRow(
                                      'Storage',
                                      product.productInformation
                                          ?.memoryStorageCapacity
                                          .toString(),
                                    ),
                                    tableRow(
                                      'RAM',
                                      product.productInformation?.ram
                                          .toString(),
                                    ),
                                    tableRow(
                                      'Cameras',
                                      product.productInformation
                                          ?.otherCameraFeatures
                                          .toString(),
                                    ),
                                    tableRow(
                                      'Connectivity',
                                      product.productInformation
                                          ?.connectivityTechnologies
                                          .toString(),
                                    ),
                                    tableRow(
                                      'Battery',
                                      product.productInformation
                                          ?.batteryPowerRating
                                          .toString(),
                                    ),
                                    tableRow(
                                      'Product Dimensions',
                                      product
                                          .productInformation?.productDimensions
                                          .toString(),
                                    ),
                                    tableRow(
                                      'Whats in the box',
                                      product.productInformation?.whatsInTheBox
                                          .toString(),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: MyTheme.backgroundColor.withOpacity(.8),
                          shape: BoxShape.circle),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        color: MyTheme.subTextColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: MyTheme.backgroundColor.withOpacity(.8),
                          shape: BoxShape.circle),
                      child: IconButton(
                        onPressed: () =>
                            setState(() => isFavourite = !isFavourite),
                        icon: Icon(
                          isFavourite ? Icons.favorite : Icons.favorite_border,
                          size: 28,
                          color: isFavourite
                              ? MyTheme.primaryColor
                              : MyTheme.subTextColor,
                          shadows: isFavourite
                              ? [
                                  BoxShadow(
                                      color: MyTheme.primaryColor,
                                      blurRadius: 8)
                                ]
                              : [],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.all(10),
              height: 80,
              width: size.width,
              decoration: BoxDecoration(
                color: MyTheme.widgetColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 20,
                      spreadRadius: 2)
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.productPrice.toString(),
                    style: TextStyle(
                        fontSize: 24,
                        color: MyTheme.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                  CustomButton(
                    text: 'Add Cart',
                    message: "Add to Cart",
                    width: 200,
                    icon: Icons.shopping_cart_outlined,
                    onTap: () {
                      print("Add to Cart");
                    },
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Padding title(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 24,
            color: MyTheme.subTextColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Padding text(
    String text, {
    bool? isBold = false,
    bool? isPrimaryColor = false,
    double? fontSize,
    double? topPadding = 0,
    double? bottomPadding = 0,
    double? leftPadding = 0,
    double? rightPadding = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
          top: topPadding!,
          bottom: bottomPadding!,
          left: leftPadding!,
          right: rightPadding!),
      child: Text(
        text.toString(),
        style: TextStyle(
            fontSize: fontSize ?? 14,
            color:
                isPrimaryColor! ? MyTheme.primaryColor : MyTheme.subTextColor,
            fontWeight: isBold! ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }

  TableRow tableRow(title, value) {
    return TableRow(
        children: [text(title, leftPadding: 6), text(value, leftPadding: 6)]);
  }

  Padding divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 3.0),
      child: Divider(thickness: 2),
    );
  }
}
