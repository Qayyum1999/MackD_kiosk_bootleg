import 'package:flutter/material.dart';
import 'package:foodkiosk/main.dart';
import 'package:foodkiosk/providers/shopping_cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:foodkiosk/model/product_model.dart';

class Menuitem extends StatelessWidget {
  Menuitem({Key? key, required this.choice, required this.responsivetextsize})
      : super(key: key);
  final Choice choice;
  final double responsivetextsize;
  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Image.asset(
                  choice.imageUrl,
                  height: 40.h,
                  width: 40.h,
                ),
              ),
              Text(
                choice.title,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: responsivetextsize,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Text(
                "RM${choice.price}",
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: responsivetextsize,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 230, 146, 36),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
