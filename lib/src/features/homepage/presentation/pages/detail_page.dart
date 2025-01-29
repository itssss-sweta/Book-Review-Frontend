import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/core/utils/show_snackbar.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_state.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/attribute_card.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/book_detail_animated_header_section.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/book_detail_bottom_sheet.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/book_detail_header_section.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/detail_text_section.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/review_widget.dart';
import 'package:book_review/src/shared/presentation/widgets/base_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  final Book book;
  const DetailPage({super.key, required this.book});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController _scrollController;
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    double expandedHeight = Tween<double>(
      begin: MediaQuery.of(context).size.height / 2,
      end: MediaQuery.of(context).size.height / 1.38,
    ).transform((_scrollOffset / 100).clamp(0, 1));
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          physics: _scrollOffset < 100
              ? const BouncingScrollPhysics()
              : const ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              expandedHeight: expandedHeight,
              flexibleSpace: FlexibleSpaceBar(
                background: _scrollOffset < 100
                    ? BookDetailHeaderSection(book: widget.book)
                    : BookDetailAnimatedHeaderSection(book: widget.book),
              ),
            ),
            _scrollOffset < 100
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return _buildDetailContents(context);
                      },
                      childCount: 1,
                    ),
                  )
                : const SliverToBoxAdapter(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reviews',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: 20),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 2.5,
                      child: ListView(
                        children: const [
                          ReviewWidget(
                            rating: 4,
                            reviewDate: '02 Jan,2023',
                            reviewText:
                                'The Midnight Library is an inspiring novel that explores the regrets, "what-ifs," and second chances we all wish for. The story follows Nora Seed, who finds herself in a magical library between life and death, where each book represents a different version of her life based on the choices she could have made. Haig’s writing is beautifully poignant, gently guiding readers to reflect on their own lives and choices. Each alternate life Nora explores reveals valuable lessons about self-acceptance, resilience, and the beauty of imperfection. This novel is both heartwarming and thought-provoking, leaving a lasting impact on how we view our regrets and aspirations. It\'s a must-read for anyone looking for a blend of whimsy and wisdom. Highly recommended!',
                            reviewerName: 'Hannah Al Tah.',
                            profileImageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbBlbNR3fbCKdmVfntZCGYmoeummGXHGIE7w&s',
                          ),
                          ReviewWidget(
                            rating: 4,
                            reviewDate: '02 Jan,2023',
                            reviewText:
                                'skjdfksd fndifjhnskdjfns djfhsidnfsd vsbdviushndivjsdij',
                            reviewerName: 'Hannah Al Tah.',
                            profileImageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbBlbNR3fbCKdmVfntZCGYmoeummGXHGIE7w&s',
                          ),
                          ReviewWidget(
                            rating: 4,
                            reviewDate: '02 Jan,2023',
                            reviewText:
                                'skjdfksd fndifjhnskdjfns djfhsidnfsd vsbdviushndivjsdij',
                            reviewerName: 'Hannah Al Tah.',
                            profileImageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbBlbNR3fbCKdmVfntZCGYmoeummGXHGIE7w&s',
                          ),
                          ReviewWidget(
                            rating: 4,
                            reviewDate: '02 Jan,2023',
                            reviewText:
                                'skjdfksd fndifjhnskdjfns djfhsidnfsd vsbdviushndivjsdij',
                            reviewerName: 'Hannah Al Tah.',
                            profileImageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbBlbNR3fbCKdmVfntZCGYmoeummGXHGIE7w&s',
                          ),
                          ReviewWidget(
                            rating: 4,
                            reviewDate: '02 Jan,2023',
                            reviewText:
                                'skjdfksd fndifjhnskdjfns djfhsidnfsd vsbdviushndivjsdij',
                            reviewerName: 'Hannah Al Tah.',
                            profileImageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbBlbNR3fbCKdmVfntZCGYmoeummGXHGIE7w&s',
                          ),
                          ReviewWidget(
                            rating: 4,
                            reviewDate: '02 Jan,2023',
                            reviewText:
                                'skjdfksd fndifjhnskdjfns djfhsidnfsd vsbdviushndivjsdij',
                            reviewerName: 'Hannah Al Tah.',
                            profileImageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbBlbNR3fbCKdmVfntZCGYmoeummGXHGIE7w&s',
                          ),
                          ReviewWidget(
                            rating: 4,
                            reviewDate: '02 Jan,2023',
                            reviewText:
                                'skjdfksd fndifjhnskdjfns djfhsidnfsd vsbdviushndivjsdij',
                            reviewerName: 'Hannah Al Tah.',
                            profileImageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbBlbNR3fbCKdmVfntZCGYmoeummGXHGIE7w&s',
                          ),
                          ReviewWidget(
                            rating: 4,
                            reviewDate: '02 Jan,2023',
                            reviewText:
                                'skjdfksd fndifjhnskdjfns djfhsidnfsd vsbdviushndivjsdij',
                            reviewerName: 'Hannah Al Tah.',
                            profileImageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbBlbNR3fbCKdmVfntZCGYmoeummGXHGIE7w&s',
                          ),
                          ReviewWidget(
                            rating: 4,
                            reviewDate: '02 Jan,2023',
                            reviewText:
                                'skjdfksd fndifjhnskdjfns djfhsidnfsd vsbdviushndivjsdij',
                            reviewerName: 'Hannah Al Tah.',
                            profileImageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbBlbNR3fbCKdmVfntZCGYmoeummGXHGIE7w&s',
                          ),
                          ReviewWidget(
                            rating: 4,
                            reviewDate: '02 Jan,2023',
                            reviewText:
                                'skjdfksd fndifjhnskdjfns djfhsidnfsd vsbdviushndivjsdij',
                            reviewerName: 'Hannah Al Tah.',
                            profileImageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbBlbNR3fbCKdmVfntZCGYmoeummGXHGIE7w&s',
                          ),
                          ReviewWidget(
                            rating: 4,
                            reviewDate: '02 Jan,2023',
                            reviewText:
                                'skjdfksd fndifjhnskdjfns djfhsidnfsd vsbdviushndivjsdij',
                            reviewerName: 'Hannah Al Tah.',
                            profileImageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbBlbNR3fbCKdmVfntZCGYmoeummGXHGIE7w&s',
                          ),
                          ReviewWidget(
                            rating: 4,
                            reviewDate: '02 Jan,2023',
                            reviewText:
                                'skjdfksd fndifjhnskdjfns djfhsidnfsd vsbdviushndivjsdij',
                            reviewerName: 'Hannah Al Tah.',
                            profileImageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbBlbNR3fbCKdmVfntZCGYmoeummGXHGIE7w&s',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildDetailContents(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12.0),
          _buildBookTitleAuthorSection(context, widget.book),
          const SizedBox(height: 12.0),
          _buildAttributeCardRow(widget.book),
          const SizedBox(height: 12.0),
          DetailTextSection(title: 'Summary', content: widget.book.description),
          const SizedBox(height: 12.0),
          DetailTextSection(title: 'Genre', content: widget.book.genre),
          const SizedBox(height: 12.0),
          BasePrimaryButton(
            buttonColor: AppColors.primaryColor.withOpacity(0.8),
            buttonWidth: MediaQuery.sizeOf(context).width,
            onPressed: () => _showBottomSheet(context, widget.book),
            borderRadius: 8.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add,
                    color: AppColors.backgroundColor, size: 18),
                const SizedBox(width: 4.0),
                Text(
                  'Add to List',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: AppColors.backgroundColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

_buildBookTitleAuthorSection(BuildContext context, Book book) {
  return Align(
    alignment: Alignment.center,
    child: Column(
      children: [
        Text(
          book.title ?? '',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            shadows: [
              Shadow(
                  blurRadius: 4,
                  color: AppColors.secondaryTextColor.withOpacity(0.5))
            ],
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          book.author ?? '',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.secondaryTextColor,
            shadows: [
              Shadow(
                  blurRadius: 2,
                  color: AppColors.secondaryTextColor.withOpacity(0.2))
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildAttributeCardRow(Book book) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      AttributeCard(
          icon: Icons.star,
          title: 'Rating',
          value: book.rating.toString(),
          iconColor: AppColors.accentColor),
      AttributeCard(
          icon: Icons.publish,
          title: 'Publication Year',
          value: book.publicationYear.toString(),
          iconColor: AppColors.primaryColor.withOpacity(0.8)),
      AttributeCard(
          icon: Icons.language,
          title: 'Language',
          value: book.language ?? '',
          iconColor: AppColors.secondaryTextColor),
    ],
  );
}

void _showBottomSheet(BuildContext context, Book book) {
  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      constraints: const BoxConstraints(minWidth: double.infinity),
      builder: (context) {
        return BlocListener<HomePageBloc, HomePageState>(
          listener: (context, state) {
            if (state.myListAddedMessage != null) {
              ShowSnackbar.showSnackBar(context,
                  title: state.myListAddedMessage!,
                  backgroundColor: AppColors.successColor);
            }
          },
          child: BookDetailBottomSheet(book: book),
        );
      });
}
