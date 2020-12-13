import 'package:flutter/material.dart';

class FieldsCommun extends StatelessWidget {
  final String labelText;
  final String labelTextSubField;
  final Function function;
  double valueSize;
  final TextEditingController nameSymptomController;
  FieldsCommun(
      {this.labelText,
      this.labelTextSubField,
      this.function,
      this.valueSize,
      this.nameSymptomController});

  @override
  Widget build(BuildContext context) {
    if (valueSize == null) {
      valueSize = 350;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - valueSize,
          child: TextFormField(
            controller: nameSymptomController,
            decoration: InputDecoration(labelText: labelText),
          ),
        ),
        Spacer(),
        Column(
          children: [
            GestureDetector(
              onTap: function,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Icon(Icons.add),
              ),
            ),
            Text(labelTextSubField),
          ],
        ),
      ],
    );
  }
}
