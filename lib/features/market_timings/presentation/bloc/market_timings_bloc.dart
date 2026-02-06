import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'market_timings_event.dart';
part 'market_timings_state.dart';

class MarketTimingsBloc extends Bloc<MarketTimingsEvent, MarketTimingsState> {
  MarketTimingsBloc() : super(const MarketTimingsInitial()) {
    on<SelectExchange>(_onSelectExchange);
    on<ToggleDropdown>(_onToggleDropdown);
    on<SelectDate>(_onSelectDate);
  }

  void _onSelectExchange(
    SelectExchange event,
    Emitter<MarketTimingsState> emit,
  ) {
    emit(
      MarketTimingsLoaded(
        selectedExchange: event.exchange,
        isDropdownOpen: false,
      ),
    );
  }

  void _onToggleDropdown(
    ToggleDropdown event,
    Emitter<MarketTimingsState> emit,
  ) {
    final currentState = state;
    if (currentState is MarketTimingsLoaded) {
      emit(currentState.copyWith(isDropdownOpen: !currentState.isDropdownOpen));
    } else {
      emit(
        const MarketTimingsLoaded(
          selectedExchange: null,
          isDropdownOpen: true,
          selectedDate: null,
        ),
      );
    }
  }

  void _onSelectDate(SelectDate event, Emitter<MarketTimingsState> emit) {
    final currentState = state;
    if (currentState is MarketTimingsLoaded) {
      emit(currentState.copyWith(selectedDate: event.date));
    }
  }
}
