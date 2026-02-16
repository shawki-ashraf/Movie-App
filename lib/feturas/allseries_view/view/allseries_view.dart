import 'package:firebase/feturas/details_view/view/deatiels_view.dart';
import 'package:firebase/feturas/home_view/cubit/home_cubit.dart';
import 'package:firebase/feturas/shared/custom_cart.dart';
import 'package:firebase/feturas/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllseriesView extends StatefulWidget {
  const AllseriesView({super.key});

  @override
  State<AllseriesView> createState() => _AllseriesViewState();
}

class _AllseriesViewState extends State<AllseriesView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getMovies(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 41, 40, 40),
          centerTitle: true,

          title: const CustomText(
            text: "All Series",
            size: 25,
            color: Colors.white,
            weight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 41, 40, 40),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return SingleChildScrollView();
            } else if (state is HomeFailure) {
              return Center(child: Text(state.error));
            } else if (state is HomeSuccess) {
              final alldata = state.series;
              if (alldata.isEmpty) {
                return Center(
                  child: Text(
                    "NO Series ",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: alldata.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // عمودين
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 5,
                    childAspectRatio: 0.8, // شكل الكارت
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DeatielsView(
                              name: alldata[index].name,
                              dec: alldata[index].dec,
                              type: alldata[index].type,
                              rate: alldata[index].rate,
                              imageURL: alldata[index].imageUrl,
                              uRL: alldata[index].url,
                              year: alldata[index].year,
                            ),
                          ),
                        );
                      },
                      child: ProductCard(
                        name: alldata[index].name,
                        image: alldata[index].imageUrl,
                        year: alldata[index].year,
                      ),
                    );
                  },
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
