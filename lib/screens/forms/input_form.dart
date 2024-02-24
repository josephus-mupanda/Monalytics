
import 'package:flutter/material.dart';
import '../../config/values/values.dart';

class FormMaterial extends StatefulWidget {
  @override
  _FormMaterialState createState() => _FormMaterialState();
}

class _FormMaterialState extends State<FormMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Card(
          color: AppColors.bgColor,
          elevation: 5,
          margin: const EdgeInsets.fromLTRB(32, 32, 64, 32),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: const Column(
                  children: [
                    Center(
                      child: Text("What you want to add? Select from below?"),
                    ),
                    //SelectionSection(),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
