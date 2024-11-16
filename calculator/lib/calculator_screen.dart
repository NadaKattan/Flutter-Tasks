import 'package:flutter/material.dart';

import 'custom_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.black.withOpacity(0.8),
        title:
            Container(alignment: Alignment.center, child: Text("Calculator",style: TextStyle(fontSize: 28))),
      ),
      body: Column(
        children: [
          Expanded(child: Container(
            alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 10),
              child: Text("$resultText",style: TextStyle(fontSize: 30)))),
          Expanded(
            child: Row(
              children: [
                CustomButton(label: "7", onpressed: onDigitClick),
                CustomButton(label: "8", onpressed: onDigitClick),
                CustomButton(label: "9", onpressed: onDigitClick),
                CustomButton(label: "*", onpressed: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CustomButton(label: "4", onpressed: onDigitClick),
                CustomButton(label: "5", onpressed: onDigitClick),
                CustomButton(label: "6", onpressed: onDigitClick),
                CustomButton(label: "/", onpressed: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CustomButton(label: "1", onpressed: onDigitClick),
                CustomButton(label: "2", onpressed: onDigitClick),
                CustomButton(label: "3", onpressed: onDigitClick),
                CustomButton(label: "+", onpressed: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CustomButton(label: ".", onpressed: onDotClick),
                CustomButton(label: "0", onpressed: onDigitClick),
                CustomButton(label: "=", onpressed: onEqualClick),
                CustomButton(label: "-", onpressed: onOperatorClick),
              ],
            ),
          ),
        ],
      ),
    );
  }
  String resultText='';
  String savedOperator='';
  String savedText='';
  void onDigitClick(String digit){
    // if(!savedText.isEmpty){
    //   resultText=calculate(savedText, savedOperator, resultText);
    // }
    setState(() {
      resultText+=digit;
    });
  }
  void onOperatorClick(String operator){
    if(resultText.isEmpty) return;
    if(savedText.isEmpty){
      savedText=resultText;
    }
    else{
      savedText=calculate(savedText, savedOperator, resultText);
      // savedText=resultText;
    }
    savedOperator=operator;
    resultText='';
    setState(() {
    });
  }
  String calculate(String lhs,String op,String rhs){
    double left=double.parse(lhs);
    double right=double.parse(rhs);
    late double result;
    switch(op){
      case '*':
        result=left*right;
        break;
      case '/':
        result=left/right;
        break;
      case '+':
        result=left+right;
        break;
      case '-':
        result=left-right;
        break;
    }
    return result.toString();
  }
  void onEqualClick(String _){
    setState(() {
      if(savedText.isEmpty||resultText.isEmpty) return;
      resultText=calculate(savedText, savedOperator, resultText);
      savedText='';
    });
  }
  void onDotClick(String _){
    setState(() {
      if(!resultText.contains('.')) {
        resultText += '.';
      }
    });
  }
}
