import 'package:cupertinostore/Globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  String selectedMonth = "August";
  String period = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: CupertinoColors.systemGrey5,
          width: double.infinity,
          padding: const EdgeInsets.only(top: 70, left: 11, bottom: 10),
          child: const Text(
            "Shopping Cart",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: CupertinoColors.black),
          ),
        ),
        Expanded(
          child: Container(
            color: CupertinoColors.white,
            child: Column(
              children: [
                Row(
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      CupertinoIcons.person_alt,
                      color: CupertinoColors.systemGrey2,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: CupertinoTextField()),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      CupertinoIcons.mail,
                      color: CupertinoColors.systemGrey2,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: CupertinoTextField()),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      CupertinoIcons.location,
                      color: CupertinoColors.systemGrey2,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: CupertinoTextField()),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) => Container(
                          height: 220,
                          color: Colors.white,
                          child: CupertinoDatePicker(
                            initialDateTime: currentDate,
                            // use24hFormat: true,
                            onDateTimeChanged: (dateTime) {
                              setState(() {
                                currentDate = dateTime;
                                if (currentDate.hour > 11) {
                                  period = "PM";
                                } else {
                                  period = "AM";
                                }
                                currentDate = dateTime;
                                if (currentDate.month == 1) {
                                  selectedMonth = "Jan";
                                } else if (currentDate.month == 2) {
                                  selectedMonth = "Feb";
                                } else if (currentDate.month == 3) {
                                  selectedMonth = "March";
                                } else if (currentDate.month == 4) {
                                  selectedMonth = "April";
                                } else if (currentDate.month == 5) {
                                  selectedMonth = "May";
                                } else if (currentDate.month == 6) {
                                  selectedMonth = "Jun";
                                } else if (currentDate.month == 7) {
                                  selectedMonth = "July";
                                } else if (currentDate.month == 8) {
                                  selectedMonth = "Aug";
                                } else if (currentDate.month == 9) {
                                  selectedMonth = "Sep";
                                } else if (currentDate.month == 10) {
                                  selectedMonth = "Oct";
                                } else if (currentDate.month == 11) {
                                  selectedMonth = "Nov";
                                } else if (currentDate.month == 12) {
                                  selectedMonth = "Dec";
                                }
                              });
                            },
                          ),
                        ));
                  },
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        CupertinoIcons.time,
                        color: CupertinoColors.systemGrey2,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Delivery time"),
                      const Spacer(),
                      Text(
                        "${currentDate.day} $selectedMonth ${currentDate.year} (${currentDate.hour} : ${currentDate.minute}  $period)",
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    ...Global.allCarts
                        .map(
                          (e) => Container(
                        margin: const EdgeInsets.only(
                            left: 10, right: 5, bottom: 5, top: 5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                    e['images'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e['name'],
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      "₹ ${e['price']}",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color:
                                          CupertinoColors.systemGrey2),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  "₹ ${e['price']}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: CupertinoColors.black),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                        .toList()
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: const [
                        Spacer(),
                        Text("Shipping ₹70",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: CupertinoColors.systemGrey)),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Text("Tax ₹ ${Global.gst}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: CupertinoColors.systemGrey)),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          "Total ₹ ${Global.total}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
