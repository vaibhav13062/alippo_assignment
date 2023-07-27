import 'package:alippo_assignment/constants/app_colors.dart';
import 'package:alippo_assignment/models/cart_list.dart';
import 'package:alippo_assignment/models/product_list.dart';
import 'package:alippo_assignment/network/api_interface.dart';
import 'package:alippo_assignment/views/product_detail_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class CartDetailScreen extends StatefulWidget {
  final int
      cartID; //I COULD ALSO PAS THE WHOLE MODEL BUT I INSTEAD HITTING THE API TO GET DATA

  const CartDetailScreen({super.key, required this.cartID});

  @override
  State<CartDetailScreen> createState() => _CartDetailScreenState();
}

class _CartDetailScreenState extends State<CartDetailScreen> {
  Carts cart = Carts();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    ApiInterface()
        .getCartItem(
            context: context,
            cartId: widget.cartID,
            onFail: (error) {
              setState(() {
                isLoading = true;
              });
            })
        .then((value) {
      setState(() {
        cart = Carts.fromJson(value);
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
          "Cart Details",
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
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Cart ID: ${cart.id!}",
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.blackText2))),
                        Text("User ID: ${cart.userId!}",
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.blackText2))),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Products :",
                        style: GoogleFonts.manrope(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: AppColors.blackText2))),
                    Divider(),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: cart.products!.length,
                        itemBuilder: (itemBuilder, index2) {
                          var product = cart.products![index2];
                          return InkWell(
                            onTap: () {
                              navigatorKey.currentState!
                                  .push(MaterialPageRoute(builder: (builder) {
                                return ProductDetailScreen(
                                  productID: product.id!,
                                );
                              }));
                            },
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 0),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${product.title!}(₹${product.quantity!}) X ${product.quantity!}",
                                      style: GoogleFonts.manrope(
                                          textStyle: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.blackText2)),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "₹${product.total!}",
                                        style: GoogleFonts.manrope(
                                            textStyle: const TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.grey1)),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "-${product.discountPercentage!}% ",
                                            style: GoogleFonts.manrope(
                                                textStyle: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.red)),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "₹${product.discountedPrice}",
                                            style: GoogleFonts.manrope(
                                                textStyle: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        AppColors.themecolor)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Quantity :",
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackText2))),
                        Text("${cart.totalQuantity!}",
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackText2))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("MRP :",
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackText2))),
                        Text("₹${cart.total!}",
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackText2))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Discount :",
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackText2))),
                        Text("- ₹${cart.total! - cart.discountedTotal!}",
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.red))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total :",
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.blackText2))),
                        Text("₹${cart.discountedTotal!}",
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.themecolor))),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
