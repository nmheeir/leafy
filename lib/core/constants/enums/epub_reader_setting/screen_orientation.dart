enum ScreenOrientation {
  defaultValue('Default Value'),
  free('Free'),
  portrait('Portrait'),
  landscape('Landscape'),
  lockedPortrait('Locked Portrait'),
  lockedLandscape('Locked Landscape');

  // Khai báo field và constructor const
  final String label;
  const ScreenOrientation(this.label);
}
