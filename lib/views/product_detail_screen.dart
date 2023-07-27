import 'package:alippo_assignment/constants/app_colors.dart';
import 'package:alippo_assignment/models/product_list.dart';
import 'package:alippo_assignment/network/api_interface.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailScreen extends StatefulWidget {
  final int
      productID; //I COULD ALSO PAS THE WHOLE MODEL BUT I INSTEAD HITTING THE API TO GET DATA

  const ProductDetailScreen({super.key, required this.productID});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Products product = Products();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    ApiInterface()
        .getProductItem(
            context: context,
            productId: widget.productID,
            onFail: (error) {
              setState(() {
                isLoading = true;
              });
            })
        .then((value) {
      setState(() {
        product = Products.fromJson(value);
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.themecolor,
        title: Text(
          "Product Details",
          style: GoogleFonts.manrope(
              textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.whiteText)),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                CarouselSlider.builder(
                  itemCount: product.images!.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    child: Image.network(product.images![itemIndex]),
                  ),
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        product.title!.toString(),
                        style: GoogleFonts.manrope(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackText2)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Brand :",
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey1)),
                          ),
                          Text(
                            product.brand!,
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackText2)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Category :",
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey1)),
                          ),
                          Text(
                            product.category!,
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackText2)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        product.description!.toString(),
                        style: GoogleFonts.manrope(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.grey1)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: product.rating!,
                            itemSize: 25,
                            minRating: 0.1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            ignoreGestures: true,
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Text("(${product.rating})")
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("-${product.discountPercentage!}%",
                              style: GoogleFonts.manrope(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.red))),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                              "₹${product.price! - ((product.price! * product.discountPercentage!) / 100).round()}",
                              style: GoogleFonts.manrope(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.themecolor))),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "MRP",
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey1)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "₹${product.price!.toString()}",
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey1)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Stock Available: ",
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey1)),
                          ),
                          Text(
                            "${product.stock!.toString()} Pieces",
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackText2)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
