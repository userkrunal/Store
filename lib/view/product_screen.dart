import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/provider/store_provider.dart';

class iSO_Products extends StatefulWidget {
  const iSO_Products({Key? key}) : super(key: key);

  @override
  State<iSO_Products> createState() => _iSO_ProductsState();
}

class _iSO_ProductsState extends State<iSO_Products> {
  StoreProvider? providerF;
  StoreProvider? providerT;
  @override
  Widget build(BuildContext context) {
    providerT=Provider.of<StoreProvider>(context,listen: true);
    providerF=Provider.of<StoreProvider>(context,listen: false);
    return CupertinoPageScaffold(backgroundColor: CupertinoColors.white,
    child: Column(
      children: [
        Container(
          height: 130,
          width: double.infinity,
          color: CupertinoColors.systemGrey6,
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(bottom: 10, left: 10),
          child: Text(
            "Cupertino Store",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemBuilder: (context, index) {
                return Container(height: 80,width: 350,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(image: AssetImage("${providerF!.storeList[index].img}"),fit: BoxFit.fill)
                            ),
                          ),
                          SizedBox(width: 8),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("\$ ${providerT!.storeList[index].name}", style: TextStyle(fontSize: 20, color: CupertinoColors.black),),
                              Text("\$ ${providerT!.storeList[index].price}", style: TextStyle(fontSize: 15, color: CupertinoColors.systemGrey2),),
                            ],),
                          Spacer(),
                          CupertinoButton(
                            child: Icon(CupertinoIcons.add_circled),
                            onPressed: () {
                              providerT!.addcart(index);
                            },)
                        ],
                      ),
                     Divider(color: CupertinoColors.extraLightBackgroundGray,thickness: 2,height: 1,endIndent: 10,indent: 65)
                    ],
                  ),
                );
              },
              itemCount: providerF!.storeList.length),
        ),
      ],
    ));
  }
}
