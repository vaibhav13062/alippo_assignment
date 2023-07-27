import 'package:alippo_assignment/constants/app_colors.dart';
import 'package:alippo_assignment/database/database_keys.dart';
import 'package:alippo_assignment/database/local_data.dart';
import 'package:alippo_assignment/main.dart';
import 'package:alippo_assignment/models/product_list.dart';
import 'package:alippo_assignment/providers/get_cart_provider.dart';
import 'package:alippo_assignment/providers/get_products_provider.dart';
import 'package:alippo_assignment/views/cart_detail_screen.dart';
import 'package:alippo_assignment/views/favorite_screen.dart';
import 'package:alippo_assignment/views/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<GetProductsList>(context, listen: false)
        .fetchInitialData(context);
    Provider.of<GetCartProvider>(context, listen: false)
        .fetchInitialData(context);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  navigatorKey.currentState!
                      .push(MaterialPageRoute(builder: (builder) {
                    return FavouriteScreen();
                  })).then((value) {
                    Provider.of<GetProductsList>(context, listen: false)
                        .fetchInitialData(context);
                    Provider.of<GetCartProvider>(context, listen: false)
                        .fetchInitialData(context);
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                ))
          ],
          backgroundColor: AppColors.themecolor,
          title: Text(
            "Alippo Assignment",
            style: GoogleFonts.manrope(
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.whiteText)),
          ),
        ),
        body: const SafeArea(
            child: Column(
          children: [
            TabBar(tabs: [
              Tab(
                text: "Products",
              ),
              Tab(
                text: "Carts",
              )
            ]),
            Expanded(child: TabBarView(children: [ProductsView(), CartView()]))
          ],
        )),
      ),
    );
  }
}

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        if (!Provider.of<GetCartProvider>(context, listen: false).isLoading &&
            Provider.of<GetCartProvider>(context, listen: false)
                    .cartList
                    .carts!
                    .length <
                Provider.of<GetCartProvider>(context, listen: false)
                    .cartList
                    .total!) {
          Provider.of<GetCartProvider>(context, listen: false)
              .fetchContinuationData(context);
          // Perform event when user reach at the end of list (e.g. do Api call)
        }
      }
    });

    return Container(
      child: Provider.of<GetCartProvider>(context).isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      controller: scrollController,
                      itemCount: Provider.of<GetCartProvider>(context)
                          .cartList
                          .carts!
                          .length,
                      itemBuilder: (itemBuilder, index) {
                        var cart = Provider.of<GetCartProvider>(context)
                            .cartList
                            .carts![index];
                        return InkWell(
                          onTap: () {
                            navigatorKey.currentState!
                                .push(MaterialPageRoute(builder: (builder) {
                              return CartDetailScreen(cartID: cart.id!);
                            }));
                          },
                          child: Container(
                              clipBehavior: Clip.hardEdge,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(2, -3),
                                      blurRadius: 3,
                                      color: AppColors.shadowWhite),
                                  BoxShadow(
                                      offset: const Offset(-2, 4),
                                      blurRadius: 4,
                                      color: AppColors.shadowDark),
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Cart ID: ${cart.id!}",
                                          style: GoogleFonts.manrope(
                                              textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800,
                                                  color:
                                                      AppColors.blackText2))),
                                      Text("User ID: ${cart.userId!}",
                                          style: GoogleFonts.manrope(
                                              textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800,
                                                  color:
                                                      AppColors.blackText2))),
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
                                        return Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  "${cart.products![index2].title!}(₹${cart.products![index2].price}) X ${cart.products![index2].quantity!}",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.manrope(
                                                      textStyle: const TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors
                                                              .blackText2))),
                                            ),
                                            Text(
                                                "₹${cart.products![index2].total!}",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.manrope(
                                                    textStyle: const TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors
                                                            .blackText2))),
                                          ],
                                        );
                                      }),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("MRP :",
                                          style: GoogleFonts.manrope(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      AppColors.blackText2))),
                                      Text("₹${cart.total!}",
                                          style: GoogleFonts.manrope(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      AppColors.blackText2))),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Discount :",
                                          style: GoogleFonts.manrope(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      AppColors.blackText2))),
                                      Text(
                                          "- ₹${cart.total! - cart.discountedTotal!}",
                                          style: GoogleFonts.manrope(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.red))),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total :",
                                          style: GoogleFonts.manrope(
                                              textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800,
                                                  color:
                                                      AppColors.blackText2))),
                                      Text("₹${cart.discountedTotal!}",
                                          style: GoogleFonts.manrope(
                                              textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800,
                                                  color:
                                                      AppColors.themecolor))),
                                    ],
                                  )
                                ],
                              )),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    ),
                  ),
                  Visibility(
                      visible:
                          Provider.of<GetCartProvider>(context).partLoading,
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const CircularProgressIndicator()))
                ],
              ),
            ),
    );
  }
}

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        if (!Provider.of<GetProductsList>(context, listen: false).isLoading &&
            Provider.of<GetProductsList>(context, listen: false)
                    .productList
                    .products!
                    .length <
                Provider.of<GetProductsList>(context, listen: false)
                    .productList
                    .total!) {
          Provider.of<GetProductsList>(context, listen: false)
              .fetchContinuationData(context);
          // Perform event when user reach at the end of list (e.g. do Api call)
        }
      }
    });

    return Container(
      child: Provider.of<GetProductsList>(context).isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      controller: scrollController,
                      itemCount: Provider.of<GetProductsList>(context)
                          .productList
                          .products!
                          .length,
                      itemBuilder: (itemBuilder, index) {
                        var product = Provider.of<GetProductsList>(context)
                            .productList
                            .products![index];

                        return ProductItem(product: product);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    ),
                  ),
                  Visibility(
                      visible:
                          Provider.of<GetProductsList>(context).partLoading,
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const CircularProgressIndicator()))
                ],
              ),
            ),
    );
  }
}

