import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class PhoneSignIn extends StatelessWidget {
  const PhoneSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.bottomCenter,
          child: const Padding(
            padding: EdgeInsets.all(30),
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide: BorderSide(color: Colors.blueGrey, width: 1.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:  BorderSide(color: Colors.blueGrey, width: 1.0 )
                  ),
                  border: OutlineInputBorder(),
                  hintText: 'Enter your phone number',
                  hintStyle: TextStyle(
                    color: Colors.black
                  )
              ),
            ),
          )

        )
    );
  }

}