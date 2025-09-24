import 'package:flutter/material.dart';
import 'package:smarthealthcare/src/model/contact_details.dart';
import 'package:smarthealthcare/src/model/emergency_contact.dart';
import 'package:smarthealthcare/src/model/registration_response.dart';
import 'package:smarthealthcare/src/theme/light_color.dart';
import 'package:smarthealthcare/src/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactInfo extends StatefulWidget {
  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late AuthViewModel authViewModel;
  String? userId;
  bool isLoading = false;

  List<String> emergencyList = [];
  List<TextEditingController> emergencyContactPersonList = [];
  List<TextEditingController> emergencyContactNumber = [];

  TextEditingController postalCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emergencyList.add('emergency'); // initial contact slot
    emergencyContactPersonList.add(TextEditingController());
    emergencyContactNumber.add(TextEditingController());
    getCustomerInfo(context);
  }

  @override
  void dispose() {
    postalCodeController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();

    for (var c in emergencyContactPersonList) {
      c.dispose();
    }
    for (var c in emergencyContactNumber) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios, color: ColorResources.themeRed),
        ),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Contact Information',
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ),
      body: contactBody(context),
    );
  }

  Widget contactBody(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact information\n',
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorResources.themeRed,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Please fill the below details\n',
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorResources.lightBlack,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'Our doctors can directly provide emergency service to your location, if necessary',
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorResources.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: postalCodeController,
                    decoration: InputDecoration(
                      labelText: "My postal code",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                    ),
                    validator: (val) =>
                        val!.isEmpty ? "Postal code can't be empty" : null,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 7),
                  TextFormField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      labelText: "My Phone number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                    ),
                    validator: (val) =>
                        val!.isEmpty ? "Phone number can't be empty" : null,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 7),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                      labelText: "My Address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                    ),
                    validator: (val) =>
                        val!.isEmpty ? "Address can't be empty" : null,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'On emergency',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  const Divider(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: emergencyList.length,
                    itemBuilder: (context, index) {
                      return emergencyWidgetItem(context, index);
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        emergencyList.add('a');
                        emergencyContactPersonList.add(TextEditingController());
                        emergencyContactNumber.add(TextEditingController());
                      });
                    },

                    child: Text("Add+"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorResources.themeRed, // Button color
                      foregroundColor: Colors.white, // Text color
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          9,
                        ), // Rounded corners
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        child: Text("Save"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              ColorResources.themeRed, // Button color
                          foregroundColor: Colors.white, // Text color
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              9,
                            ), // Rounded corners
                          ),
                        ),
                        onPressed: () {
                          if (postalCodeController.text.isEmpty) {
                            showSnakbar(context, 'Please enter postal code');
                          } else if (phoneNumberController.text.isEmpty) {
                            showSnakbar(context, 'Please enter phone number');
                          } else if (addressController.text.isEmpty) {
                            showSnakbar(context, 'Please enter address');
                          } else {
                            saveContact(context);
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
        loading(context),
      ],
    );
  }

  Widget emergencyWidgetItem(BuildContext context, int index) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '#${index + 1}',
              style: TextStyle(fontSize: 16, color: ColorResources.lightBlack),
            ),
          ),
        ),
        TextFormField(
          controller: emergencyContactPersonList[index],
          decoration: InputDecoration(
            labelText: "Emergency Contact person name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.0),
            ),
          ),
          validator: (val) =>
              val!.isEmpty ? "Contact person name can't be empty" : null,
        ),
        const SizedBox(height: 7),
        TextFormField(
          controller: emergencyContactNumber[index],
          decoration: InputDecoration(
            labelText: "Emergency Contact Number",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.0),
            ),
          ),
          validator: (val) =>
              val!.isEmpty ? "Contact number can't be empty" : null,
          keyboardType: TextInputType.number,
        ),
        const Divider(),
      ],
    );
  }

  void getCustomerInfo(BuildContext context) async {
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    userId = customerInfo.getString('id');

    if (userId != null) {
      getContactDetails(context);
    }
  }

  Widget loading(BuildContext context) {
    return isLoading
        ? Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: ColorResources.white.withOpacity(0.3),
            child: Center(
              child: SizedBox(
                width: 120,
                height: 120,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorResources.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: ColorResources.lightBlue.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/loading.gif',
                        height: 300,
                        width: 300,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  void showSnakbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: ColorResources.themeRed,
        content: Text(message, style: TextStyle(color: ColorResources.white)),
      ),
    );
  }

  saveContact(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    List<EmergencyContactList> emergencyContactList = [];
    for (int i = 0; i < emergencyList.length; i++) {
      emergencyContactList.add(
        EmergencyContactList(
          emergencyContactPerson: emergencyContactPersonList[i].text,
          emergencyContactPhone: emergencyContactNumber[i].text,
        ),
      );
    }

    Emergency emergency = Emergency(
      postcode: postalCodeController.text,
      userid: userId!,
      address: addressController.text,
      userphone: phoneNumberController.text,
      createdBy: userId!,
      emergencyList: emergencyContactList, createdAt: DateTime.now(),
    );



    RegistrationResponse response = await authViewModel.saveEmergencyContact(
      emergency,
    );

    setState(() {
      isLoading = false;
    });
    Navigator.pop(context);
    print(response.message);
  }

  void getContactDetails(BuildContext context) async {
    ContactDetails contactDetails = await authViewModel.getContactDetails(
      userId!,
    );

    setState(() {
      isLoading = false;
      phoneNumberController.text = contactDetails.userphone;
      postalCodeController.text = contactDetails.postcode;
      addressController.text = contactDetails.address;
    });

    for (int i = 0; i < contactDetails.emergencyList.length; i++) {
      //emergencyList.add(contactDetails.emergencyList[i].id!);
      emergencyContactPersonList.add(TextEditingController());
      emergencyContactNumber.add(TextEditingController());
    }

    for (int i = 0; i < contactDetails.emergencyList.length; i++) {
      emergencyContactPersonList[i].text =
          contactDetails.emergencyList[i].emergencyContactPerson;
      emergencyContactNumber[i].text =
          contactDetails.emergencyList[i].emergencyContactPhone;
    }

    setState(() {});
  }
}
