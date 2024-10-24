import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_state.dart';
import 'package:book_review/src/shared/presentation/widgets/listview_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenreSection extends StatelessWidget {
  const GenreSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child:
          BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
        if (state.isLoadingGenres) {
          return const ListviewShimmer(
            contentHeight: 100,
            contentWidth: 150,
            boxHeight: 100,
          );
        } else if (state.genreList != null) {
          final genreList = state.genreList!;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: genreList.genres?.length,
            itemBuilder: (context, index) {
              final genre = genreList.genres?[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Image.network(
                      genre?.image ?? '',
                      height: 100,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Text(
                        genre?.name ?? 'No Title',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: AppColors.backgroundColor),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        } else if (state.genreError != null) {
          return Center(
            child: Text(state.genreError!),
          );
        }
        return const SizedBox();
      }),
    );
  }
}
