import 'package:flutter/material.dart';
import 'package:foodkiosk/screens/order_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:foodkiosk/providers/shopping_cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:foodkiosk/main.dart';

class FinalPageScreen extends StatefulWidget {
  const FinalPageScreen({Key? key}) : super(key: key);

  @override
  _FinalPageScreenState createState() => _FinalPageScreenState();
}

class _FinalPageScreenState extends State<FinalPageScreen> {
  late String paymentmethod;

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingCart>(builder: (context, provider, child) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        child: Scaffold(
            backgroundColor: Colors.yellow,
            body: Center(
              child: Container(
                height: 80.h,
                width: 70.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.h,
                      width: 10.h,
                    ),
                    Text(
                        "Your payment using ${provider.newpaymentmethod} is successful. Thank you & please enjoy your ${provider.newordermethod}. ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 14.sp,
                        )),
                    Container(
                      height: 10.h,
                      width: 50.h,
                      child: Icon(
                        Icons.check_circle_outline_outlined,
                        size: 10.w,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            )),
      );
    });
  }
}
