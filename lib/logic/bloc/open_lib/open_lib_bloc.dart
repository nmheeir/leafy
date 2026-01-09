import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/services/connectivity_service.dart';
import 'package:leafy/domain/open_lib/entities/ol_search_result_doc.dart';

part 'open_lib_event.dart';
part 'open_lib_state.dart';

class OpenLibBloc extends Bloc<OpenLibEvent, OpenLibState> {
  final ConnectivityService _connectivityService;
  late final StreamSubscription _connSub;
  bool _isReconnecting = false;

  OpenLibBloc(this._connectivityService) : super(OpenLibLoadingState()) {
    log(
      'OpenLibBloc created with initial state: OpenLibLoadingState',
      name: 'OpenLibBloc',
    );
    _connSub = _connectivityService.connectivityStream.stream.listen((event) {
      if (_isReconnecting) return;
      log('Connectivity stream event received: $event', name: 'OpenLibBloc');

      final noInternet = event.contains(ConnectivityResult.none);

      noInternet ? add(NoInternetEvent()) : add(ReadyEvent());
    });

    on<ReadyEvent>((event, emit) {
      log('Handling ReadyEvent', name: 'OpenLibBloc');
      emit(OpenLibReadyState());
      log('Emitted OpenLibReadyState', name: 'OpenLibBloc');
    });

    on<ReconnectInternetEvent>((event, emit) async {
      log('Handling ReconnectInternetEvent', name: 'OpenLibBloc');
      _isReconnecting = true;
      emit(OpenLibLoadingState());
      await Future.delayed(Duration(milliseconds: 1000));
      log(
        'Emitted OpenLibLoadingState during ReconnectInternetEvent',
        name: 'OpenLibBloc',
      );
      final currentConnectivity = await _connectivityService
          .checkConnectivity();
      log(
        'Current connectivity after check: $currentConnectivity',
        name: 'OpenLibBloc',
      );
      currentConnectivity.contains(ConnectivityResult.none)
          ? emit(OpenLibNoInternetState())
          : emit(OpenLibReadyState());
      log(
        'Emitted ${currentConnectivity.isEmpty ? 'OpenLibNoInternetState' : 'OpenLibReadyState'}',
        name: 'OpenLibBloc',
      );
      _isReconnecting = false;
    });

    on<NoInternetEvent>((event, emit) {
      log('Handling NoInternetEvent', name: 'OpenLibBloc');
      emit(OpenLibNoInternetState());
      log('Emitted OpenLibNoInternetState', name: 'OpenLibBloc');
    });
  }

  @override
  Future<void> close() {
    log(
      'Closing OpenLibBloc and cancelling connectivity subscription',
      name: 'OpenLibBloc',
    );
    _connSub.cancel();
    return super.close();
  }
}
