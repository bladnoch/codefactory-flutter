import 'package:flutter/material.dart';

/// @home_screen.dart
/// @since 7/23/2023
/// @author Doungukkim
/// @version V0.0.1

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay=DateTime.now();

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
            ///화면 상단 요소
            _DDay(
              onHeartPressed: onHeartPressed,
              firstDay: firstDay,
            ),

            ///화면 하단 요소
            _CoupleImage(),
          ],
        ),
      ),
    );
  }
  void onHeartPressed(){
  setState(() {
    firstDay=firstDay.subtract(Duration(days:1));
  });
  }
}

/// 화면 상단의 요소
class _DDay extends StatelessWidget{
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;

  _DDay({
    required this.onHeartPressed,
    required this.firstDay,
});

  @override
  Widget build(BuildContext context){
    final textTheme=Theme.of(context).textTheme;
    final now=DateTime.now();
    return Center(
      child: Column(
        children: [
          SizedBox(height: 16,),
          Text( "U & I", style: textTheme.headline1),

          SizedBox(height: 16,),
          Text("우리 처음 만난 날", style: textTheme.bodyText1),

          SizedBox(height: 16,),
          Text("${firstDay.year}. ${firstDay.month}.${firstDay.day}", style: textTheme.bodyText2),

          SizedBox(height: 16,),
          IconButton(iconSize: 50,
            onPressed: onHeartPressed, icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),

          SizedBox(height: 16,),
          Text("D + ${DateTime(now.year, now.month, now.day).difference(firstDay).inDays+1}", style: textTheme.headline2),

        ],
      ),
    );
  }
}

///화면 하단
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

