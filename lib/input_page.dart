import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/main.dart';

class InputPage extends StatelessWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: const [
                  MyTile(),
                  MyTile(),
                ],
              ),
            ),
            const MyTile(),
            Expanded(
              child: Row(
                children: const [
                  MyTile(),
                  MyTile(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              color: CustomColors.button,
              height: 80.0,
            )
          ],
        ),
      ),
    );
  }
}

class MyTile extends StatelessWidget {
  const MyTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: CustomColors.tile,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}
