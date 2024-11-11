import 'package:flutter_bloc/flutter_bloc.dart';

enum BottomNavEvent { home, search, notifications, account }

class BottomNavBloc extends Bloc<BottomNavEvent, int> {
  BottomNavBloc() : super(0) {
    on<BottomNavEvent>((event, emit) {
      switch (event) {
        case BottomNavEvent.home:
          emit(0);
          break;
        case BottomNavEvent.search:
          emit(1);
          break;
        case BottomNavEvent.notifications:
          emit(2);
          break;
        case BottomNavEvent.account:
          emit(3);
          break;
      }
    });
  }
}
