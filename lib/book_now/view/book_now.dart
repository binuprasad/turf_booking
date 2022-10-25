import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:get/get.dart';
import 'package:movie_tickets/book_now/controller/booknow_controller.dart';
import 'package:movie_tickets/constant/constant_widget.dart';
import 'package:movie_tickets/model/home_model.dart';

class BookNow extends StatelessWidget {
  BookNow({Key? key, required this.data}) : super(key: key);
  final Datum data;
  final booknowController = Get.put(BookNowController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 30,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    "Book Now",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ]),
              constwidgetsobj.ht30,
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 20.0)],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30.0)),
                    color: Colors.blue),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        image: DecorationImage(
                            image: NetworkImage(data.turfImages!.turfImages1!),
                            fit: BoxFit.fill),
                      ),
                    ),
                    constwidgetsobj.ht10,
                    
                   
                    TabBar(
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20,color: Colors.greenAccent),
                  indicator:
                      const UnderlineTabIndicator(borderSide: BorderSide.none),
                  controller: booknowController.controller,
                  tabs: booknowController.myTap
                  //  const [
                  //      Tab(text: 'app'),
                  //       Tab(text: 'Developer',),
                  //       ],
                  ),
                    CustomCard(
                      color: const Color.fromARGB(255, 235, 239, 230),
                      elevation: 15,
                      shadowColor: Colors.green,
                      borderRadius: 30,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TabBarView(
                            controller: booknowController.controller,
                            children: const [
                              Center(
                                child: Text(
                                  'Morning',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Noon',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Evening',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          )),
                    ),

                    // const Text('Price Details'),
                    // const PriceText(timeText: 'Morning : ', pricetext: '700'),
                    // const PriceText(pricetext: ' 500', timeText: 'Noon :'),
                    // const PriceText(pricetext: ' 900', timeText: 'Evening :')
                  ],
                ),
              ),
            ],
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
