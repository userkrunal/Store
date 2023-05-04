import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:store/provider/store_provider.dart';

class SHomeScreen extends StatefulWidget {
  const SHomeScreen({Key? key}) : super(key: key);

  @override
  State<SHomeScreen> createState() => _SHomeScreenState();
}

class _SHomeScreenState extends State<SHomeScreen> {
  StoreProvider? providerT;
  StoreProvider? providerF;
  @override
  Widget build(BuildContext context) {
    providerT=Provider.of<StoreProvider>(context,listen: true);
    providerF=Provider.of<StoreProvider>(context,listen: false);
    return CupertinoTabScaffold(tabBar: CupertinoTabBar(
      items: [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.house),label: "Products"),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.search),label: "Search"),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart),label: "Cart"),
      ],
    ), tabBuilder: (context, index) {
      return CupertinoTabView(
        builder: (context) {
          return providerT!.screen[index];
        },
      );
    },);
  }
}
