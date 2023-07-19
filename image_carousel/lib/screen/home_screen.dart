import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ///pageControll을 위한 객체
  final PageController pageController=PageController();

  /// 반복실행을 위한 init
  /// 3초에 한번씩 반복
  /// 매 3초 패이지 넘김
  @override
  void initState(){
    super.initState();

    Timer.periodic(
      Duration(seconds: 3),
        (timer){
        int? nextPage=pageController.page?.toInt();

        ///nextPage가 없을경우 아무일도 생기지 않음
        if(nextPage==null){
          return;
        }

        ///마지막 패이지일 경우 첫 패이지로 이동
        if(nextPage==4){
          nextPage=0;
        } else{
          nextPage++;
        }

        ///예외처리, 패이지 설정 후 다음 패이지로 변경
        pageController.animateToPage(nextPage, duration: Duration(milliseconds: 500), curve: Curves.ease,
        );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    ///상태바 아이콘의 색상을 변경
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      body: PageView(

        ///pageController 등록
        controller: pageController,

        ///map을 이용해서 각각의 이미지를 추가
        ///형식을 리스트로 바꿔서 반환
        children: [1,2,3,4,5].map(
            (number) =>Image.asset('asset/img/${number}.jpg',
              fit: BoxFit.cover,
            ),
        ).toList(),
      ),
    );
  }
}
