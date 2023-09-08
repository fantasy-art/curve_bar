import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  double ratingx = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('تقييم البرنامج', style: TextStyle(fontSize: 25)),
        const SizedBox(height: 10),
        RatingBar.builder(
          initialRating: ratingx,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            //print(rating);
            setState(() {
              ratingx = rating;
            });
          },
        ),
        Text(ratingx.toString()),
        const SizedBox(height: 30),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, foregroundColor: Colors.black),
            onPressed: () {
              print(ratingx);
            },
            child: const Text('إرسال')),
      ],
    );
  }
}
