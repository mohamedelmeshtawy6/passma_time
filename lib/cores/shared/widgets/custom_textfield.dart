import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    
    super.key,
    required this.text,
   
    this.hint,
    this.onsave,
    this.validate,this.obsecure=false

  });
 
  final String text;
  final String? hint;
  final bool obsecure;
  final Function(String?)? onsave;
  final String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          color: Colors.grey,
          fontSize: 14,
        ),
        TextFormField(
         
          obscureText: obsecure,
          onSaved: onsave,
          validator: validate,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey),
              fillColor: Colors.white),
        )
      ],
    );
  }
}
