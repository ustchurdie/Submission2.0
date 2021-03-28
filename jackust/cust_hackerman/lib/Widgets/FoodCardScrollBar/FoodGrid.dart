import 'dart:math';

import 'package:cust_hackerman/Widgets/FoodCardScrollBar/FoodCard.dart';
import 'package:flutter/material.dart';

class FoodBar extends StatelessWidget {

  final Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return Expanded(
            flex: 15,
            child: Container(
              color: Colors.yellow[100],
              child: CustomScrollView(
                scrollDirection: Axis.horizontal,
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.all(8.0),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 1.0,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return FoodCard(
                            rating:
                                (random.nextDouble() * 5).toStringAsFixed(1),
                            review: random.nextInt(100),
                            index: random.nextInt(3),
                          );
                        },
                        childCount: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}