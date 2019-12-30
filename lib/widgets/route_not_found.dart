import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RouteNotFoundScreen extends StatelessWidget {
  const RouteNotFoundScreen(this.routeName);

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).errorColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).errorColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              '404 \n"$routeName" not found',
              style: TextStyle(color: Colors.white, fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            Icon(
              FontAwesomeIcons.exclamationTriangle,
              color: Colors.white,
              size: 72,
            )
          ],
        ),
      ),
    );
  }
}
