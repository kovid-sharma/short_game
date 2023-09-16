import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:short_game/screens/share_picture.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(60),
        child: Container(
          width: 229,
          height: 56,
          child: ElevatedButton(
            style:ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50), // Adjust the value for roundness
              ),
              primary: Color.fromRGBO(62, 139, 58, 1),

            ),
              onPressed: ()
              {
                  Get.to(()=>SharePicture());
              },
              child: Text(
                 'Share Your Meal',
                style: TextStyle(
                  fontSize: 20,
                ),
              )
          ),
        ),
      ),
    );
  }
}
