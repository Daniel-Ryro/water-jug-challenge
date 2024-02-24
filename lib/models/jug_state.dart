class JugState {
  int x, y;
  String action;

  JugState(this.x, this.y, this.action);

  @override
  String toString() {
    return 'Bucket X: $x, Bucket Y: $y, Action: $action';
  }
}