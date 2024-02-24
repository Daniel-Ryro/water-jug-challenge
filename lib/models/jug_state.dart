class ChallengeState {
  int x, y;
  String action;

  ChallengeState(this.x, this.y, this.action);

  @override
  String toString() {
    return 'Bucket X: $x, Bucket Y: $y, Action: $action';
  }
}