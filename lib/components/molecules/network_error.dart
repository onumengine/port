import "package:flutter/material.dart";

class NetworkErrorComp extends StatelessWidget {
  VoidCallback onTap;

  NetworkErrorComp({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Center(
        child: Text("Unable to connect. Tap to retry"),
      ),
    );
  }
}
