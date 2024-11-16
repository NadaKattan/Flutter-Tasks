import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  // const CustomButton({super.key});
  String label;
  void Function(String) onpressed;
  CustomButton({required this.label,required this.onpressed});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(2),
        // width: double.infinity,
        height: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black.withOpacity(0.7),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              // padding: EdgeInsets.symmetric(vertical: 20)
            ),
            onPressed: (){
              onpressed(label);
            },
            child: Text(
              "$label",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            )),
      ),
    );
  }
}
