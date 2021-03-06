part of gametime;

@immutable
class AppState {

  final Map<String, GameModel> games;
  final Map<String, List<Note>> gameToNotes;
  final Map<String, List<Session>> gameToSessions;
  final Session currentActiveSession;
  final CustomTheme theme;
  final List<Query> queries;
  final FirebaseUser firebaseUser;
  final GoogleSignInAccount googleUser;
  final Regions region;

  AppState({
    this.games,
    this.gameToNotes,
    this.gameToSessions,
    this.currentActiveSession,
    this.theme,
    this.queries,
    this.firebaseUser,
    this.googleUser,
    this.region,
  });

  AppState copyWith({
    Map<String, GameModel> games,
    Map<String, List<Note>> gameToNotes,
    Map<String, List<Session>> gameToSessions,
    Session currentActiveSession,
    CustomTheme theme,
    List<Query> queries,
    FirebaseUser firebaseUser,
    GoogleSignInAccount googleUser,
    Regions region,
  }) {
    return new AppState(
      games: games ?? this.games,
      gameToNotes: gameToNotes ?? this.gameToNotes,
      gameToSessions: gameToSessions ?? this.gameToSessions,
      currentActiveSession: currentActiveSession ?? this.currentActiveSession,
      theme: theme ?? this.theme,
      queries: queries ?? this.queries,
      firebaseUser: firebaseUser ?? this.firebaseUser,
      googleUser: googleUser ?? this.googleUser,
      region: region ?? this.region,
    );
  }

  static AppState initialState() {
    return new AppState(
        games: new Map<String, GameModel>(),
        gameToNotes: new Map<String, List<Note>>(),
        gameToSessions: new Map<String, List<Session>>(),
        currentActiveSession: new Session(gameId: ''),
        theme: new BlackRedTheme(),
        queries: Query.getDefault(),
        firebaseUser: null,
        googleUser: null,
        region: Regions.NORTH_AMERICA,
    );
  }

  @override
  String toString() {
    return JSON.encode({
      'games': this.games.toString(),
      'notes': this.gameToNotes.toString(),
      'sessions': this.gameToSessions.toString(),
      'currentActiveSession': this.currentActiveSession.toString(),
      'firebaseUser': this.firebaseUser.toString()
    });
  }
}


