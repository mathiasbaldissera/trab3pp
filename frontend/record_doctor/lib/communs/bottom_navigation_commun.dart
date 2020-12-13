import 'package:flutter/material.dart';

class BottomCommun extends StatelessWidget {
  final Function functionSave;
  final Function functionCancel;
  const BottomCommun({this.functionSave, this.functionCancel});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFBB0000),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: FlatButton(
                onPressed: functionCancel,
                child: Text(
                  "Cancelar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFF3BA8AA),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: FlatButton(
              onPressed: functionSave,
              child: Text(
                "Salvar",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
