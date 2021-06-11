import "package:flutter/material.dart";

class ErrorComponent extends StatelessWidget {
  final String errorMessage;

  ErrorComponent({@required this.errorMessage});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            this.errorMessage,
            textAlign: TextAlign.center,
          ),
          Text(
            "You will be redirected to the previous page",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
