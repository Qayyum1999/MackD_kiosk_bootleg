import 'package:flutter/material.dart';
import 'package:foodkiosk/model/product_model.dart';
import 'package:foodkiosk/providers/shopping_cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:foodkiosk/responsive/mobilescreen/menu_mobile.dart';

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final List<Choice> categorychoice;
  final double responsivetextsize;

  CategoryItem({
    required this.imageUrl,
    required this.name,
    required this.categorychoice,
    required this.responsivetextsize,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingCart>(builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.5.h)),
            side: BorderSide(
              color: Colors.grey.withOpacity(0.2),
              width: 0.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {
                context
                    .read<ShoppingCart>()
                    .categoryselector(categorychoice, name);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.asset(
                    imageUrl,
                    height: 10.h,
                    width: 20.w,
                    scale: 0.0125.sp,
                  ),
                  Text(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: responsivetextsize,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
