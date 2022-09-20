import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:foodkiosk/responsive/mobile_body.dart';

class CategoryItem extends StatefulWidget {
  final String imageUrl;
  final String name;
  CategoryItem({
    required this.imageUrl,
    required this.name,
  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0.5.h)),
          side: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 0.1.h,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              widget.imageUrl,
            ),
            Text(
              widget.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 5.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
