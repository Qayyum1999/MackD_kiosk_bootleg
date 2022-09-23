import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:foodkiosk/providers/shopping_cart_provider.dart';
import 'package:provider/provider.dart';

class PaymentMethodScreen extends StatelessWidget {
  late String paymentmethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Select payment method",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 14.sp,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(70.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 15.h,
                    width: double.infinity,
                    child: Consumer<ShoppingCart>(
                      builder: (context, provider, child) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(2.w, 2.h, 2.w, 2.h),
                          child: TextButton.icon(
                            onPressed: () {
                              // Navigator.pop(context);
                              paymentmethod = "Card";
                              provider.paymentmethodprovider(paymentmethod);
                              Navigator.pushNamed(context, '/fifth');
                            },
                            icon: Icon(
                              Icons.payment_rounded,
                              size: 10.sp,
                            ),
                            label: Text(
                              "Credit/Debit Card",
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.black),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(2.h),
                                        ),
                                        side: BorderSide(
                                          width: (0.4).w,
                                          color: Colors.black,
                                        )))),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 15.h,
                    width: double.infinity,
                    child: Consumer<ShoppingCart>(
                      builder: (context, provider, child) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(2.w, 2.h, 2.w, 2.h),
                          child: TextButton.icon(
                            onPressed: () {
                              // Navigator.pop(context);
                              paymentmethod = "QR Code";
                              provider.paymentmethodprovider(paymentmethod);
                              Navigator.pushNamed(context, '/fifth');
                            },
                            icon: Icon(
                              Icons.qr_code_scanner_rounded,
                              size: 10.sp,
                            ),
                            label: Text(
                              "QR Code",
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.black),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(2.h),
                                        ),
                                        side: BorderSide(
                                          width: (0.4).w,
                                          color: Colors.black,
                                        )))),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 15.h,
                    width: double.infinity,
                    child: Consumer<ShoppingCart>(
                      builder: (context, provider, child) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(2.w, 2.h, 2.w, 2.h),
                          child: TextButton.icon(
                            onPressed: () {
                              // Navigator.pop(context);
                              paymentmethod = "Cash";
                              provider.paymentmethodprovider(paymentmethod);
                              Navigator.pushNamed(context, '/fifth');
                            },
                            icon: Icon(
                              Icons.payments_sharp,
                              size: 10.sp,
                            ),
                            label: Text(
                              "Cash",
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.black),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(2.h),
                                        ),
                                        side: BorderSide(
                                          width: (0.4).w,
                                          color: Colors.black,
                                        )))),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: 20.sp,
                ),
                onTap: () {
                  // Navigate to the second screen using a named route.
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
