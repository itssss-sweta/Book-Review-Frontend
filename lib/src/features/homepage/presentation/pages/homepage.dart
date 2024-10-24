import 'package:book_review/src/core/route/routes_name.dart';
import 'package:book_review/src/core/utils/constant/ui_texts.dart';
import 'package:book_review/src/core/utils/loading_dialog.dart';
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
  const HomePage({super.key});

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
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              UiTexts.logo,
              width: 60,
              height: 60,
            ),
            Text(
              'Shelf Speak',
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ],
        ),
        scrolledUnderElevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
          IconButton(
              onPressed: () {
                context.read<HomePageBloc>().add(LogoutEvent());
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: BlocListener<HomePageBloc, HomePageState>(
          listener: (context, state) {
            if (state.isLoggingOut) {
              LoadingDialog.showLoadingDialog(context,
                  loadingTitle: 'Logging out...');
            } else if (state.logoutSuccessful) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RoutesName.login,
                (route) => false,
              );
            }
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SectionTitleRowWidget(
                  title: 'Top Trending Books',
                  onPressed: () {},
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
                  onPressed: () {},
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
                  onPressed: () {},
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
          )),
    );
  }
}
