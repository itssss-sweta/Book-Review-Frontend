import 'package:book_review/src/features/splash/presentation/bloc/splash_event.dart';
import 'package:book_review/src/features/splash/presentation/bloc/splash_state.dart';
import 'package:book_review/src/shared/data/data_source/local/cache_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<CheckLoginEvent>(_onCheckLoginEvent);
  }
  Future<void> _onCheckLoginEvent(
      CheckLoginEvent event, Emitter<SplashState> emit) async {
    emit(SplashLoading());
    await Future.delayed(const Duration(seconds: 4));
    final token = CacheServices.getCacheServicesInstance.getAccessToken();
    final isLogin = CacheServices.getCacheServicesInstance.getIsLogin();
    if (isLogin && token.isNotEmpty) {
      emit(SplashAuthenticated());
    } else {
      emit(SplashUnauthenticated());
    }
  }
}
