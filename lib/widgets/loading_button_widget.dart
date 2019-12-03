import "package:flutter/material.dart";

class LoadingButton extends StatelessWidget {
  var busy = false;
  var invert = false;
  var text = '';
  Function func;

  LoadingButton(
      {@required this.busy,
      @required this.func,
      @required this.invert,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            alignment: Alignment.center,
            height: 50,
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColorLight,
            ),
          )
        : Container(
            margin: EdgeInsets.all(20),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: invert
                    ? Theme.of(context).primaryColorDark
                    : Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(60)),
            child: FlatButton(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 30,
                    color:
                        invert ? Colors.white : Theme.of(context).primaryColor,
                    fontFamily: "Big Shoulders Display",
                    fontWeight: FontWeight.bold),
              ),
              onPressed: func,
            ),
          );
  }
}
