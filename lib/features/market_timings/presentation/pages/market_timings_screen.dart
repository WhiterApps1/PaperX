import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paper_x_flutter/core/theme/app_colors.dart';
import 'package:paper_x_flutter/features/market_timings/presentation/bloc/market_timings_bloc.dart';
import 'package:paper_x_flutter/features/market_timings/presentation/widgets/custom_market_dropdown.dart';
import 'package:paper_x_flutter/features/market_timings/presentation/widgets/market_timing_card.dart';
import 'package:table_calendar/table_calendar.dart';

class MarketTimingsScreen extends StatelessWidget {
  const MarketTimingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MarketTimingsBloc(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textWhite),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Market Timings',
            style: TextStyle(
              fontFamily: 'Figtree',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: AppColors.textWhite,
            ),
          ),
        ),
        body: const SafeArea(child: _MarketTimingsContent()),
      ),
    );
  }
}

class _MarketTimingsContent extends StatelessWidget {
  const _MarketTimingsContent();

  static const List<String> _exchanges = [
    'NSE',
    'MCX',
    'SGX',
    'NCDEX',
    'Label',
    'Label',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketTimingsBloc, MarketTimingsState>(
      builder: (context, state) {
        final isDropdownOpen = state is MarketTimingsLoaded
            ? state.isDropdownOpen
            : false;
        final selectedExchange = state is MarketTimingsLoaded
            ? state.selectedExchange
            : null;
        final selectedDate = state is MarketTimingsLoaded
            ? state.selectedDate
            : null;

        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // "Market Timings" label
              const Text(
                'Market Timings',
                style: TextStyle(
                  fontFamily: 'Figtree',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.textGray,
                ),
              ),
              const SizedBox(height: 8),

              // Dropdown using reusable component
              CustomMarketDropdown(
                hint: 'Exchange',
                value: selectedExchange,
                items: _exchanges,
                isOpen: isDropdownOpen,
                selectedItem: selectedExchange,
                onToggle: () {
                  context.read<MarketTimingsBloc>().add(const ToggleDropdown());
                },
                onChanged: (value) {
                  context.read<MarketTimingsBloc>().add(SelectExchange(value));
                },
              ),

              // Calendar (shown when exchange is selected)
              if (selectedExchange != null && !isDropdownOpen) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.inputFieldBackground,
                      width: 1,
                    ),
                  ),
                  child: TableCalendar(
                    firstDay: DateTime(2020),
                    lastDay: DateTime(2030),
                    focusedDay: selectedDate ?? DateTime.now(),
                    currentDay: null,
                    selectedDayPredicate: (day) {
                      return selectedDate != null &&
                          isSameDay(selectedDate, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      context.read<MarketTimingsBloc>().add(
                        SelectDate(selectedDay),
                      );
                    },
                    calendarFormat: CalendarFormat.month,
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: false,
                      titleTextStyle: TextStyle(
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.textWhite,
                      ),
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: AppColors.textWhite,
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: AppColors.textWhite,
                      ),
                    ),
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.textGray,
                      ),
                      weekendStyle: TextStyle(
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.textGray,
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: const TextStyle(
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.textWhite,
                      ),
                      weekendTextStyle: const TextStyle(
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.textWhite,
                      ),
                      outsideTextStyle: TextStyle(
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.textGray.withValues(alpha: 0.5),
                      ),
                      todayDecoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      todayTextStyle: const TextStyle(
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.textWhite,
                      ),
                      selectedDecoration: const BoxDecoration(
                        color: AppColors.primaryAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Market timing display (when date is selected)
              if (selectedDate != null && !isDropdownOpen)
                MarketTimingCard(
                  selectedDate: selectedDate,
                  timingText: '09:16 AM- 03:30 PM',
                ),
            ],
          ),
        );
      },
    );
  }
}
