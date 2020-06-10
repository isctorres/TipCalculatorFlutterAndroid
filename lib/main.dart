import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Tip Calculator",
    home: TipCalculator(),
  ));
}

class TipCalculator extends StatefulWidget {
  TipCalculator({Key key}) : super(key: key);

  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {

  double billAmount = 0.0;
  double tipPercentaje = 0.0;
  double total = 0.0;
  
  @override
  Widget build(BuildContext context) {
    TextField txtBillAmount = TextField(
      keyboardType: TextInputType.number,
      onChanged: (String value){
        try{
          billAmount = double.parse(value);
        }catch(e){
          billAmount = 0;
        }
      },
    );

    TextField txtTipPercentaje = TextField(
      decoration: InputDecoration(
        labelText: "tip %",
        hintText: ""
      ),
      keyboardType: TextInputType.number,
      onChanged: (String value){
        try{
          tipPercentaje = double.parse(value);
        }catch(e){
          tipPercentaje = 0;
        }
      },
    );

    RaisedButton calculateButton = RaisedButton(
      onPressed: (){
        double calculatedTip = billAmount * tipPercentaje / 100.0;
        setState(() {
          total = billAmount + calculatedTip;
        });

      },
      child: Text("Calculate"),
    );

    Container container = Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.amber[100],
      child: Column(
        children: <Widget>[txtBillAmount,txtTipPercentaje,calculateButton],
      ),
    );

    Center center = Center(
      child: Container(
        color: Colors.blue[200],
        child: Text("Total: \$$total", style: TextStyle(fontSize: 25.0)),
      )
    );


    Stack stack = Stack(
      children: <Widget>[
        container,
        center
      ],
    );

    AppBar appBar = AppBar(title: Text("Tip Calculator"));
    Scaffold scaffold = Scaffold(appBar: appBar, body: stack);
    return scaffold;
  }
}


