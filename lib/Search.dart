import 'package:cupertinostore/Globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: CupertinoColors.white,
          width: double.infinity,
          padding: EdgeInsets.only(top: 70, left: 11, bottom: 10, right: 11),
          child: CupertinoSearchTextField(
            onTap: () {},
          ),
        ),
        Expanded(
          child: Container(
            height: 650,
            width: double.infinity,
            color: CupertinoColors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...Global.allProducts
                      .map(
                        (e) => Container(
                      margin: const EdgeInsets.only(
                          left: 10, right: 5, bottom: 8, top: 8),
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
                                        color: CupertinoColors.systemGrey2),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Global.allCarts.add(e);
                                  });
                                },
                                child:
                                const Icon(CupertinoIcons.add_circled),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const Divider(
                            color: CupertinoColors.systemGrey,
                            thickness: 0.5,
                            indent: 59,
                          ),
                        ],
                      ),
                    ),
                  )
                      .toList(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
