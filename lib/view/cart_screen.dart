import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/provider/store_provider.dart';

class Store_CartScreen extends StatefulWidget {
  const Store_CartScreen({Key? key}) : super(key: key);

  @override
  State<Store_CartScreen> createState() => _Store_CartScreenState();
}

class _Store_CartScreenState extends State<Store_CartScreen> {

  StoreProvider? providerF;
  StoreProvider? providerT;
  @override
  Widget build(BuildContext context) {
    providerF=Provider.of<StoreProvider>(context,listen: false);
    providerT=Provider.of<StoreProvider>(context,listen: true);
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            color: CupertinoColors.systemGrey6,
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(bottom: 10, left: 10),
            child: Text(
              "Shopping Cart",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
            child: Row(children: [
              Icon(CupertinoIcons.stopwatch_fill,color: CupertinoColors.systemGrey3,size: 20,),
              SizedBox(width: 10,),
              Text("Delivery time",style:TextStyle(color: CupertinoColors.systemGrey3,fontSize:15),),
              Spacer(),
              Text("${providerT!.sdate.day} / ${providerT!.sdate.month} / ${providerT!.sdate.year}  ${providerT!.sdate.hour} : ${providerT!.sdate.minute}",style:TextStyle(color: CupertinoColors.systemGrey3,fontSize:15),),
            ],),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(height: 220,
              child: CupertinoDatePicker(

                onDateTimeChanged: (value) {
                  DateTime? temp;
                  temp = value;
                  providerF!.datechange(temp);
                },
                mode: CupertinoDatePickerMode.dateAndTime,
                backgroundColor: CupertinoColors.systemGrey2,
                initialDateTime: DateTime.now(),
              ),
            ),
          ),
          Container(
            height: providerF!.cartheight,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index) => CupertinoListTile(
                    title: Text("${providerF!.cartList[index].name}",style: TextStyle(color: CupertinoColors.black,fontSize: 15)),
                    subtitle: Text("\$ ${providerF!.cartList[index].price}",style: TextStyle(color: CupertinoColors.systemGrey3)),
                    leading: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("${providerF!.cartList[index].img}"),fit: BoxFit.cover
                          )
                      ),
                    ),
                    trailing: Text("\$ ${providerF!.cartList[index].price}",style: TextStyle(color: CupertinoColors.black),),
                  ),itemCount: providerF!.cartList.length,),
                ),   Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                  child: Container(height: 150,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Shipping \$ 22.00"),
                        Text("Tax \$ 10.32"),
                        Text("Total \$ ${providerT!.totalcart}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                      ],
                    ),),
                ),

              ],
            ),
          ),

      //     Container(
      //       height: providerT!.cartheight,
      //       child: Expanded(
      //         child: ListView.builder(
      //             padding: EdgeInsets.only(top: 10),
      //             itemBuilder: (context, index) {
      //               return CupertinoListTile(title: )
      //             }
      //     //           return Container(height: 80,width: 350,
      //     //             padding: EdgeInsets.symmetric(horizontal: 10),
      //     //             child: Column(
      //     //               children: [
      //     //                 Row(
      //     //                   children: [
      //     //                     Container(
      //     //                       height: 70,
      //     //                       width: 60,
      //     //                       decoration: BoxDecoration(
      //     //                           borderRadius: BorderRadius.circular(5),
      //     //                           image: DecorationImage(image: AssetImage("${providerF!.cartList[index].img}"),fit: BoxFit.fill)
      //     //                       ),
      //     //                     ),
      //     //                     SizedBox(width: 8,),
      //     //                     Column(
      //     //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     //                       crossAxisAlignment: CrossAxisAlignment.start,
      //     //                       children: [
      //     //                         Text("${providerF!.cartList[index].name}", style: TextStyle(fontSize: 25, color: CupertinoColors.black),),
      //     //                         Text("${providerF!.cartList[index].price}", style: TextStyle(fontSize: 25, color: CupertinoColors.systemGrey2),),
      //     //                       ],),
      //     //                     Spacer(),
      //     //                     Text("\$ ${providerF!.cartList[index].price}"),
      //     //                   ],
      //     //                 ),
      //     //                 Divider(color: CupertinoColors.extraLightBackgroundGray,thickness: 2,height: 1,endIndent: 10,indent: 65)
      //     //               ],
      //     //             ),
      //     //           );
      //     //         },
      //     //         itemCount: providerF!.cartList.length),
      //     //   ),
      //     // ),
      //     //
      //     ),
       ],
      ),
    ));
  }
}
