import 'package:flutter/material.dart';
import 'package:foodkiosk/main.dart';
import 'package:foodkiosk/screens/cart_screen.dart';
import 'package:foodkiosk/screens/menu_screen.dart';
import 'package:foodkiosk/providers/shopping_cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:foodkiosk/model/product_model.dart';

class Menuitem extends StatelessWidget {
  Menuitem({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Image.asset(
                choice.imageUrl,
                height: 20.h,
                width: 20.h,
              ),
            ),
            Text(
              choice.title,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "RM${choice.price}",
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 230, 146, 36),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
