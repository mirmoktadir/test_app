import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/hotel_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HotelController hotelController = Get.put(HotelController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HotelController>(
          init: HotelController(),
          builder: (controller) {
            return controller.hotelList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Center(
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 104,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.blue,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      hotelController.hotelList[0].image
                                          .toString(),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(controller.hotelList[0].businessname
                                      .toString()),
                                  Text(controller.hotelList[0].reviews
                                      .toString()),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(controller.hotelList[0].slug.toString()),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 5,
                          child: Row(
                            children: [
                              Container(
                                height: 22,
                                width: 96,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                                child: const Center(
                                    child: Text(
                                  '20% Cashback',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: Colors.red,
                                  ),
                                )),
                              ),
                              const SizedBox(width: 8),
                              ClipOval(
                                child: Container(
                                  height: 22,
                                  width: 22,
                                  color: Colors.white,
                                  child: const Center(
                                      child: Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.red,
                                    size: 12,
                                  )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          }),
    );
  }
}
