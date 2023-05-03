import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class SHomeScreen extends StatefulWidget {
  const SHomeScreen({Key? key}) : super(key: key);

  @override
  State<SHomeScreen> createState() => _SHomeScreenState();
}

class _SHomeScreenState extends State<SHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Cupertino Store",style: TextStyle(color: CupertinoColors.black,fontSize: 20.sp,inherit:false)),
                ],
              ),
            ),

          ],
        ));
  }
}
