import "package:flutter/material.dart";
class ZHStarRating extends StatefulWidget {
  final double rating; //当前评分
  final double maxRating; //最高评分
  final Widget unselectedImage; //未选中的图片
  final Widget selectedImage;  //选中的图片
  final int count;  //个数
  final double size;  //大小
  final Color unselectedColor;  //默认icon时，未选中图标的颜色
  final Color selectedColor;  //默认icon时，选中图标的颜色

  ZHStarRating({
    super.key,
    required this.rating,
    this.maxRating = 10,
    Widget? unselectedImage,
    Widget? selectedImage,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xff323232),
    this.selectedColor = const Color(0xffff8f02)
}): unselectedImage = unselectedImage ?? Icon(Icons.star, size: size,color: unselectedColor,),
  selectedImage = selectedImage ?? Icon(Icons.star, size: size,color: selectedColor,);

  @override
  State<ZHStarRating> createState() => _ZHStarRatingState();
}

class _ZHStarRatingState extends State<ZHStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        getUnselectedStar(),
        getSelectedStar(),
      ],
    );
  }

  //获取未选中的Star
  Widget getUnselectedStar() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.count, (index) => widget.unselectedImage),
    );
  }

//  获取选中的Star
  Widget getSelectedStar() {
    //1.计算完整的star
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();  //向下取整
    //2.声誉的一个star显示的比例
    double leftValue = (widget.rating - oneValue * entireCount);
    double ratioLeft = leftValue / oneValue;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(entireCount + 1, (index) {
        if(index < entireCount) return widget.selectedImage;
        return ClipRect(
          clipper: MyReactClipper(width: widget.size * ratioLeft),
          child: widget.selectedImage,
        );
      }),
    );
  }
}

class MyReactClipper extends CustomClipper<Rect> {
  double width;
  MyReactClipper({required this.width});

  @override
  Rect getClip(Size size) {  //size为整个box的高度
    // TODO: implement getClip
    return Rect.fromLTRB(0, 0, width, size.height);
  }
  @override
  bool shouldReclip(covariant MyReactClipper oldClipper) { //什么时候进行剪接
    // TODO: implement shouldReclip
    return width != oldClipper.width;
  }
}
