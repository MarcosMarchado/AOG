import 'package:alcool_gasolina/widgets/logo.dart';
import 'package:alcool_gasolina/widgets/submit_form_widget.dart';
import 'package:alcool_gasolina/widgets/success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _color = Colors.orange;
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcCtrl = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa Utilizar X";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        color: _color,
        child: ListView(
          children: <Widget>[
            Logo(),
            SizedBox(
              height: 20,
            ),
            _completed
                ? Success(
                    result: _resultText,
                    reset: reset,
                  )
                : SubmitForm(
                    alcCtrl: _alcCtrl,
                    gasCtrl: _gasCtrl,
                    busy: _busy,
                    submitForm: calculate,
                  ),
          ],
        ),
      ),
    );
  }

  reset() {
    setState(() {
      _completed = false;
      _gasCtrl = new MoneyMaskedTextController();
      _alcCtrl = new MoneyMaskedTextController();
      _busy = false;
      _color = Colors.orange;
    });
  }

  Future calculate() {
    double alc =
        double.parse(_alcCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double gas =
        double.parse(_gasCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;

    double res = alc / gas;

    setState(() {
      _completed = false;
      _busy = true;
      _color = Colors.deepOrange;
    });

    return new Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = "Compensa Utilizar Álcool";
        } else {
          _resultText = "Compensa Utilizar Gasolina";
        }
        _completed = true;
        _busy = false;
      });
    });
  }
}
