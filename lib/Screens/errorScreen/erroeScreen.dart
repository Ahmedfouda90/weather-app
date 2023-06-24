import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            child: ElevatedButton(
                child: Icon(Icons.add),
                onPressed: () {
                  final snackBar = SnackBar(
                    content: const Text('Hi, I am a SnackBar!'),
                    backgroundColor: (Colors.black12),
                    action: SnackBarAction(
                      label: 'dismiss',
                      onPressed: () {},
                    ),
                  );
                })));
  }
}*/
class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('Hi, I am a SnackBar!'),
            backgroundColor: (Colors.white70),
            action: SnackBarAction(
              label: 'dismiss',
              onPressed: () {
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text(
          'Click to Display a SnackBar',
        ),
      ),
    );
  }}