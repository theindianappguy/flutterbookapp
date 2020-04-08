import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {

  final int rating;
  StarRating({@required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.star, color: rating >= 1 ? Color(0xffFFCE00):Color(0xffBDC3C7), size: 18,),
        Icon(Icons.star, color: rating >= 2 ? Color(0xffFFCE00):Color(0xffBDC3C7), size: 18,),
        Icon(Icons.star, color: rating >= 3 ? Color(0xffFFCE00):Color(0xffBDC3C7), size: 18,),
        Icon(Icons.star, color: rating >= 4 ? Color(0xffFFCE00):Color(0xffBDC3C7), size: 18,),
        Icon(Icons.star, color: rating == 5 ? Color(0xffFFCE00):Color(0xffBDC3C7), size: 18,)
      ],
    );
  }
}
