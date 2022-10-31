
import 'package:cupertinostore/Cart.dart';
import 'package:cupertinostore/Products.dart';
import 'package:cupertinostore/Search.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _tabs = [
    const ProductsPage(),
    const SearchPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: 'Products',
                ),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.cart), label: 'Cart')
              ],
            ),
            tabBuilder: (BuildContext context, index) {
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return _tabs[index];
                },
              );
            }),
      ),
    );
  }
}
