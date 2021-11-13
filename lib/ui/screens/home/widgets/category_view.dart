// ignore_for_file: file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import '../../../../models/category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/category_provider.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories =
        Provider.of<CategoryProvider>(context).items; // get data from provider
    return Container(
      height: 250,
      child: Column(
        children: [
          Text(
            'Category',
            style: TextStyle(fontSize: 30.0),
          ),
          Expanded(
            child: Container(
              // decoration: BoxDecoration(
              //   color: Colors.grey,
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.blue,
              //       spreadRadius: 5,
              //       blurRadius: 7,
              //       offset: Offset(0, 3), // changes position of shadow
              //     ),
              //   ],
              // ),
              width: double.infinity,
              child: GridView.builder(
                physics: ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryCard(
                    category: categories[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      key: Key(category.id), // used category id as key for the gridtile widget
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
                child: Icon(
              Icons.person,
              size: 50.0,
              color: Colors.blue,
            )),
            Text(
              category.title, // used title of category in category car
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}