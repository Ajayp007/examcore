import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/global.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  GlobalKey<FormState> formekey = GlobalKey();

  TextEditingController txtname = TextEditingController();
  TextEditingController txtgrid = TextEditingController();
  TextEditingController txtstd = TextEditingController();

  String path = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formekey,
            child: Column(
              children: [
                Container(
                  height: 130,
                  width: MediaQuery.sizeOf(context).width * 0.90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      path.isEmpty
                          ? const CircleAvatar(
                              backgroundColor: Colors.black,
                              maxRadius: 70,
                              child: Text(
                                "",
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 30),
                              ),
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.pink.shade200,
                              backgroundImage: FileImage(
                                File(path),
                              ),
                              maxRadius: 70,
                            ),
                      IconButton.filled(
                        onPressed: () async {
                          ImagePicker picker = ImagePicker();
                          XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            path = image!.path;
                            g1.profileImage = image.path;
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Enter GR Id",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Please Enter The GR Id";
                    }
                    return null;
                  },
                  controller: txtgrid,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Enter Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Please Enter The Name";
                    }
                    return null;
                  },
                  controller: txtname,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Enter Std",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Please Enter The Standard";
                    }
                    return null;
                  },
                  controller: txtstd,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    if (formekey.currentState!.validate()) {
                      g1.std = txtstd.text;
                      g1.name = txtname.text;
                      g1.grid = txtgrid.text;
                    }
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).width * 0.60,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(fontSize: 16,color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
