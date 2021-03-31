import 'package:flutter/material.dart';

Widget loadingWidget() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircularProgressIndicator(),
    ),
  );
}

Widget errorWidget({Function(BuildContext)? onRetryClicked}) {
  return Center(
    child: Builder(
      builder: (context) => Center(
        child: InkWell(
          onTap: () {
            if (onRetryClicked != null) {
              onRetryClicked(context);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.error,
                  color: Colors.redAccent,
                  size: 48,
                ),
                Text("Click here to retry")
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
