import 'package:book_review/src/core/route/routes_name.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_event.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_state.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/book_list_view_widget.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/genre_section.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/section_title_row_widget.dart';
import 'package:book_review/src/shared/presentation/widgets/listview_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomePageBloc>().add(DataFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SectionTitleRowWidget(
            title: 'Top Trending Books',
            onPressed: () {
              final bookList =
                  context.read<HomePageBloc>().state.trendingBookList;
              Navigator.of(context).pushNamed(RoutesName.viewAll, arguments: {
                "title": "Top Trending Books",
                "bookList": bookList,
              });
            },
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<HomePageBloc, HomePageState>(
              builder: (context, state) {
            if (state.isLoadingTrendingBooks) {
              return const ListviewShimmer();
            } else if (state.trendingBookList != null) {
              final bookList = state.trendingBookList;
              return BookListViewWidget(bookList: bookList);
            } else if (state.trendingBookError != null) {
              return Center(
                child: Text(state.trendingBookError!),
              );
            }
            return const SizedBox();
          }),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Browse By Genre',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: GenreSection(),
        ),
        SliverToBoxAdapter(
          child: SectionTitleRowWidget(
            title: 'Recommended For You',
            onPressed: () {
              final bookList =
                  context.read<HomePageBloc>().state.recommendedBookList;
              Navigator.of(context).pushNamed(RoutesName.viewAll, arguments: {
                "title": 'Recommended For You',
                "bookList": bookList,
              });
            },
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<HomePageBloc, HomePageState>(
              builder: (context, state) {
            if (state.isLoadingRecommendedBooks) {
              return const ListviewShimmer();
            } else if (state.recommendedBookList != null) {
              final bookList = state.recommendedBookList!;
              return BookListViewWidget(bookList: bookList);
            } else if (state.recommendeBookError != null) {
              return Center(
                child: Text(state.recommendeBookError!),
              );
            }
            return const SizedBox();
          }),
        ),
        SliverToBoxAdapter(
          child: SectionTitleRowWidget(
            title: 'Recently Updated',
            onPressed: () {
              final bookList = context.read<HomePageBloc>().state.newBookList;
              Navigator.of(context).pushNamed(RoutesName.viewAll, arguments: {
                "title": 'Recently Updated',
                "bookList": bookList,
              });
            },
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<HomePageBloc, HomePageState>(
              builder: (context, state) {
            if (state.isLoadingNewBooks) {
              return const ListviewShimmer();
            } else if (state.newBookList != null) {
              final bookList = state.newBookList!;
              return BookListViewWidget(bookList: bookList);
            } else if (state.newBookError != null) {
              return Center(
                child: Text(state.newBookError!),
              );
            }
            return const SizedBox();
          }),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
      ],
    );
  }
}
