import 'package:flutter/material.dart';

import 'package:movie_bloc/modules/home/presentation/widgets/genere_widget.dart';
import 'package:movie_bloc/modules/home/presentation/widgets/rating_view.dart';
import 'package:movie_bloc/modules/home/presentation/widgets/timer_view.dart';

class PopularRow extends StatelessWidget {
  const PopularRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          height: 120,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              print("tapped");
            },
            child: Row(
              
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey,
                  ),
                  width: 86,
                ),
                const SizedBox(width: 6),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      maxLines: 2,
                      "Spiderman: No Way Home",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    RatingView(),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        GenereWidget(),
                        GenereWidget(),
                        GenereWidget(),
                      ],
                    ),
                    SizedBox(height: 8),
                    TimerView(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
