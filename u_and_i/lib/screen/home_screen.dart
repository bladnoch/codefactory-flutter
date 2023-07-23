import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            _DDay(),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }
}

class _DDay extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: [
          SizedBox(height: 20,),
          Text( "U & I", style: TextStyle(
            fontWeight: FontWeight.w700,
          ),),

          SizedBox(height: 20,),
          Text("우리 처음 만난 날"),

          SizedBox(height: 10,),
          Text("2023/6/23"),

          SizedBox(height: 20,),
          IconButton(iconSize: 50,
            onPressed: (){}, icon: Icon(Icons.favorite),),

          SizedBox(height: 20,),
          Text("D + 45"),

        ],
      ),
    );
  }
}

class _CoupleImage extends StatelessWidget {
  const _CoupleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('asset/img/middle_image.png',
        ///이미지의 사이즈를 전체 화면 사이즈의 절만으로 설정
      height: MediaQuery.of(context).size.height/2,
      ),
    );
  }
}

