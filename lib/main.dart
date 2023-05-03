import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:store/view/store_screen.dart';

void main()
{
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/':(context) => SHomeScreen(),
          },
        );
      },
    )
  );
}