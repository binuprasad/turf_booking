import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:movie_tickets/model/home_model.dart';
import 'package:movie_tickets/wish%20_list/widgets/favourite_button.dart';

class CustomCard2 extends StatelessWidget {
  const CustomCard2({
    Key? key,
    required this.image,
    required this.turfName,
    required this.starRating, 
    required this.data,
  }) : super(key: key);
  final String image;
  final String turfName;
  final String starRating;
  final Datum data;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      borderRadius: 20.0,
      height: MediaQuery.of(context).size.height / 4.0,
      width: MediaQuery.of(context).size.width / 2,
      childPadding: 0,
      elevation: 30,
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
                FavTurfIconButton(data: data),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(starRating)
                  ],
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 20,
              decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Text(
                turfName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
