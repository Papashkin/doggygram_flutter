import 'package:flutter/material.dart';

import 'error_type.dart';

class ErrorView extends StatelessWidget {
  final ErrorType type;

  const ErrorView(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.warning_rounded, size: 48),
            SizedBox(height: 10),
            Text(
              type.toMessage(),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
