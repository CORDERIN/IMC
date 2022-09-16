import 'package:flutter/material.dart';

// Aluno: Arthur Cordeiro Ferreira Souza
void main() {
  runApp(MaterialApp(
      home: Home(),
      ));
  }

 class Home extends StatefulWidget {
    @override
    _HomeState createState() => _HomeState();
  }

class _HomeState extends State<Home> {

  TextEditingController weightController = TextEditingController () ;
  TextEditingController heightController = TextEditingController () ;
  String _infoText = "Informe seus dados";

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields (){
    _formKey = GlobalKey<FormState>();
    weightController . text = "";
    heightController . text = "";
    setState (() {
      _infoText = "Informe seus dados";
    });
  }
  void _calculate (){
    setState (() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100.0;
      double imc = weight / (height * height);

      if (imc < 18.6) {
        _infoText = "Seu BETA!!!(${imc.toStringAsPrecision(4)})";
      }
      else if (imc < 24.9) {
        _infoText = "Você é um Deus da Estética! (${imc.toStringAsPrecision(4)})";
      }
      else if (imc < 29.9) {
        _infoText = "Capa do Bacon (${imc.toStringAsPrecision(4)})";
      }
      else if (imc < 34.9) {
        _infoText = "Obesidade I (${imc.toStringAsPrecision(4)})";
      }
      else if (imc < 39.9) {
        _infoText = "Obesidade II (${imc.toStringAsPrecision(4)})";
      }else{
        _infoText = "Obesidade III (${imc.toStringAsPrecision(4)})";
      }
    }
      );
    }
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (

        title : Text("IMC dos Deuses da Estética"),
        centerTitle : true ,
        backgroundColor: Colors .purple,
        actions : <Widget>[
          IconButton(icon: Icon(Icons . refresh ),
              onPressed: _resetFields),
          ],

      ) ,
        backgroundColor: Colors .white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment. stretch,
          children : <Widget>[

            Icon(Icons .person_outline, size : 120.0, color : Colors .purple,) ,

            TextFormField (
              keyboardType: TextInputType.number,
              decoration : InputDecoration(
              labelText : "Peso (kg)",
                labelStyle : TextStyle ( color :
                Colors .purple),
               ),
              textAlign : TextAlign. center ,
              style : TextStyle ( color : Colors .purple,
              fontSize : 20.0),
              controller : weightController,
              validator: (value) {
                if (value.toString().isEmpty) {
                  return " Insira seu peso";
                }
                if (double.parse(value.toString())< 0) {
                  return " Insira um valor válido";
                }
                if (double.parse(value.toString()) > 500) {
                  return  " Insira um valor válido";
                }
                if (num.tryParse(value.toString()) == null) {
                  return " Insira um valor válido";
                }
              }
          ),
            TextFormField (
                keyboardType: TextInputType.number,
                decoration : InputDecoration(
                  labelText : "Altura (cm)",
                  labelStyle : TextStyle ( color :
                  Colors .purple),
                ),
                textAlign : TextAlign. center ,
                style : TextStyle ( color : Colors .purple,
                    fontSize : 20.0),
                controller : heightController,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return " Insira sua altura";
                  }
                  if (double.parse(value.toString())< 0) {
                    return " Insira um valor válido";
                  }
                  if (double.parse(value.toString()) > 300) {
                    return  " Insira um valor válido";
                  }
                  if (num.tryParse(value.toString()) == null) {
                    return " Insira um valor válido";
                  }
                }
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0, bottom:15.0),
              child: Container(
               height : 50.0,
               child : ElevatedButton(
               onPressed: (){
                 if(_formKey.currentState!.validate()) _calculate();
               },
                   child : Text("Calcular", style : TextStyle ( color : Colors .white, fontSize : 16.0), ),
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors .purple,
                 ),
                )
              ),
            ),
            Text(_infoText, textAlign : TextAlign. center ,style: TextStyle(fontSize: 20, color: Colors.purple),)
          ]
          ),
          ),
        ),
    );
   }
}


