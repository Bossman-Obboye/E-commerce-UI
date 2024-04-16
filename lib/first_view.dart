import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_app/utilities/colors.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/background.png'),
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'FruitBasket',
                      style: TextStyle(
                        color: CustomColors.white,
                        fontFamily: 'MrsSaintDelafield',
                        fontSize: 20,
                      ),
                    ),
                    Icon(Icons.menu, color: CustomColors.white),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.3,
                ),
                Text(
                  'Welcome',
                  style: TextStyle(
                      color: CustomColors.primaryColor,
                      fontSize: 34,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'To Fruit Basket',
                  style: TextStyle(
                      color: CustomColors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: size.width * 0.5,
                  child: Text(
                    'Enim magna proident proident sunt dost exercitation irure duis excepteur eu enim id elit minim. Non esse aute ut vet da quis.excepte',
                    style: TextStyle(
                        color: Color(0xff919292),
                        fontSize: 9,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    height: size.height * 0.024,
                    width: size.width * 0.23,
                    decoration: BoxDecoration(
                      color: CustomColors.primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5.5),
                        bottomLeft: Radius.circular(5.5),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('View More',
                            style: TextStyle(
                                fontSize: 9, fontWeight: FontWeight.bold)),
                        Icon(Icons.arrow_right_alt_outlined, size: 19),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.27,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DesignBox(
                      size: size,
                      mainText: 'Fruit',
                    ),
                    DesignBox(
                      size: size,
                      fillColor: const Color(0xff454854),
                      height: size.height * 0.032,
                      mainText: 'Flower',
                    ),
                    DesignBox(
                      size: size,
                      mainText: 'Feasr',
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.04),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Icon(
                    Icons.home,
                    size: 26,
                    color: Color(0xff919292),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DesignBox extends StatelessWidget {
  const DesignBox({
    super.key,
    required this.size,
    required this.mainText,
    this.fillColor = const Color(0xff283438),
    this.height = 22,
  });
  final String mainText;
  final Size size;
  final Color fillColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: height,
      width: size.width * 0.22,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              mainText,
              style: TextStyle(
                  color: CustomColors.white,
                  fontSize: 12,
                  fontFamily: "MrsSaintDelafield"),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: size.height * 0.01,
              width: size.height * 0.01,
              decoration: BoxDecoration(
                  color: CustomColors.primaryColor, shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}
