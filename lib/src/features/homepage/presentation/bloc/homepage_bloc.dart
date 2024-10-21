import 'package:book_review/src/features/homepage/presentation/bloc/homepage_event.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_state.dart';
import 'package:book_review/src/shared/data/data_source/local/cache_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomepPageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomepPageBloc() : super(HomePageInitial()) {
    on<LogoutEvent>(_onLogout);
  }
  Future<void> _onLogout(LogoutEvent event, Emitter<HomePageState> emit) async {
    emit(LogoutLoading());
    await Future.delayed(const Duration(seconds: 2));
    CacheServices.getCacheServicesInstance.saveAccessToken('');
    CacheServices.getCacheServicesInstance.saveIsLogin(false);
    emit(LogoutSuccessful());
  }
}
