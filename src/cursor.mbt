///|
pub(all) enum Cursor {
  MoveTo(UInt16, UInt16)
  Show
  Hide
}

///|
pub impl Command for Cursor with ansi_repr(self) {
  fn bytes(x : UInt16) {
    int_to_bytes(x.to_int())
  }

  match self {
    MoveTo(x, y) => [..b"\x1b[", ..bytes(y), ';', ..bytes(x), 'H']
    Show => b"\x1b[?25h"
    Hide => b"\x1b[?25l"
  }
}
