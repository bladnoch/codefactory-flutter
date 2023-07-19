import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// home_screen.dart : HomeScreen
/// @author DoungukKim
/// @since 7/19/2023
/// @version V0.0.1

class HomeScreen extends StatelessWidget {
  //controller 정보를 받기위한 변수
  WebViewController? controller;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF02343F),
        title: Text("Daniel Kim's appBar"),
        centerTitle: true,

        //앱바 안에 홈버튼
        actions: [
          //뒤로 가기
          IconButton(onPressed: (){
            controller!=null ? controller!.goBack(): {};
          }, icon: Icon(
            Icons.arrow_back,
          ),
          ),
          //앞으로 가기
          IconButton(onPressed: (){
            controller!=null ? controller!.goForward(): {};
          }, icon: Icon(
            Icons.arrow_forward,
          ),
          ),
          IconButton(onPressed: (){
            /**
             * controller이 null이 아닐경우 실행
             * 실행이 될경우의 조건이 controller가 절대 null일 수 없기 때문에 controller!로 null일 수 없음을 표현
             */
            controller!=null? controller!.loadUrl("https://github.com/bladnoch/codefactory-flutter"): {};
          }, icon: Icon(
            Icons.home,
          ),
          ),
        ],
      ),
      //웹뷰: 웹사이트 어플로 디스플레이
      body: WebView(
        //웝뷰가 생성 되었을 때 실행
        onWebViewCreated: (WebViewController controller){
          this.controller=controller;
      },
        initialUrl:"https://github.com/bladnoch/codefactory-flutter",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
