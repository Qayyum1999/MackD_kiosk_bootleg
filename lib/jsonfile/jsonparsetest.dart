// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:foodkiosk/jsonfile/ProductDataModel.dart';
// import 'package:flutter/services.dart' as rootBundle;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: FutureBuilder(
//       future: ReadJsonData(),
//       builder: (context, data) {
//         if (data.hasError) {
//           return Center(child: Text("${data.error}"));
//         } else if (data.hasData) {
//           var items = data.data as List<ProductDataModel>;
//           return ListView.builder(
//               itemCount: items == null ? 0 : items.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   elevation: 5,
//                   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                   child: Container(
//                     padding: EdgeInsets.all(8),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           child: Image.asset(
//                             items[index].imageURL.toString(),
//                             height: 28,
//                           ),
//                         ),
//                         Expanded(
//                             child: Container(
//                           padding: EdgeInsets.only(bottom: 8),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(left: 8, right: 8),
//                                 child: Text(
//                                   items[index].name.toString(),
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 8, right: 8),
//                                 child: Text(items[index].price.toString()),
//                               )
//                             ],
//                           ),
//                         ))
//                       ],
//                     ),
//                   ),
//                 );
//               });
//         } else {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     ));
//   }

//   Future<List<ProductDataModel>> ReadJsonData() async {
//     final jsondata =
//         await rootBundle.rootBundle.loadString('jsonfile/productlist.json');
//     final list = json.decode(jsondata) as List<dynamic>;
//     return list.map((e) => ProductDataModel.fromJson(e)).toList();
//   }
// }

// // class ThirdScreen extends StatefulWidget {
// //   const ThirdScreen({Key? key}) : super(key: key);

// //   @override
// //   State<ThirdScreen> createState() => _ThirdScreenState();
// // }

