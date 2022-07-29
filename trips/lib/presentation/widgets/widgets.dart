import 'package:flutter/material.dart';
import 'package:trips/constants/const.dart';

class AppButton extends StatelessWidget {
  double? width;
  AppButton({Key? key, this.width = 120}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Flexible(
        child: Container(
          width: width,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor,
          ),
          child: SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(image: AssetImage('images/button-one.png')),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

class ResponsiveButton extends StatelessWidget {
  final double width;
  const ResponsiveButton({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      padding: const EdgeInsets.only(left: 20),
      // margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          AppText(
            text: 'Book trip now!',
            color: Colors.white,
            size: 16,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(image: AssetImage('images/button-one.png')),
          ),
        ],
      ),
    );
  }
}

class AppText extends StatelessWidget {
  final double size;
  final String text;
  final FontWeight fontWeight;
  final Color color;

  const AppText(
      {Key? key,
      this.size = 14,
      required this.text,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

class AppLargeText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;

  const AppLargeText(
      {Key? key, this.size = 30, required this.text, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class TabBarIndicator extends Decoration {
  final Color color;
  final double radius;

  const TabBarIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CriclePainter(color: color, radius: radius);
  }
}

class _CriclePainter extends BoxPainter {
  final Color color;
  final double radius;

  _CriclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset =
        Offset(configuration.size!.width / 2 - radius / 2, 40);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundcolor;
  final Color bordercolor;
  final double size;
  bool? isIcon;
  String? text;
  IconData? icon;

  AppButtons(
      {Key? key,
      this.isIcon = false,
      this.icon,
      this.text = '1',
      required this.color,
      required this.backgroundcolor,
      required this.bordercolor,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundcolor,
        border: Border.all(color: bordercolor, width: 1.0),
      ),
      child: isIcon!
          ? Center(
              child: Icon(
              icon,
              color: color,
            ))
          : Center(
              child: AppText(
              text: text!,
              color: color,
              size: 18,
            )),
    );
  }
}
