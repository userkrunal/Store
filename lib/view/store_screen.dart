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



// child: Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     SizedBox(
//       height: 50,
//     ),
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           Text("Cupertino Store",style: TextStyle(color: CupertinoColors.black,fontSize: 20.sp,inherit:false,fontWeight: FontWeight.bold)),
//         ],
//       ),
//     ),
//     ListView.builder(itemBuilder: (context, index) => CupertinoListTile(
//       title: Text("${providerF!.storeList[index].name}"),
//       subtitle: Text("${providerF!.storeList[index].price}"),
//     ),)
//
//   ],
// ));