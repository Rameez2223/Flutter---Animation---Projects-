import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiHelper {
  static customButton({required VoidCallback callback,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
        ),
        child: ElevatedButton( onPressed:callback , child:Center(child: Text(text)))
      ),
    );
  }
}
