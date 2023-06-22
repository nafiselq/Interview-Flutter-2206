import 'package:flutter/material.dart';
import 'package:flutter_01_test/shared/theme.dart';
import 'package:shimmer/shimmer.dart';

Widget showShimmerCardArticles() {
  return Container(
    margin: const EdgeInsets.all(10),
    child: Shimmer.fromColors(
        baseColor: greyShimmer,
        highlightColor: Colors.white60,
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kTextInput.withOpacity(0.23),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xff989898),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xff989898),
                      ),
                      width: double.infinity,
                      height: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xff989898),
                  ),
                  width: double.infinity,
                  height: 40,
                ),
              ),
              const SizedBox(height: 14),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xff989898),
                  ),
                  width: 180,
                  height: 40,
                ),
              ),
            ],
          ),
        )),
  );
}

Widget showShimmerArticles() {
  return Shimmer.fromColors(
    baseColor: greyShimmer,
    highlightColor: Colors.white60,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color(0xff989898),
          ),
          width: 180,
          height: 19,
        ),
        Container(
          width: 210,
          height: 152,
          margin: EdgeInsets.only(
              right: defaultMargin, top: defaultMargin, bottom: defaultMargin),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xff989898),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    ),
  );
}

Widget showShimmerHeaderTextHome() {
  return Shimmer.fromColors(
    baseColor: greyShimmer,
    highlightColor: Colors.white60,
    child: Container(
      margin: const EdgeInsets.only(top: 15, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xff989898),
      ),
      width: 250,
      height: 40,
    ),
  );
}
