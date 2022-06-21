import 'package:flutter/material.dart';

class SimpleLoaderWidget extends StatelessWidget {
  final String? message;
  final Color? color;

  const SimpleLoaderWidget({required Key key, this.message, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    color ?? Theme.of(context).primaryColor),
              ),
              message == null
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        message ?? '',
                        textAlign: TextAlign.center,
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
