
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:foodkiosk/providers/shopping_cart_provider.dart';
import 'package:provider/provider.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  late String paymentmethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text("Select payment method",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 14.sp,
              )),
          Expanded(
            child: Center(
              child: Container(
                height: 80.h,
                width: 100.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Consumer<ShoppingCart>(
                        builder: (context, provider, child) {
                          return TextButton.icon(
                            onPressed: () {
                              // Navigator.pop(context);
                              paymentmethod = "Card";
                              provider.paymentmethodprovider(paymentmethod);
                              Navigator.pushNamed(context, '/fifth');
                            },
                            icon: Padding(
                              padding: EdgeInsets.only(left: 2.w),
                              child: Icon(
                                Icons.payment_rounded,
                                size: 5.w,
                              ),
                            ),
                            label: Padding(
                              padding: EdgeInsets.fromLTRB(1.w, 2.h, 3.w, 2.h),
                              child: Container(
                                child: Text(
                                  "Credit/Debit Card",
                                  style: TextStyle(
                                      fontSize: 10.sp, color: Colors.black),
                                ),
                              ),
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
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Consumer<ShoppingCart>(
                        builder: (context, methodofpayment, child) {
                          return TextButton.icon(
                            onPressed: () {
                              // Navigator.pop(context);
                              paymentmethod = "QR Code";
                              methodofpayment
                                  .paymentmethodprovider(paymentmethod);
                              Navigator.pushNamed(context, '/fifth');
                            },
                            icon: Padding(
                              padding: EdgeInsets.only(left: 2.w),
                              child: Icon(
                                Icons.qr_code_scanner_rounded,
                                size: 5.w,
                              ),
                            ),
                            label: Padding(
                              padding: EdgeInsets.fromLTRB(1.w, 2.h, 3.w, 2.h),
                              child: Container(
                                child: Text(
                                  "QR Code",
                                  style: TextStyle(
                                      fontSize: 10.sp, color: Colors.black),
                                ),
                              ),
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
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Consumer<ShoppingCart>(
                        builder: (context, provider, child) {
                          return TextButton.icon(
                            onPressed: () {
                              // Navigator.pop(context);
                              paymentmethod = "Cash";
                              provider.paymentmethodprovider(paymentmethod);
                              Navigator.pushNamed(context, '/fifth');
                            },
                            icon: Padding(
                              padding: EdgeInsets.only(left: 2.w),
                              child: Icon(
                                Icons.payments_sharp,
                                size: 5.w,
                              ),
                            ),
                            label: Padding(
                              padding: EdgeInsets.fromLTRB(1.w, 2.h, 3.w, 2.h),
                              child: Container(
                                child: Text(
                                  "Cash",
                                  style: TextStyle(
                                      fontSize: 10.sp, color: Colors.black),
                                ),
                              ),
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
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                      width: 10.h,
                    ),
                    GestureDetector(
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 8.w,
                        ),
                        onTap: () {
                          // Navigate to the second screen using a named route.
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
