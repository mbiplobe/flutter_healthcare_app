import 'package:flutter/material.dart';

class CustomSnackbarExample extends StatelessWidget {
  void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.white),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.teal,
      behavior: SnackBarBehavior.floating, // Makes it float
      margin: EdgeInsets.all(16), // Adds margin around snackbar
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Snackbar")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showSnackbar(context, "This is a custom snackbar!"),
          child: Text("Show Snackbar"),
        ),
      ),
    );
  }
}
