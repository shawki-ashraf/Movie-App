import 'package:firebase/feturas/shared/custom_text.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String image;
  final String year;

  const ProductCard({
    super.key,
    required this.name,
    required this.image,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 41, 40, 40),
        borderRadius: BorderRadius.circular(14),
      ),
      height: 300,
      width: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Image + Favorite
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(14),
                  bottom: Radius.circular(14),
                ),
                child: Image.network(
                  image,
                  height: 190,
                  width: 200,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.favorite_border, size: 18),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          /// Name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),

                CustomText(
                  text: year,
                  size: 10,
                  color: Colors.white,
                  weight: FontWeight.w400,
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),

          /// Price
          ///
        ],
      ),
    );
  }
}
