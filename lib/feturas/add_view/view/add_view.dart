import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../cubit/add_data_cubit.dart';
import '../widgets/custom_textfield.dart';
import '../../home_view/models/movies_model.dart';
import '../../shared/custom_bottom.dart';
import '../../shared/custom_text.dart';

enum ContentType { movie, series }

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  final _formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final dec = TextEditingController();
  final image = TextEditingController();
  final url = TextEditingController();
  final rate = TextEditingController();
  final type = TextEditingController();
  final year = TextEditingController();

  ContentType selectedType = ContentType.movie;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddDataCubit(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 41, 40, 40),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 41, 40, 40),
          centerTitle: true,
          title: const CustomText(
            text: "Add Movie / Series",
            size: 20,
            color: Colors.orange,
            weight: FontWeight.bold,
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextfield(
                  hint: "Name",
                  controller: name,
                  icon: const Icon(Icons.movie),
                  isRequired: true,
                ),
                CustomTextfield(
                  hint: "Description",
                  controller: dec,
                  icon: const Icon(Icons.description),
                  isRequired: true,
                ),
                CustomTextfield(
                  hint: "Image",
                  controller: image,
                  icon: const Icon(Icons.image),
                  isRequired: true,
                ),
                CustomTextfield(
                  hint: "Link",
                  controller: url,
                  icon: const Icon(Icons.link),
                  isRequired: true,
                ),
                CustomTextfield(
                  hint: "Rate",
                  controller: rate,
                  icon: const Icon(Icons.rate_review),
                  isRequired: true,
                ),
                CustomTextfield(
                  hint: "Year",
                  controller: year,
                  icon: const Icon(Icons.date_range),
                  isRequired: true,
                ),

                const Gap(20),

                // 🔽 اختيار Movie أو Series
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: RadioListTile<ContentType>(
                          value: ContentType.movie,
                          groupValue: selectedType,
                          activeColor: Colors.orange,
                          title: const Text(
                            "Movie",
                            style: TextStyle(color: Colors.white),
                          ),
                          onChanged: (val) {
                            setState(() {
                              selectedType = val!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<ContentType>(
                          value: ContentType.series,
                          groupValue: selectedType,
                          activeColor: Colors.orange,
                          title: const Text(
                            "Series",
                            style: TextStyle(color: Colors.white),
                          ),
                          onChanged: (val) {
                            setState(() {
                              selectedType = val!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const Gap(20),

                BlocConsumer<AddDataCubit, AddDataState>(
                  listener: (context, state) {
                    if (state is Dataloaded) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Added successfully ✅")),
                      );
                      Navigator.pop(context);
                    } else if (state is DataError) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.error)));
                    }
                  },
                  builder: (context, state) {
                    if (state is Dataloading) {
                      return const CircularProgressIndicator(
                        color: Colors.orange,
                      );
                    }

                    return WatchNowButton(
                      text: "Add",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final movie = MoviesModel(
                            name: name.text,
                            dec: dec.text,
                            imageUrl: image.text,
                            url: url.text,
                            type: selectedType.name,
                            year: year.text,
                            rate: double.tryParse(rate.text) ?? 0,
                          );

                          if (selectedType == ContentType.movie) {
                            context.read<AddDataCubit>().senddata(movie);
                          } else {
                            context.read<AddDataCubit>().senddata2(movie);
                          }
                        }
                      },
                    );
                  },
                ),

                const Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
