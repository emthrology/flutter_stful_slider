import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController controller = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    timer = Timer.periodic(Duration(seconds: 4), (timer) {
      int currentPage = controller.page!.toInt();
      int nextPage = (currentPage + 1) % 5; //length 의 최대공약수가 1일때만 사용(소수일때만)
      controller.animateToPage(nextPage, duration: Duration(milliseconds:400), curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if(timer != null) {
      timer!.cancel();
    }
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [1,2,3,4,5].map(
                (e) => Image.asset(
                    'asset/img/image_$e.jpeg',
                    fit: BoxFit.cover
                )
        ).toList()
      ),
    );
  }
}
