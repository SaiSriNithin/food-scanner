import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:food_scanner/imageselection.dart';

class AddNewItem extends StatefulWidget {
  const AddNewItem({super.key});

  @override
  State<AddNewItem> createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  final TextEditingController categoryController = TextEditingController();
  Uint8List? _image;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 3.0,
        title: Text('Add New Image'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            controller: categoryController,
            decoration: InputDecoration(
              labelText: "Enter the Product Name",
              fillColor: Color.fromARGB(255, 255, 255, 255),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
          SizedBox(height: 50),
          InkWell(
            onTap: () async {
              Uint8List? dummy = await showImagePickerOption(context);
              setState(() {
                _image = dummy;
              });
            },
            child: Container(
              clipBehavior: Clip.hardEdge,
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: _image != null
                  ? Image(
                      image: MemoryImage(_image!),
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/fileadd.jpg',
                      scale: 1.8,
                    ),
            ),
          ),
          SizedBox(height: 20),
          Text('Add Picture of Product\'s ingredients '),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('Submit'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
