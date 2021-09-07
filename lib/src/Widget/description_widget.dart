import 'package:app/src/Config/palette.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Palette.cinza),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'título',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
