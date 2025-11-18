import 'dart:io';

import 'package:flutter/material.dart';
import 'package:memories_app/constants/image_constants.dart';

import '../core/utils/app_constants.dart';

class MemoryWidget extends StatelessWidget {
  const MemoryWidget({
    super.key,
    required this.title,
    required this.description,
    required this.city,
    required this.country,
    required this.images,
  });

  final String title;
  final String description;
  final String city;
  final String country;
  final String images;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(appPadding),
      margin: EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(appPadding),
        gradient: LinearGradient(
          colors: [Colors.orangeAccent.withValues(alpha: 0.25), Colors.white],
          stops: [0.1, 1],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            margin: EdgeInsets.only(bottom: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              image: images.isNotEmpty
                  ? DecorationImage(
                image: FileImage(File(images)),
                fit: BoxFit.cover,
              )
                  : null,
              color: images.isEmpty ? Colors.grey[200] : null,
            ),
            child: images.isEmpty
                ? Center(
              child: Icon(
                Icons.photo_library,
                color: Colors.grey[500],
              ),
            )
                : null,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),

              Spacer(),
              Icon(
                Icons.star_border_purple500_sharp,
                color: Colors.blueGrey,
                size: 32,
              ),
            ],
          ),
          Text(
            "$city, $country",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12),
          Text(description, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
