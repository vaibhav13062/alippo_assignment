import 'package:alippo_assignment/constants/app_colors.dart';
import 'package:alippo_assignment/database/database_keys.dart';
import 'package:alippo_assignment/database/local_data.dart';
import 'package:alippo_assignment/network/api_interface.dart';
import 'package:alippo_assignment/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/product_list.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<Products> producst = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var modelList = LocalData.getStringList(DatabaseKeys().FAV_IDS);

    for (var val in modelList) {
      ApiInterface()
          .getProductItem(
              context: context, productId: int.parse(val), onFail: () {})
          .then((value) {
        Products products = Products.fromJson(value);
        setState(() {
          producst.add(products);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.themecolor,
        title: Text(
          "Favourites",
          style: GoogleFonts.manrope(
              textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.whiteText)),
        ),
      ),
      body: ListView.separated(
        itemCount: producst.length,
        itemBuilder: (itemBuilder, index) {
          return ProductItem(product: producst[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}
