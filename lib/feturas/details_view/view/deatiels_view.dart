import 'package:firebase/feturas/shared/custom_bottom.dart';
import 'package:firebase/feturas/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class DeatielsView extends StatefulWidget {
  final String name;
  final String dec;
  final String type;
  final double rate;
  final String imageURL;
  final String uRL;
  final String year;

  const DeatielsView({
    super.key,
    required this.name,
    required this.dec,
    required this.type,
    required this.rate,
    required this.imageURL,
    required this.uRL,
    required this.year,
  });

  @override
  State<DeatielsView> createState() => _DeatielsViewState();
}

class _DeatielsViewState extends State<DeatielsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 40, 40),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// ================= IMAGE SECTION =================
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 650,
                  child: Image.network(widget.imageURL, fit: BoxFit.fill),
                ),

                /// Gradient overlay
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 120,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color.fromARGB(255, 41, 40, 40),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),

                /// Back button
                Positioned(
                  top: MediaQuery.of(context).padding.top + 8,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// ================= CONTENT SECTION =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Gap(16),

                  /// Movie name
                  CustomText(
                    text: widget.name,
                    size: 25,
                    color: Colors.white,
                    weight: FontWeight.bold,
                  ),

                  const Gap(8),

                  /// Type - Rate - Duration
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: widget.type,
                        size: 16,
                        color: Colors.white,
                        weight: null,
                      ),
                      const Gap(12),
                      CustomText(
                        text: "${widget.rate} ⭐",
                        size: 16,
                        color: Colors.white,
                        weight: null,
                      ),
                      const Gap(12),
                      CustomText(
                        text: widget.year,
                        size: 16,
                        color: Colors.white,
                        weight: null,
                      ),
                    ],
                  ),

                  const Gap(16),

                  /// Description
                  Center(
                    child: CustomText(
                      text: widget.dec,
                      size: 13,
                      color: const Color.fromARGB(191, 255, 255, 255),
                      weight: FontWeight.normal,
                    ),
                  ),

                  const Gap(12),

                  /// Watch now button
                  WatchNowButton(
                    onPressed: () {
                      _launchUrl(widget.uRL);
                    },
                  ),

                  const Gap(40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);

  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}
