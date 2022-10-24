import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomCard2 extends StatelessWidget {
  const CustomCard2({
    Key? key,
    required this.image,
    required this.turfName,
  }) : super(key: key);
  final String image;
  final String turfName;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      
      borderRadius: 20.0,
      height: MediaQuery.of(context).size.height / 3.5,
      width: MediaQuery.of(context).size.width / 2,
      childPadding: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          image: DecorationImage(
            image: NetworkImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark,
                    color: Colors.green,
                  ),
                ),
                RatingBarIndicator(
                  rating: 2.75,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 20,
              decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
            
              ),
              child: Text(
                turfName,textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
