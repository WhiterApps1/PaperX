part of 'market_timings_bloc.dart';

abstract class MarketTimingsState extends Equatable {
  const MarketTimingsState();

  @override
  List<Object?> get props => [];
}

class MarketTimingsInitial extends MarketTimingsState {
  const MarketTimingsInitial();
}

class MarketTimingsLoaded extends MarketTimingsState {
  final String? selectedExchange;
  final bool isDropdownOpen;
  final DateTime? selectedDate;

  const MarketTimingsLoaded({
    required this.selectedExchange,
    required this.isDropdownOpen,
    this.selectedDate,
  });

  MarketTimingsLoaded copyWith({
    String? selectedExchange,
    bool? isDropdownOpen,
    DateTime? selectedDate,
  }) {
    return MarketTimingsLoaded(
      selectedExchange: selectedExchange ?? this.selectedExchange,
      isDropdownOpen: isDropdownOpen ?? this.isDropdownOpen,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }

  @override
  List<Object?> get props => [selectedExchange, isDropdownOpen, selectedDate];
}
