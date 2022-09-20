import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodkiosk/screens/finalpage_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:foodkiosk/providers/shopping_cart_provider.dart';
import 'package:foodkiosk/screens/cart_screen.dart';
import 'package:foodkiosk/screens/menu_screen.dart';
import 'package:foodkiosk/screens/order_screen.dart';
import 'package:foodkiosk/screens/payment_screen.dart';

import 'package:sizer/sizer.dart';
import 'package:device_preview/device_preview.dart';

import 'package:foodkiosk/responsive/desktop_body.dart';
import 'package:foodkiosk/responsive/tablet_body.dart';
import 'package:foodkiosk/responsive/mobile_body.dart';
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
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => // Wrap your app
            MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
              useInheritedMediaQuery: true,
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
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
                      tabletBody: CartlistScreenMobile(),
                      mediumtabletBody: CartlistScreenMobile(),
                      largetabletBody: CartlistScreenMobile(),
                      desktopBody: CartListScreenDesktop(),
                    ),

                '/fourth': (context) => PaymentMethodScreen(),

                '/fifth': (context) => FinalPageScreen(),
              });
        },
      ),
    );
  }
}
