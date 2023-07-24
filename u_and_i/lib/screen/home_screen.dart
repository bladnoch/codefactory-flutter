import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  DateTime firstDay=DateTime.now();

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(onHeartPressed: onHeartPressed),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }
  void onHeartPressed(){
  print("click!");
  }
}

class _DDay extends StatelessWidget{
  final GestureTapCallback onHeartPressed;

  _DDay({
    required this.onHeartPressed,
});

  @override
  Widget build(BuildContext context){
    final textTheme=Theme.of(context).textTheme;
    return Center(
      child: Column(
        children: [
          SizedBox(height: 16,),
          Text( "U & I", style: textTheme.headline1),

          SizedBox(height: 16,),
          Text("우리 처음 만난 날", style: textTheme.bodyText1),

          SizedBox(height: 16,),
          Text("2023/6/23", style: textTheme.bodyText2),

          SizedBox(height: 16,),
          IconButton(iconSize: 50,
            onPressed: onHeartPressed, icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),

          SizedBox(height: 16,),
          Text("D + 45", style: textTheme.headline2),

        ],
      ),
    );
  }
}

class _CoupleImage extends StatelessWidget {
  const _CoupleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.asset('asset/img/middle_image.png',
          ///이미지의 사이즈를 전체 화면 사이즈의 절만으로 설정
        height: MediaQuery.of(context).size.height/2,
        ),
      ),
    );
  }
}

