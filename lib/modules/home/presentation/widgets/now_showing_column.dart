import 'package:flutter/material.dart';
import 'package:movie_bloc/modules/home/presentation/widgets/rating_view.dart';

class NowShowingColumn extends StatelessWidget {
  final Function() onTapped;

  const NowShowingColumn({
    super.key,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        width: 144,
        child: InkWell(
          
          borderRadius: BorderRadius.circular(8),
          onTap: () {},
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: double.infinity,
                height: 212,
              ),
              const SizedBox(height: 2),
              const Text(
                maxLines: 2,
                "Spiderman: No Way Home",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 2),
              const RatingView(),
            ],
          ),
        ),
      ),
    );
  }
}
