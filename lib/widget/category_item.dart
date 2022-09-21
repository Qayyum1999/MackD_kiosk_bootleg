import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:foodkiosk/responsive/mobilescreen/menu_mobile.dart';

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double responsivetextsize;

  CategoryItem({
    required this.imageUrl,
    required this.name,
    required this.responsivetextsize,
  });

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
          padding: const EdgeInsets.all(5.0),
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
    );
  }
}
