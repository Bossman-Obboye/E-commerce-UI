import 'package:flutter/material.dart';



class DisplayCard extends StatefulWidget {
  const DisplayCard({
    super.key,
    required this.size,
    required this.img,
    required this.itemName,
    required this.itemPrice,
  });

  final Size size;

  final String img;
  final String itemName;
  final double itemPrice;

  @override
  State<DisplayCard> createState() => _DisplayCardState();
}

class _DisplayCardState extends State<DisplayCard> {
  final double columnChildrenSpacing = 0.02;
  bool myFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3.0),
            child: Stack(
              children: [
                Container(
                  height: widget.size.height * 0.21,
                  width: widget.size.width * 0.4,
                  decoration: BoxDecoration(
                    color: const Color(0xeff8f8f8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: const Alignment(1, -1),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          myFavourite = !myFavourite;
                        });
                      },
                      icon: myFavourite
                          ? const Icon(
                              Icons.favorite,
                              size: 20,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              size: 20,
                            ),
                    ),
                  ),
                ),
                Positioned(
                  height: widget.size.height * 0.145,
                  left: 25,
                  bottom: 10,
                  child: Image(
                    image: AssetImage(widget.img),
                  ),
                ),
              ],
            ),
          ),
          Text(
            widget.itemName,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
          Text(
            "\$${widget.itemPrice}",
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> products = [
  {
    'image': 'assets/images/luxury_shoe.png',
    'name': "Luxury Shoe",
    'price': 45.0,
  },
  {
    'image': 'assets/images/bluebag-removebg-preview.png',
    'name': "Gucci Bag",
    'price': 58.0,
  },
  {
    'image': 'assets/images/Puma_cropped.png',
    'name': "Puma Snicker",
    'price': 98.0,
  },
  {
    'image': 'assets/images/leatherbag.png',
    'name': "Leather bag",
    'price': 135.0,
  },
  {
    'image': 'assets/images/handbag.png',
    'name': "Ladies Bag",
    'price': 25.0,
  },
  {
    'image': 'assets/images/Snicker.png',
    'name': "Snicker",
    'price': 30.0,
  },
  {
    'image': 'assets/images/white_snicker.png',
    'name': "White Snicker",
    'price': 78.0,
  },
];
