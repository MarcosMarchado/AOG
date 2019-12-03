import 'package:alcool_gasolina/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'loading_button_widget.dart';

class SubmitForm extends StatelessWidget {
  var gasCtrl = new MoneyMaskedTextController();
  var alcCtrl = new MoneyMaskedTextController();

  var busy = false;
  Function submitForm;

  SubmitForm({
    @required this.alcCtrl,
    @required this.gasCtrl,
    @required this.submitForm,
    @required this.busy,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            ctrl: gasCtrl,
            label: "Gasolina",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            ctrl: alcCtrl,
            label: "Álcool",
          ),
        ),
        LoadingButton(
          text: "CALCULAR",
          busy: busy,
          invert: false,
          func: submitForm,
        )
      ],
    );
  }
}
