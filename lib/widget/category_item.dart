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
    return Padding(
      padding: const EdgeInsets.all(2.0),
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                widget.imageUrl,
                height: 10.h,
                width: 10.h,
              ),
              Text(
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                widget.name,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.sp,
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
