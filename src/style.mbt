///|
pub(all) enum Style {
  SetAttribute(Attribute)
  SetForegroundColor(Color)
}

///|
pub(all) enum Attribute {
  Reverse
  Reset
}

///|
// TODO: replace with 8-bit color
pub(all) enum Color {
  Black = 30
  Red = 31
  Green = 32
  Yellow = 33
  Blue = 34
  Magenta = 35
  Cyan = 36
  LightGray = 37
  DarkGray = 90
  LightRed = 91
  LightGreen = 92
  LightYellow = 93
  LightBlue = 94
  LightMagenta = 95
  LightCyan = 96
  White = 97
  Default = 39
}

///|
fn color_to_int(color : Color) -> Int = "%identity"

///|
pub impl Command for Style with ansi_repr(self) {
  fn bytes(color : Color) -> Bytes {
    int_to_bytes(color_to_int(color))
  }

  match self {
    SetAttribute(Reverse) => b"\x1b[7m"
    SetAttribute(Reset) => b"\x1b[0m"
    SetForegroundColor(color) => [..b"\x1b[;", ..bytes(color), 'm']
  }
}
