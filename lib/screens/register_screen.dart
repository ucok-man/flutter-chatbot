import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:chatbot/services/asset_manager.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
  Country pickedCountry = Country(
    phoneCode: '62',
    countryCode: 'ID',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Indonesia',
    example: '8123456789',
    displayName: 'Indonesia (ID) +62',
    displayNameNoCountryCode: 'Indonesia',
    e164Key: '62',
  );
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 80,
                    backgroundImage: AssetImage(AssetManager.botIcon),
                  ),

                  SizedBox(height: 20),

                  Text(
                    "Register",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 20),

                  Text(
                    "Add your phone number. We will send you a verification code.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),

                  SizedBox(height: 30),

                  TextFormField(
                    controller: phoneController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      hintText: 'Enter phone number...',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.purpleAccent),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.fromLTRB(16, 12.5, 6, 0),
                        child: InkWell(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              countryListTheme: CountryListThemeData(
                                bottomSheetHeight: 450,
                              ),
                              onSelect: (value) {
                                setState(() {
                                  pickedCountry = value;
                                });
                              },
                            );
                          },
                          child: Text(
                            "${pickedCountry.flagEmoji} +${pickedCountry.phoneCode}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RoundedLoadingButton(
                      color: Colors.purpleAccent.shade700,
                      controller: btnController,
                      onPressed: () {},
                      child: Text(
                        "Send",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 1.5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
