import 'package:douban_app/components/dashed_line.dart';
import 'package:douban_app/components/star_rating.dart';
import 'package:douban_app/models/home_model.dart';
import 'package:flutter/material.dart';
class MovieListItem extends StatelessWidget {
  final MovieItem item;
  const MovieListItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 10,color: Color(0xffe2e2e2))
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getRankWidget(),
          const SizedBox(height: 12,),
          getMovieContent(),
          const SizedBox(height: 12,),
          getOriginWidget(),
        ],
      ),
    );
  }

  //1.获取排名显示的widget
  Widget getRankWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 9),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3)
      ),
      child: Text(
        "No.${item.rank}",
        style: const TextStyle(fontSize: 18,color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }

//  2.获取中间内容的显示
  Widget getMovieContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getMovieImage(),
        getDetailDescWidget(),
        getDashedWidget(),
        getWishWidget(),
      ],
    );
  }
//  2.1获取显示的图片
  Widget getMovieImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(item.imageURL,height: 150,),
    );
  }
//  2.2获取描述的widget
  Widget getDetailDescWidget() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10), //根据水平垂直来设置内边距
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getMovieNameWidget(),
            getRatingWidget(),
            getIntroduction(),
          ],
        ),
      ),
    );
  }
//  2.2.1获取电影名称的Widget
  Widget getMovieNameWidget() {
    return Stack(
      children: [
        const Icon(Icons.play_circle_outline,color: Colors.red, size: 24,),
        Text.rich(TextSpan(
          children: [
            TextSpan(text: "     ${item.title}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            TextSpan(text: "(${item.playDate})",style: const TextStyle(fontSize: 18,color: Colors.black54))
          ]
        )),
      ],
    );
  }
//  2.2.2获取电影评分的Widget
  Widget getRatingWidget() {
    return Row(
      children: [
        ZHStarRating(rating: item.rating, size: 20,),
        Text("${item.rating}")
      ],
    );
}
//  2.2.3获取电影简介的Widget
  Widget getIntroduction() {
    //拼接内容
    final genresString = item.genres.join(" ");
    final director = item.director.name;
    final actorString = item.casts.join(" ");
    return Text(
      "$genresString / $director / $actorString", style: const TextStyle(fontSize: 16),
      maxLines: 2,
      overflow: TextOverflow.ellipsis ,
    );
  }

//  2.3获取分割线的Widget
  Widget getDashedWidget() {
    return const SizedBox(
      width: 1,
      height: 100,
      child: ZHDashedLine(
        axis: Axis.vertical,
        dashedLength: 5,
        count: 10,
        color: Color(0xffaaaaaa),
      ),
    );
  }

//  2.4获取想看的Widget
  Widget getWishWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 10),
      child: Column(
        children: [
          Image.asset("assets/img/home/wish.png",width: 32,),
          const SizedBox(height: 8,),
          const Text("想看",style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 235, 170, 60)),)
        ],
      ),
    );
  }

//  3.获取原始电影名称widget
Widget getOriginWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: const Color(0xfff2f2f2)
      ),
      child: Text(item.originalTitle,style: const TextStyle(fontSize: 18,color: Colors.black54)),
    );
}
}
