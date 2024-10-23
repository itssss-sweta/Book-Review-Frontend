import 'package:book_review/src/core/route/routes_name.dart';
import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/core/utils/constant/ui_texts.dart';
import 'package:book_review/src/core/utils/loading_dialog.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_event.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_state.dart';
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
            if (state.isLoadingBooks || state.isLoadingGenres) {
              const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.isLoggingOut) {
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Top Trending Books',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 200,
                  child: BlocBuilder<HomePageBloc, HomePageState>(
                      builder: (context, state) {
                    if (state.isLoadingBooks) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.bookList != null) {
                      final bookList = state.bookList;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: bookList!.books?.length ?? 0,
                        itemBuilder: (context, index) {
                          final book = bookList.books?[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                Image.network(book?.imageUrl ?? '',
                                    height: 120, width: 80),
                                Text(book?.title ?? 'No Title'),
                                Text(book?.author ?? 'Unknown Author'),
                              ],
                            ),
                          );
                        },
                      );
                    } else if (state.bookError != null) {
                      return Center(
                        child: Text(state.bookError!),
                      );
                    }
                    return const SizedBox();
                  }),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Genres',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 120, // Set a fixed height for horizontal list
                  child: BlocBuilder<HomePageBloc, HomePageState>(
                      builder: (context, state) {
                    if (state.isLoadingGenres) {
                      return const Center(child: CircularProgressIndicator());
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
                                        ?.copyWith(
                                            color: AppColors.backgroundColor),
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
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Recommended For You',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 200, // Set a fixed height for horizontal list
                  child: BlocBuilder<HomePageBloc, HomePageState>(
                      builder: (context, state) {
                    if (state.isLoadingBooks) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.bookList != null) {
                      final bookList = state.bookList!;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: bookList.books?.length ?? 0,
                        itemBuilder: (context, index) {
                          final book = bookList.books?[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                Image.network(book?.imageUrl ?? '',
                                    height: 120, width: 80),
                                Text(book?.title ?? 'No Title'),
                                Text(book?.author ?? 'Unknown Author'),
                              ],
                            ),
                          );
                        },
                      );
                    } else if (state.bookError != null) {
                      return Center(
                        child: Text(state.bookError!),
                      );
                    }
                    return const SizedBox();
                  }),
                ),
              ),
            ],
          )),
    );
  }
}
