

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
void main()
{
  runApp(
    MaterialApp(

      home: Image(),
    )

  );


}

class Image extends StatefulWidget {
  const Image({Key? key}) : super(key: key);


  @override
  _ImageState createState() => _ImageState();
}

class _ImageState extends State<Image> {
  @override

  File? imagefile;
  final picker = ImagePicker();

  chooseImage(ImageSource source) async{
    final pickedFile = await picker.pickImage(source: source);

    setState( () {

      imagefile = File(pickedFile!.path);
    }


    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'image picker',
          ),
        ),

     body: Center(

       child: Container(

         child: Column(
           children: [

             Container(

               child: imagefile != null
                   ?
                   Container(
                     height: 200,
                     width: 200,

                     decoration: BoxDecoration(
                       image: DecorationImage(
                         image: FileImage(imagefile!),
                       )
                     ),

                   )
                   : Container(
                 height: 200,
                 width: 200,
                 decoration: BoxDecoration(

                   color: Colors.red,
                 ),
               )

             ),

             Container(
               child: Row(

                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [

                   ElevatedButton(
                     onPressed: (){

                       chooseImage(ImageSource.camera);
                     },
                     child: Text(
                       'camera',
                     ),

                   ),


      ElevatedButton(
        onPressed: () {
          chooseImage(ImageSource.gallery);
        },
        child: Text(
          'Gallery',
        ),
      )

                 ],

               ),
             )

           ],

         ),

       ),

     ),

    );
  }
}
