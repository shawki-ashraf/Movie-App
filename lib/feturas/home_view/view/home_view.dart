import 'package:firebase/feturas/add_view/view/add_view.dart';
import 'package:firebase/feturas/allmovies_view/view/allmovies_view.dart';
import 'package:firebase/feturas/allseries_view/view/allseries_view.dart';
import 'package:firebase/feturas/details_view/view/deatiels_view.dart';
import 'package:firebase/feturas/home_view/cubit/grid_cubit.dart';
import 'package:firebase/feturas/home_view/cubit/home_cubit.dart';
import 'package:firebase/feturas/home_view/widgets/catogry_.dart';
import 'package:firebase/feturas/home_view/widgets/custom_serch.dart';
import 'package:firebase/feturas/shared/custom_cart.dart';
import 'package:firebase/feturas/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()..getMovies()),
        BlocProvider(create: (context) => GridCubit()..getMovie()),
      ],
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 41, 40, 40),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 16),
                    Expanded(
                      child: TextfieldData(
                        add: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddView()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                CustomText(
                  text: "Categories",
                  size: 22,
                  color: Colors.white,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 10),

                Catogry(
                  catogry: [
                    'Action',
                    'Love',
                    'Drama',
                    'Romantic',
                    'Adventure ',
                  ],
                  selectedindex: 0,
                  onCategorySelected: (index) {},
                ),

                Gap(10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Movies",
                      size: 22,
                      color: Colors.white,
                      weight: FontWeight.bold,
                    ),

                    GestureDetector(
                      onDoubleTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllmoviesView(),
                        ),
                      ),
                      child: CustomText(
                        text: "See All",
                        size: 14,
                        color: const Color.fromARGB(194, 255, 111, 0),
                        weight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                SizedBox(
                  height: 240,
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is HomeFailure) {
                        return Center(child: Text(state.error));
                      } else if (state is HomeSuccess) {
                        final movies = state.movies;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DeatielsView(
                                        name: movies[index].name,
                                        dec: movies[index].dec,
                                        type: movies[index].type,
                                        rate: movies[index].rate,
                                        imageURL: movies[index].imageUrl,
                                        uRL: movies[index].url,
                                        year: movies[index].year,
                                      ),
                                    ),
                                  );
                                },
                                child: ProductCard(
                                  name: movies[index].name,
                                  image: movies[index].imageUrl,
                                  year: movies[index].year,
                                ),
                              ),
                            );
                          },
                        );
                      }

                      return const Center(child: Text("No movies available"));
                    },
                  ),
                ),

                Gap(10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Series",
                      size: 22,
                      color: Colors.white,
                      weight: FontWeight.bold,
                    ),

                    GestureDetector(
                      onDoubleTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllseriesView(),
                        ),
                      ),
                      child: CustomText(
                        text: "See All",
                        size: 14,
                        color: const Color.fromARGB(194, 255, 111, 0),
                        weight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                SizedBox(
                  height: 240,
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is HomeFailure) {
                        return Center(child: Text(state.error));
                      }

                      if (state is HomeSuccess) {
                        final series = state.series;

                        if (series.isEmpty) {
                          return const Center(
                            child: Text("No series available"),
                          );
                        }

                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: series.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => DeatielsView(
                                        name: series[index].name,
                                        dec: series[index].dec,
                                        type: series[index].type,
                                        rate: series[index].rate,
                                        imageURL: series[index].imageUrl,
                                        uRL: series[index].url,
                                        year: series[index].year,
                                      ),
                                    ),
                                  );
                                },
                                child: ProductCard(
                                  name: series[index].name,
                                  image: series[index].imageUrl,
                                  year: series[index].year,
                                ),
                              ),
                            );
                          },
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "All Movies",
                      size: 22,
                      color: Colors.white,
                      weight: FontWeight.bold,
                    ),

                    CustomText(
                      text: "See All",
                      size: 14,
                      color: const Color.fromARGB(194, 255, 111, 0),
                      weight: FontWeight.w400,
                    ),
                  ],
                ),

                BlocBuilder<GridCubit, GridState>(
                  builder: (context, state) {
                    if (state is GridLoading) {
                      return SingleChildScrollView();
                    } else if (state is GridFailure) {
                      return Center(child: Text(state.error));
                    } else if (state is Gridalldata) {
                      final alldata = state.alldata;
                      if (alldata.isEmpty) {
                        return Center(
                          child: Text(
                            "NO Movies ",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: alldata.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // عمودين
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 5,
                              childAspectRatio: 0.7, // شكل الكارت
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
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
