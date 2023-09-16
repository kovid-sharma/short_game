import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:short_game/screens/size_controller.dart';
class SharePicture extends StatefulWidget {
  const SharePicture({Key? key}) : super(key: key);

  @override
  State<SharePicture> createState() => _SharePictureState();
}

class _SharePictureState extends State<SharePicture> {

  bool cam = true;
  XFile? photo;
  var sizeController = Get.put(SizeController());
  final ImagePicker picker = ImagePicker();

  @override
  void dispose() {


    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 24,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const CircleAvatar(
                    radius: 24,
                    backgroundColor: Color.fromRGBO(62, 139, 58, 1),
                    child: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                    ),
                  ),
                )
              ],

            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: sizeController.size.value >= 360 ? Container(
                    height: 350,
                    child: Stack(
                      children: [
                        Image.asset('assets/baby S.jpg'),
                        Positioned(
                          child: Text('I Am Full!!...'),
                          top: 100,
                          left: 30,
                        )

                      ],
                    )
                ) : Container(
                  height: sizeController.size.value,
                  child: Image.asset('assets/baby S.jpg'),
                )
            ),
            Expanded(child: Container(
                width: 100,

                child: cam ?
                Container(
                  child: CircleAvatar(
                    backgroundColor: Colors.black45,
                  ),
                ) :
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    width: 50,
                    height: 40,
                    child:
                    ClipOval(
                      child: photo == null ? Container(
                        child: Text('Sorry but you didnt choose any image'),
                      ) : Image.file(
                        File(photo!.path),
                      ),
                    )
                )
            ))

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: 64,
          height: 64,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    64), // Adjust the value for roundness
              ),
              primary: Color.fromRGBO(62, 139, 58, 1),

            ),
            onPressed: () async
            {
              if (cam == false) {

                sizeController.size.value = sizeController.size.value + 100;
                if (sizeController.size >= 360) {
                  Get.snackbar('Limit Full', 'The tiger is FUll Now!!!',

                    backgroundColor: Colors.red,

                  );
                }
                else
                  {
                    Get.snackbar('Thanks!', 'Hi Thanks for feeding me',
                    backgroundColor: Color.fromRGBO(62, 139, 58, 1),
                    );
                  }
              }
              if (cam == true) {
                photo = await picker.pickImage(source: ImageSource.camera);
              }
              cam = !cam;
              setState(() {

              });

            },
            child: cam ? Icon(Icons.camera_alt) :
            Icon(
                Icons.check
            ),

          ),
        ),
      ),
    );
  }

}