class ProductItem extends StatefulWidget {
  final Products product;
  const ProductItem({super.key, required this.product});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigatorKey.currentState!.push(MaterialPageRoute(builder: (builder) {
          return ProductDetailScreen(
            productID: widget.product.id!,
          );
        }));
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          boxShadow: [
            BoxShadow(
                offset: const Offset(2, -3),
                blurRadius: 3,
                color: AppColors.shadowWhite),
            BoxShadow(
                offset: const Offset(-2, 4),
                blurRadius: 4,
                color: AppColors.shadowDark),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: Image.network(
                  widget.product.thumbnail!,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title!,
                      style: GoogleFonts.manrope(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackText2)),
                    ),
                    Text(
                      widget.product.description!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.manrope(
                          textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey1)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "₹${(widget.product.price!)}",
                          style: GoogleFonts.manrope(
                              textStyle: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grey1)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${widget.product.discountPercentage!}%",
                          style: GoogleFonts.manrope(
                              textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.red)),
                        )
                      ],
                    ),
                    Text(
                      "₹${widget.product.price! - ((widget.product.price! * widget.product.discountPercentage!) / 100).round()}",
                      style: GoogleFonts.manrope(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.themecolor)),
                    )
                  ],
                )),
            IconButton(
                onPressed: () async {
                  var stringList =
                      LocalData.getStringList(DatabaseKeys().FAV_IDS);

                  if (stringList.contains(widget.product.id!.toString())) {
                    stringList.remove(widget.product.id!.toString());
                  } else {
                    stringList.add(widget.product.id!.toString());
                  }
                  LocalData.saveStringList(DatabaseKeys().FAV_IDS, stringList);
                  setState(() {});

                  print(LocalData.getStringList(DatabaseKeys().FAV_IDS));
                },
                icon: Icon(
                  LocalData.getStringList(DatabaseKeys().FAV_IDS)
                          .contains(widget.product.id!.toString())
                      ? Icons.favorite
                      : Icons.favorite_border_rounded,
                  color: LocalData.getStringList(DatabaseKeys().FAV_IDS)
                          .contains(widget.product.id!.toString())
                      ? Colors.pink
                      : Colors.black54,
                ))
          ],
        ),
      ),
    );
  }
}
