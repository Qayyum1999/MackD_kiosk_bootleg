class Choice {
  final String category;
  final String title;
  final String imageUrl;
  final String price;
  late final int? quantity;
  Choice(
      {required this.category,
      required this.title,
      required this.imageUrl,
      required this.price,
      required this.quantity});
}

List<Choice> selectedchoices = <Choice>[];
List<Choice> choices = <Choice>[
  Choice(
    title: "Samurai Meal Burger",
    imageUrl: 'assets/images/combo_meal.png',
    price: '5.00',
    quantity: 1,
    category: 'burgers',
  ),
  Choice(
    title: "Regular McBurger",
    imageUrl: 'assets/images/burgers_and_sandwiches.png',
    price: '5.00',
    quantity: 1,
    category: 'burgers',
  ),
  Choice(
    title: "Mega Beef Burger",
    imageUrl: 'assets/images/double_quarter_pounder.png',
    price: '5.00',
    quantity: 1,
    category: 'burgers',
  ),
  Choice(
    title: "Chicken Burger Happy Meal ",
    imageUrl: 'assets/images/happy_meal.png',
    price: '10.00',
    quantity: 1,
    category: 'burgers',
  ),
  Choice(
    title: "Double Chicken Burger",
    imageUrl: 'assets/images/combo_meal.png',
    price: '5.50',
    quantity: 1,
    category: 'burgers',
  ),
  Choice(
    title: "Burger Ramly",
    imageUrl: 'assets/images/burgers_and_sandwiches.png',
    price: '5.50',
    quantity: 1,
    category: 'burgers',
  ),
  Choice(
    title: "Double Quarter Pounder",
    imageUrl: 'assets/images/double_quarter_pounder.png',
    price: '5.00',
    quantity: 1,
    category: 'burgers',
  ),
  Choice(
    title: "Pepsi",
    imageUrl: 'assets/images/beverages.png',
    price: '10.00',
    category: 'beverages',
    quantity: 1,
  ),
  Choice(
    title: "Sarsi",
    imageUrl: 'assets/images/beverages.png',
    price: '10.00',
    category: 'beverages',
    quantity: 1,
  ),
  Choice(
    title: "Coke",
    imageUrl: 'assets/images/beverages.png',
    price: '5.00',
    quantity: 1,
    category: 'beverages',
  ),
  Choice(
    title: "Samurai Meal Combo",
    imageUrl: 'assets/images/combo_meal.png',
    price: '5.00',
    quantity: 1,
    category: 'promo',
  ),
  Choice(
    title: "Happy Meal Combo",
    imageUrl: 'assets/images/combo_meal.png',
    price: '5.00',
    quantity: 1,
    category: 'promo',
  ),
  Choice(
    title: "Zinger Burger Combo",
    imageUrl: 'assets/images/double_quarter_pounder.png',
    price: '5.00',
    quantity: 1,
    category: 'promo',
  ),
  Choice(
    title: "Coleslaw",
    imageUrl: 'assets/images/bacon_ranch_salad.png',
    price: '5.00',
    quantity: 1,
    category: 'sides',
  ),
  Choice(
    title: "Bacon Ranch Salad",
    imageUrl: 'assets/images/bacon_ranch_salad.png',
    price: '5.00',
    quantity: 1,
    category: 'sides',
  ),
  Choice(
    title: "Sayur Salad",
    imageUrl: 'assets/images/bacon_ranch_salad.png',
    price: '5.00',
    quantity: 1,
    category: 'sides',
  ),
];

// For parsing if use JSON data

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
