class TodayMatchModel {
  final String team1;
  final String team2;
  final String date;
  final String time;
  final String flag1;
  final String flag2;
  final String? team1Score;
  final String? team2Score;
  final String? ballPositionTeam1;
  final String? ballPositionTeam2;
  final List<String>? team1Goals;
  final List<String>? team2Goals;

  TodayMatchModel({
    required this.team1,
    required this.team2,
    required this.date,
    required this.time,
    required this.flag1,
    required this.flag2,
    this.team1Score,
    this.team2Score,
    this.ballPositionTeam1,
    this.ballPositionTeam2,
    this.team1Goals,
    this.team2Goals,
  });

  factory TodayMatchModel.fromJson(Map<String, dynamic> json) {
    return TodayMatchModel(
      team1: json['team1'],
      team2: json['team2'],
      date: json['date'],
      time: json['time'],
      flag1: json['flag1'],
      flag2: json['flag2'],
      team1Score: json['team1Score'],
      team2Score: json['team2Score'],
      ballPositionTeam1: json['ballPositionTeam1'],
      ballPositionTeam2: json['ballPositionTeam2'],
      team1Goals: List<String>.from(json['team1Goals'] ?? []),
      team2Goals: List<String>.from(json['team2Goals'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'team1': team1,
      'team2': team2,
      'date': date,
      'time': time,
      'flag1': flag1,
      'flag2': flag2,
      'team1Score': team1Score,
      'team2Score': team2Score,
      'ballPositionTeam1': ballPositionTeam1,
      'ballPositionTeam2': ballPositionTeam2,
      'team1Goals': team1Goals,
      'team2Goals': team2Goals,
    };
  }
}

List<TodayMatchModel> listMatches = [
  TodayMatchModel(
    team1: 'Barcelona',
    team2: 'Real Madrid',
    date: '24 October 2021',
    time: '01:30',
    flag1: 'assets/flag/fcb.png',
    flag2: 'assets/flag/rmd.png',
    team1Score: '2',
    team2Score: '1',
    ballPositionTeam1: '70',
    ballPositionTeam2: '30',
    team1Goals: ['Messi 20\'', 'Suarez 50\''],
    team2Goals: ['Benzema 10\''],
  ),
  TodayMatchModel(
    team1: 'Leicester City',
    team2: 'Chelsea',
    date: '25 October 2021',
    time: '7:30',
    flag1: 'assets/flag/lcsct.png',
    flag2: 'assets/flag/chsl.png',
    team1Score: '1',
    team2Score: '1',
    ballPositionTeam1: '50',
    ballPositionTeam2: '50',
    team1Goals: ['Vardy 20\''],
    team2Goals: ['Havertz 10\''],
  ),
];
