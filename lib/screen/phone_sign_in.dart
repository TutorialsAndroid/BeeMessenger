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
      backgroundColor: Colors.yellow,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
      )
  );

  String countryButtonText = "Select your country";
  bool phoneNumberInputFieldVisibility = false;
  Color countryPickerDialogBgColor = Colors.white;
  Color phoneNumberInputFieldHintTextColor = Colors.white;

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

  void _setUiComponentsColors() {
    if (Theme.of(context).brightness == Brightness.dark) {
      // The app is in dark mode
      setState(() {
        countryPickerDialogBgColor = Colors.black;
        phoneNumberInputFieldHintTextColor = Colors.white;
      });
    } else {
      // The app is in light mode
      setState(() {
        countryPickerDialogBgColor = Colors.white;
        phoneNumberInputFieldHintTextColor = Colors.black;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _setUiComponentsColors();
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
                      countryListTheme: CountryListThemeData(
                        flagSize: 25,
                        backgroundColor: countryPickerDialogBgColor,
                        textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
                        bottomSheetHeight: 500, // Optional. Country list modal height
                        //Optional. Sets the border radius for the bottom-sheet.
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        //Optional. Styles the search field.
                        inputDecoration: const InputDecoration(
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
                          labelStyle: TextStyle(color: Colors.blueGrey),
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
                    child: Text(
                        countryButtonText,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black
                        ),
                    ),
                  ),
              ),
            ),

            const SizedBox(height: 20),

            Visibility(
                visible: phoneNumberInputFieldVisibility,
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                    borderSide: BorderSide(color: Colors.blueGrey, width: 1.0)
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                    borderSide:  BorderSide(color: Colors.blueGrey, width: 1.0 )
                                ),
                                border: const OutlineInputBorder(),
                                hintText: 'Enter your phone number',
                                hintStyle: TextStyle(
                                    color: phoneNumberInputFieldHintTextColor
                                )
                            ),
                          ),
                        )
                    ),

                    FloatingActionButton(
                      backgroundColor: Colors.yellow,
                        child: const Icon(
                            Icons.navigate_next_outlined,
                          color: Colors.black,
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