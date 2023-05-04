import 'package:flutter/cupertino.dart';

class Store_SearchScreen extends StatefulWidget {
  const Store_SearchScreen({Key? key}) : super(key: key);

  @override
  State<Store_SearchScreen> createState() => _Store_SearchScreenState();
}

class _Store_SearchScreenState extends State<Store_SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.black,
    child: Column(
      children: [
        Container(
            height: 110,
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            child: SizedBox(height: 45,
              child: CupertinoSearchTextField(
              ),
            ))
      ],
    ));
  }
}
