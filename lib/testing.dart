import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Tst extends StatelessWidget {
  const Tst({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Container(
            color: Colors.blue,
            child: const Row(
              children: [
                Text('Cen'),
                Text('Left'),
              ],
            )),
      )
          //   width: MediaQuery.of(context).size.width,
          //   child: const Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          // Text(
          //   'Center',
          //   // textAlign: TextAlign.center, // Center the text within its space
          //   style: TextStyle(fontSize: 20),
          // ),
          // SizedBox(width: 20), // Add space between widgets
          // Text(
          //   'CenterRight',
          //   style: TextStyle(fontSize: 20),
          // ),
          //     ],
          //   ),
          // ),
          ),
    );
  }
}
