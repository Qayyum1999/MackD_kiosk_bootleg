import 'package:flutter/material.dart';
import 'package:foodkiosk/screens/finalpage_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:foodkiosk/providers/shopping_cart_provider.dart';
import 'package:foodkiosk/screens/order_screen.dart';
import 'package:foodkiosk/screens/payment_screen.dart';

import 'package:foodkiosk/responsive/desktopscreen/menu_desktop.dart';
import 'package:foodkiosk/responsive/tabletscreen/menu_tablet.dart';
import 'package:foodkiosk/responsive/mobilescreen/menu_mobile.dart';

import 'package:foodkiosk/responsive/desktopscreen/cart_desktop.dart';
import 'package:foodkiosk/responsive/tabletscreen/cart_tablet.dart';
import 'package:foodkiosk/responsive/mobilescreen/cart_mobile.dart';

import 'package:foodkiosk/responsive/responsive_layout.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => ShoppingCart()), //CART
//       ],
//       child: MyApp(),
//     ),
//   );
// }

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ShoppingCart(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
            useInheritedMediaQuery: true,
            title: "Food Ordering App",
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: GoogleFonts.varelaRoundTextTheme(),
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              // When navigating to the "/" route, build the FirstScreen widget.
              '/': (context) => OrderMethod(),
              // When navigating to the "/second" route, build the SecondScreen widget.
              '/second': (context) => ResponsiveLayout(
                    mobileBody: MenuScreenMobile(),
                    tabletBody: MenuScreenTablet(),
                    mediumtabletBody: MenuScreenMediumTablet(),
                    largetabletBody: MenuScreenLargeTablet(),
                    desktopBody: MenuScreenDesktop(),
                  ),

              '/third': (context) => ResponsiveLayout(
                    mobileBody: CartlistScreenMobile(),
                    tabletBody: CartListScreenTablet(),
                    mediumtabletBody: CartListScreenTabletMedium(),
                    largetabletBody: CartListScreenTabletMedium(),
                    desktopBody: CartListScreenDesktop(),
                  ),

              '/fourth': (context) => PaymentMethodScreen(),

              '/fifth': (context) => FinalPageScreen(),
            });
      },
    );
  }
}
