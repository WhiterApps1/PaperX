part of 'market_timings_bloc.dart';

abstract class MarketTimingsEvent extends Equatable {
  const MarketTimingsEvent();

  @override
  List<Object?> get props => [];
}

class SelectExchange extends MarketTimingsEvent {
  final String exchange;

  const SelectExchange(this.exchange);

  @override
  List<Object?> get props => [exchange];
}

class ToggleDropdown extends MarketTimingsEvent {
  const ToggleDropdown();
}

class SelectDate extends MarketTimingsEvent {
  final DateTime date;

  const SelectDate(this.date);

  @override
  List<Object?> get props => [date];
}
