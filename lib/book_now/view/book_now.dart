import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_tickets/constant/constant_widget.dart';
import 'package:movie_tickets/model/home_model.dart';

class BookNow extends StatelessWidget {
  const BookNow({Key? key, required this.data}) : super(key: key);
  final Datum data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
                    boxShadow: const [BoxShadow(blurRadius: 20.0)],

                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Column(
              children: [
                Row(children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                  const Text("Book Now")
                ]),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(data.turfImages!.turfImages1!),
                    ),
                  ),
                ),
                constwidgetsobj.ht10,
                const Text('Price Details'),
                const PriceText(
                  timeText: 'Morning : ',
                  pricetext: '700',
                ),
                const PriceText(pricetext: ' 500', timeText: 'Noon :'),
                const PriceText(pricetext: ' 900', timeText: 'Evening :')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PriceText extends StatelessWidget {
  const PriceText({Key? key, required this.pricetext, required this.timeText})
      : super(key: key);
  final String timeText;
  final String pricetext;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: timeText,
        style: const TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: pricetext,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
