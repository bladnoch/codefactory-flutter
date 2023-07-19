import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class HomeScreen extends StatelessWidget {
  WebViewController? controller;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF02343F),
        title: Text("Daniel Kim's appBar"),
        centerTitle: true,

        actions: [
          IconButton(onPressed: (){
            controller!=null? controller!.loadUrl("https://github.com/bladnoch/codefactory-flutter"): {};
          }, icon: Icon(
            Icons.home,
          ),
          ),
        ],
      ),
      body: WebView(
        onWebViewCreated: (WebViewController controller){
          this.controller=controller;
      },
        initialUrl:"https://github.com/bladnoch/codefactory-flutter",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