// // class _ThirdScreenState extends State<ThirdScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Color.fromARGB(255, 255, 241, 41),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: Container(
// //               color: Colors.white,
// //               width: double.infinity,
// //               child: SizedBox(
// //                 child: SvgPicture.asset(
// //                   'assets/images/logo.svg',
// //                   height: 10,
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Expanded(
// //             flex: 5,
// //             child: Padding(
// //               padding: const EdgeInsets.all(20.0),
// //               child: ListView(
// //                 children: [
// //                   Column(
// //                     children: <Widget>[
// //                       const Text(
// //                         "Hey",
// //                         // ignore: unnecessary_const
// //                         style: const TextStyle(
// //                           fontSize: 36,
// //                           fontWeight: FontWeight.w900,
// //                         ),
// //                       ),
// //                       const Text(
// //                         "what's up?",
// //                         style: TextStyle(
// //                           fontSize: 36,
// //                         ),
// //                       ),
// //                       const SizedBox(
// //                         height: 32.0,
// //                       ),
// //                       Column(
// //                         crossAxisAlignment: CrossAxisAlignment.stretch,
// //                         children: <Widget>[
// //                           OrderItem(
// //                               imageUrl: 'assets/images/beverages.png',
// //                               name: 'Diet Coke',
// //                               price: r'$ 1.49',
// //                               quantity: 1),
// //                           OrderItem(
// //                               imageUrl: 'assets/images/snacks_and_sides.png',
// //                               name: 'Large Fries',
// //                               price: r'$ 3.98',
// //                               quantity: 2),
// //                           OrderItem(
// //                               imageUrl: 'assets/images/cheeseburger.png',
// //                               name: 'Cheeseburger',
// //                               price: r'$ 2.49',
// //                               quantity: 1),
// //                           OrderItem(
// //                               imageUrl: 'assets/images/chicken.png',
// //                               name: 'Nuggets x10',
// //                               price: r'$ 3.99',
// //                               quantity: 1),
// //                           OrderItem(
// //                               imageUrl: 'assets/images/chicken.png',
// //                               name: 'Nuggets x10',
// //                               price: r'$ 3.99',
// //                               quantity: 1),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           Expanded(
// //             flex: 0,
// //             child: Container(
// //               height: 20,
// //               color: Color.fromARGB(255, 0, 104, 9),
// //               width: double.infinity,
// //             ),
// //           ),
// //           Expanded(
// //             flex: 2,
// //             child: Container(
// //               color: Colors.white,
// //               width: double.infinity,
// //               child: Row(
// //                 crossAxisAlignment: CrossAxisAlignment.end,
// //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                 children: [
// //                   Expanded(
// //                     child: Padding(
// //                       padding: const EdgeInsets.all(8.0),
// //                       child: GestureDetector(
// //                         child: Container(
// //                           height: 50,
// //                           width: 200,
// //                           decoration: BoxDecoration(
// //                             color: const Color(0xFFC8151D),
// //                             borderRadius: const BorderRadius.all(
// //                               Radius.circular(30),
// //                             ),
// //                           ),
// //                         ),
// //                         onTap: () {
// //                           Navigator.pop(context);
// //                         },
// //                       ),
// //                     ),
// //                   ),
// //                   Expanded(
// //                     child: Padding(
// //                       padding: const EdgeInsets.all(8.0),
// //                       child: GestureDetector(
// //                         child: Container(
// //                           height: 50,
// //                           width: 200,
// //                           decoration: BoxDecoration(
// //                             color: Color.fromARGB(255, 21, 200, 45),
// //                             borderRadius: const BorderRadius.all(
// //                               Radius.circular(30),
// //                             ),
// //                           ),
// //                         ),
// //                         onTap: () {
// //                           Navigator.pushNamed(context, '/fourth');
// //                         },
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class CartBody extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: EdgeInsets.fromLTRB(35, 40, 25, 0),
// //       child: Column(
// //         children: <Widget>[
// //           Padding(
// //             padding: const EdgeInsets.symmetric(vertical: 35),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               children: <Widget>[
// //                 Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: <Widget>[
// //                     Text(
// //                       "My",
// //                       style: TextStyle(
// //                         fontWeight: FontWeight.w700,
// //                         fontSize: 35,
// //                       ),
// //                     ),
// //                     Text(
// //                       "Order",
// //                       style: TextStyle(
// //                         fontWeight: FontWeight.w300,
// //                         fontSize: 35,
// //                       ),
// //                     ),
// //                   ],
// //                 )
// //               ],
// //             ),
// //           ),
// //           Expanded(
// //             flex: 1,
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.stretch,
// //               children: <Widget>[
// //                 Expanded(
// //                   flex: 5,
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(20.0),
// //                     child: ListView(
// //                       children: [
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.stretch,
// //                           children: <Widget>[
// //                             OrderItem(
// //                                 imageUrl: 'assets/images/beverages.png',
// //                                 name: 'Diet Coke',
// //                                 price: r'$ 1.49',
// //                                 quantity: 1),
// //                             OrderItem(
// //                                 imageUrl: 'assets/images/snacks_and_sides.png',
// //                                 name: 'Large Fries',
// //                                 price: r'$ 3.98',
// //                                 quantity: 2),
// //                             OrderItem(
// //                                 imageUrl: 'assets/images/cheeseburger.png',
// //                                 name: 'Cheeseburger',
// //                                 price: r'$ 2.49',
// //                                 quantity: 1),
// //                             OrderItem(
// //                                 imageUrl: 'assets/images/chicken.png',
// //                                 name: 'Nuggets x10',
// //                                 price: r'$ 3.99',
// //                                 quantity: 1),
// //                             OrderItem(
// //                                 imageUrl: 'assets/images/chicken.png',
// //                                 name: 'Nuggets x10',
// //                                 price: r'$ 3.99',
// //                                 quantity: 1),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 Expanded(
// //                   flex: 0,
// //                   child: Container(
// //                     height: 20,
// //                     color: Color.fromARGB(255, 0, 104, 9),
// //                     width: double.infinity,
// //                   ),
// //                 ),
// //                 Expanded(
// //                   flex: 2,
// //                   child: Container(
// //                     color: Colors.white,
// //                     width: double.infinity,
// //                     child: Row(
// //                       crossAxisAlignment: CrossAxisAlignment.end,
// //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                       children: [
// //                         Expanded(
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: GestureDetector(
// //                               child: Container(
// //                                 height: 50,
// //                                 width: 200,
// //                                 decoration: BoxDecoration(
// //                                   color: const Color(0xFFC8151D),
// //                                   borderRadius: const BorderRadius.all(
// //                                     Radius.circular(30),
// //                                   ),
// //                                 ),
// //                               ),
// //                               onTap: () {
// //                                 Navigator.pop(context);
// //                               },
// //                             ),
// //                           ),
// //                         ),
// //                         Expanded(
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: GestureDetector(
// //                               child: Container(
// //                                 height: 50,
// //                                 width: 200,
// //                                 decoration: BoxDecoration(
// //                                   color: Color.fromARGB(255, 21, 200, 45),
// //                                   borderRadius: const BorderRadius.all(
// //                                     Radius.circular(30),
// //                                   ),
// //                                 ),
// //                               ),
// //                               onTap: () {
// //                                 Navigator.pushNamed(context, '/fourth');
// //                               },
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class CartScreen extends StatefulWidget {
// //   @override
// //   _CartScreenState createState() => _CartScreenState();
// // }

// // class _CartScreenState extends State<CartScreen> {
// //   final _key = GlobalKey<ScaffoldState>();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       key: _key,
// //       appBar: AppBar(
// //         iconTheme: IconThemeData(color: Colors.black),
// //         backgroundColor: Colors.black,
// //         elevation: 0.0,
// //         title: Text("Shopping Cart"),
// //         leading: IconButton(
// //             icon: Icon(Icons.close),
// //             onPressed: () {
// //               Navigator.pop(context);
// //             }),
// //       ),
// //       backgroundColor: Colors.white,
// //       body: FutureBuilder(
// //         future: ReadJsonData(),
// //         builder: (context, data) {
// //           if (data.hasError) {
// //             return Center(child: Text("${data.error}"));
// //           } else if (data.hasData) {
// //             var items = data.data as List<ProductDataModel>;
// //             return ListView.builder(
// //                 itemCount: items == null ? 0 : items.length,
// //                 itemBuilder: (context, index) {
// //                   return Card(
// //                     elevation: 5,
// //                     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
// //                     child: Container(
// //                       padding: EdgeInsets.all(8),
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         crossAxisAlignment: CrossAxisAlignment.center,
// //                         children: [
// //                           SizedBox(
// //                             child: Image.asset(
// //                               items[index].imageURL.toString(),
// //                               height: 28,
// //                             ),
// //                           ),
// //                           Expanded(
// //                               child: Container(
// //                             padding: EdgeInsets.only(bottom: 8),
// //                             child: Column(
// //                               mainAxisAlignment: MainAxisAlignment.center,
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Padding(
// //                                   padding: EdgeInsets.only(left: 8, right: 8),
// //                                   child: Text(
// //                                     items[index].name.toString(),
// //                                     style: TextStyle(
// //                                         fontSize: 16,
// //                                         fontWeight: FontWeight.bold),
// //                                   ),
// //                                 ),
// //                                 Padding(
// //                                   padding: EdgeInsets.only(left: 8, right: 8),
// //                                   child: Text(items[index].price.toString()),
// //                                 )
// //                               ],
// //                             ),
// //                           ))
// //                         ],
// //                       ),
// //                     ),
// //                   );
// //                 });
// //           } else {
// //             return Center(
// //               child: CircularProgressIndicator(),
// //             );
// //           }
// //         },
// //       ),
// //       bottomNavigationBar: Container(
// //         height: 70,
// //         child: Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: <Widget>[
// //               RichText(
// //                 text: TextSpan(children: [
// //                   TextSpan(
// //                       text: "Total: ",
// //                       style: TextStyle(
// //                           color: Colors.grey,
// //                           fontSize: 22,
// //                           fontWeight: FontWeight.w400)),
// //                   TextSpan(
// //                       text: "CartPrice",
// //                       style: TextStyle(
// //                           color: Colors.white,
// //                           fontSize: 22,
// //                           fontWeight: FontWeight.normal)),
// //                 ]),
// //               ),
// //               Container(
// //                 decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(20),
// //                     color: Colors.white),
// //                 child: TextButton(
// //                   onPressed: () {
// //                     Navigator.pushNamed(context, '/fourth');
// //                   },
// //                   child: Text(
// //                     "Check out",
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Future<List<ProductDataModel>> ReadJsonData() async {
// //     final jsondata =
// //         await rootBundle.rootBundle.loadString('jsonfile/productlist.json');
// //     final list = json.decode(jsondata) as List<dynamic>;
// //     return list.map((e) => ProductDataModel.fromJson(e)).toList();
// //   }
// // }
// class ProductDataModel {
//   //data Type
//   int? id;
//   String? name;
//   String? category;
//   String? imageURL;
//   String? price;

// // constructor
//   ProductDataModel(
//       {this.id, this.name, this.category, this.imageURL, this.price});

//   //method that assign values to respective datatype vairables
//   ProductDataModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     category = json['category'];
//     imageURL = json['imageUrl'];
//     price = json['price'];
//   }
// }
