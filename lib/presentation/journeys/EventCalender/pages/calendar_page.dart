import 'package:cr_calendar/cr_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/constants/AppConstants.dart';
import 'package:flutter_spoogle_app/common/extensions/DateExtension.dart';
import 'package:flutter_spoogle_app/presentation/journeys/EventCalender/widgets/day_item_widget.dart';
import 'package:flutter_spoogle_app/presentation/journeys/EventCalender/widgets/week_days_widget.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:flutter_spoogle_app/presentation/widgets/search_bar.dart';

import '../widgets/create_event_dialog.dart';
import '../widgets/day_events_bottom_sheet.dart';
import '../widgets/event_widget.dart';

/// Main calendar page.
class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final _currentDate = DateTime.now();

  late CrCalendarController _calendarController;
  late String _appbarTitle;
  late String _monthYear;

  @override
  void initState() {
    _setTexts(_currentDate.year, _currentDate.month);
    _createExampleEvents();

    super.initState();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("EVENT CALENDER", style: TextStyle(color: AppColor.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
            size: 18,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            tooltip: 'Go to current date',
            icon: const Icon(Icons.calendar_today),
            onPressed: _showCurrentMonth,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEvent,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          SearchBar(),

          /// Calendar control row.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  _changeCalendarPage(showNext: false);
                },
              ),
              Text(
                _monthYear,
                style: const TextStyle(
                    fontSize: 16, color: AppColor.violet, fontWeight: FontWeight.w600),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  _changeCalendarPage(showNext: true);
                },
              ),
            ],
          ),

          /// Calendar view.
          Expanded(
            child: CrCalendar(
              firstDayOfWeek: WeekDay.monday,
              eventsTopPadding: 32,
              initialDate: _currentDate,
              maxEventLines: 3,
              controller: _calendarController,
              forceSixWeek: true,
              dayItemBuilder: (builderArgument) => DayItemWidget(properties: builderArgument),
              weekDaysBuilder: (day) => WeekDaysWidget(day: day),
              eventBuilder: (drawer) => EventWidget(drawer: drawer),
              onDayClicked: _showDayEventsInModalSheet,
              minDate: DateTime.now().subtract(const Duration(days: 1000)),
              maxDate: DateTime.now().add(const Duration(days: 180)),
            ),
          ),
        ],
      ),
    );
  }

  /// Control calendar with arrow buttons.
  void _changeCalendarPage({required bool showNext}) => showNext
      ? _calendarController.swipeToNextMonth()
      : _calendarController.swipeToPreviousPage();

  void _onCalendarPageChanged(int year, int month) {
    setState(() {
      _setTexts(year, month);
    });
  }

  /// Set app bar text and month name over calendar.
  void _setTexts(int year, int month) {
    final date = DateTime(year, month);
    _appbarTitle = date.format(kAppBarDateFormat);
    _monthYear = date.format(kMonthFormatWidthYear);
  }

  /// Show current month page.
  void _showCurrentMonth() {
    _calendarController.goToDate(_currentDate);
  }

  /// Show [CreateEventDialog] with settings for new event.
  Future<void> _addEvent() async {
    final event = await showDialog(
        context: context, builder: (context) => const CreateEventDialog());
    if (event != null) {
      _calendarController.addEvent(event);
    }
  }

  void _createExampleEvents() {
    final now = _currentDate;
    _calendarController = CrCalendarController(
      onSwipe: _onCalendarPageChanged,
      events: [
        CalendarEventModel(
          name: '1 event',
          begin: DateTime(now.year, now.month, (now.day).clamp(1, 28)),
          end: DateTime(now.year, now.month, (now.day).clamp(1, 28)),
          eventColor: AppColor.eventColors[0],
        ),
        CalendarEventModel(
          name: '2 event',
          begin: DateTime(now.year, now.month - 1, (now.day - 2).clamp(1, 28)),
          end: DateTime(now.year, now.month, (now.day + 2).clamp(1, 28)),
          eventColor: AppColor.eventColors[1],
        ),
        CalendarEventModel(
          name: '3 event',
          begin: DateTime(now.year, now.month, (now.day - 3).clamp(1, 28)),
          end: DateTime(now.year, now.month + 1, (now.day + 4).clamp(1, 28)),
          eventColor: AppColor.eventColors[2],
        ),
        CalendarEventModel(
          name: '4 event',
          begin: DateTime(now.year, now.month - 1, (now.day).clamp(1, 28)),
          end: DateTime(now.year, now.month + 1, (now.day + 5).clamp(1, 28)),
          eventColor: AppColor.eventColors[3],
        ),
        CalendarEventModel(
          name: '5 event',
          begin: DateTime(now.year, now.month + 1, (now.day + 1).clamp(1, 28)),
          end: DateTime(now.year, now.month + 2, (now.day + 7).clamp(1, 28)),
          eventColor: AppColor.eventColors[4],
        ),
      ],
    );
  }

  void _showDayEventsInModalSheet(
      List<CalendarEventModel> events, DateTime day) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
        isScrollControlled: true,
        context: context,
        builder: (context) => DayEventsBottomSheet(
              events: events,
              day: day,
              screenHeight: MediaQuery.of(context).size.height,
            ),
    );
  }
}
