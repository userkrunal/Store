import 'package:flutter/cupertino.dart';
import 'package:store/model/store_model.dart';
import 'package:store/view/cart_screen.dart';
import 'package:store/view/product_screen.dart';
import 'package:store/view/search_screen.dart';

class StoreProvider extends ChangeNotifier
{

  List screen=[
    iSO_Products(),
    Store_SearchScreen(),
    Store_CartScreen()
  ];
  List cartList=[];
  List storeList=[
    StoreModel(name: "Skybages",img: "assets/images/img.png",price: 120),
    StoreModel(name: "Stella sunglasses",img: "assets/images/img_1.png",price: 58),
    StoreModel(name: "Whitney belt",img: "assets/images/img_2.png",price: 35),
    StoreModel(name: "Garden strand",img: "assets/images/img_3.png",price: 98),
    StoreModel(name: "Strut earring",img: "assets/images/img_4.png",price: 34),
    StoreModel(name: "Varsity sockes",img: "assets/images/img_5.png",price: 12),
    StoreModel(name: "Weaven keyring",img: "assets/images/img_6.png",price: 16),

  ];
  double cartheight = 75;
  double totalcart = 0;
  void addcart(int index)
  {
    double subtotal = 0;
    cartheight = (cartList.length +1 ) * 75;
    StoreModel temp = storeList[index];
    cartList.add(temp);
    cartheight = (cartList.length +1 ) * 75;
    for(int i = 0 ; i< cartList.length; i++)
    {
      subtotal = subtotal + cartList[i].price!;
    }
    totalcart = subtotal + 31.32 ;

    notifyListeners();
  }

  DateTime sdate = DateTime.now();

  void datechange(DateTime temp)
  {
    sdate = temp;
    notifyListeners();

  }
}