class ScheduleMatchModel {
  final String team1;
  final String team2;
  final String date;
  final String time;
  final String flag1;
  final String flag2;

  ScheduleMatchModel({
    required this.team1,
    required this.team2,
    required this.date,
    required this.time,
    required this.flag1,
    required this.flag2,
  });

  factory ScheduleMatchModel.fromJson(Map<String, dynamic> json) {
    return ScheduleMatchModel(
      team1: json['team1'],
      team2: json['team2'],
      date: json['date'],
      time: json['time'],
      flag1: json['flag1'],
      flag2: json['flag2'],
    );
  }
}

List<ScheduleMatchModel> scheduleMatches = [
  ScheduleMatchModel(
    team1: 'Barcelona',
    team2: 'Real Madrid',
    date: '14 Aug 2024',
    time: '23:00',
    flag1: 'assets/flag/fcb.png',
    flag2: 'assets/flag/rmd.png',
  ),
  ScheduleMatchModel(
    team1: 'Juventus',
    team2: 'Inter Milan',
    date: '24 Aug 2024',
    time: '01:00',
    flag1: 'assets/flag/jv.png',
    flag2: 'assets/flag/intmln.png',
  ),
  ScheduleMatchModel(
    team1: 'Man City',
    team2: 'Crystal Pa',
    date: '29 Aug 2024',
    time: '03:00',
    flag1: 'assets/flag/manc.png',
    flag2: 'assets/flag/cpa.png',
  ),
];
