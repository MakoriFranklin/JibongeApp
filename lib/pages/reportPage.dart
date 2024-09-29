import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:foma/services/filePicker.dart';
import 'package:foma/utils/colors.dart';
import 'package:foma/widgets/customTextfield.dart';

class Reportpage extends StatefulWidget {
  const Reportpage({super.key});

  @override
  State<Reportpage> createState() => _ReportpageState();
}

class _ReportpageState extends State<Reportpage> {
  List<File> images = [];
  void selectImages() async {
    final res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        centerTitle: true,
        title: const Text(
          'Report',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Form(
              child: Column(
                children: [
                  const Customtextfield(
                    hintText: 'Officer Name',
                    helperText: 'Officer Name',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Customtextfield(
                    hintText: 'Type of officer',
                    helperText: 'Officer Type',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Customtextfield(
                    hintText: 'Location or office of misconduct',
                    helperText: 'Misconduct',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: selectImages,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DottedBorder(
                        radius: const Radius.circular(20),
                        color: Colors.grey,
                        child: Container(
                            width: double.infinity,
                            height: 100,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.folder_open),
                                Text(
                                  'Upload any supportive evidence',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Customtextfield(
                    hintText: 'Describe the offence',
                    helperText: 'Offence description',
                    maxLines: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/reportSuccess');
                      },
                      child: Text(
                        'Send',
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
