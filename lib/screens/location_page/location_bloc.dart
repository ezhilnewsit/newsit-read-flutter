

import 'package:bloc/bloc.dart';
import '../../base/base_state.dart';
import 'location_event.dart';

class LocationBloc extends Bloc<LocationEvent, BaseState> {
  LocationBloc() : super(InitialState());


  @override
  Stream<BaseState> mapEventToState(
      LocationEvent event,
      ) async* {
    if (event is LocationInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}