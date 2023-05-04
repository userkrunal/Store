import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:store/provider/store_provider.dart';
import 'package:store/view/store_screen.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StoreProvider(),)
      ],
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(p0) => SHomeScreen(),
        },
      ),
    )
  );
}