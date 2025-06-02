import 'package:flutter/material.dart';

serviceMessage(context, String title, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.green[500], borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline,
            color: Colors.white,
            size: 36,
          ),
          SizedBox(
            width: 36,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$title",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "$message",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ),
          )
        ],
      ),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 3,
  ));
}
