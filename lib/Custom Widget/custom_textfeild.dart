import 'package:flutter/material.dart';

class CustomTextfeild extends StatelessWidget {
  final int? maxLine;
  final String tittle;
  final double? textsize;
  final FontWeight? fontWeight;
  final double? hinttextsize;
  final FontWeight? hintfontWeight;
  final TextInputType inputType;

  final TextEditingController textEditingController;

  const CustomTextfeild({
    super.key,
    this.maxLine,
    required this.tittle,
    this.textsize,
    this.fontWeight,
    this.hinttextsize,
    this.hintfontWeight,
     required this.textEditingController, required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onSurface,
              blurRadius: 1,
              spreadRadius: 0.5,
              blurStyle: BlurStyle.normal,
            )
          ]),
      child: Center(
        child: TextFormField(
          controller: textEditingController,
          keyboardType:inputType,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: fontWeight,
              fontSize: textsize,
              wordSpacing: 1.5),
          maxLines: maxLine,
          minLines: 1,
          decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: hinttextsize,
                fontWeight: hintfontWeight,
              ),
              hintText: tittle,
              contentPadding: const EdgeInsets.all(10),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
