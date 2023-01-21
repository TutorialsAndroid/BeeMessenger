import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class PhoneSignIn extends StatefulWidget {
  const PhoneSignIn({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PhoneSignInState createState() => _PhoneSignInState();
}

class _PhoneSignInState extends State<PhoneSignIn> {

  final ButtonStyle selectCountryButtonStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
      )
  );

  String countryButtonText = "Select your country";
  bool phoneNumberInputFieldVisibility = false;

  void _updateSelectCountryButtonText(String selectedCountry) {
    setState(() {
      countryButtonText = selectedCountry;
    });
  }

  void _phoneNumberInputFieldVisibility(bool inputFieldVisibility) {
    setState(() {
      phoneNumberInputFieldVisibility = inputFieldVisibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Column children go here
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    showCountryPicker(
                      context: context,
                      countryListTheme: const CountryListThemeData(
                        flagSize: 25,
                        backgroundColor: Colors.white,
                        textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
                        bottomSheetHeight: 500, // Optional. Country list modal height
                        //Optional. Sets the border radius for the bottomsheet.
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        //Optional. Styles the search field.
                        inputDecoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide: BorderSide(color: Colors.blueGrey, width: 1.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide:  BorderSide(color: Colors.blueGrey, width: 1.0 )
                          ),
                          labelText: 'Search',
                          hintText: 'Start typing to search',
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                      showPhoneCode: true, // optional. Shows phone code before the country name.
                      onSelect: (Country country) {
                        _updateSelectCountryButtonText(country.displayName);
                        _phoneNumberInputFieldVisibility(true);
                      },
                    );
                  },
                  style: selectCountryButtonStyle,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(countryButtonText),
                  ),
              ),
            ),

            const SizedBox(height: 20),

            Visibility(
                visible: phoneNumberInputFieldVisibility,
                child: Row(
                  children: [
                    const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(10),
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
                    ),

                    FloatingActionButton(
                        child: const Icon(
                            Icons.navigate_next_outlined
                        ),
                        onPressed: (){
                          //TODO create next screen for otp verification
                        }
                    ),

                    const SizedBox(
                      width: 10,
                    )
                  ],
                )
            )
          ],

        )
    );
  }

}