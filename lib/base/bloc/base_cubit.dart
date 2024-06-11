import 'package:bloc/bloc.dart';
import 'package:movie_bloc/base/bloc/base_bloc_state.dart';

abstract class BaseCubit<S> extends Cubit<BaseBlocState<S>> {
  BaseCubit(super.initialState);
}
