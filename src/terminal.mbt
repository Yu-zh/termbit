///|
pub(all) enum Terminal {
  Clear(ClearKind)
}

///|
pub(all) enum ClearKind {
  All
  CurrentLine
  UntilNewLine
}

///|
pub impl Command for Terminal with ansi_repr(self) {
  match self {
    Clear(All) => b"\x1b[2J"
    Clear(CurrentLine) => b"\x1b[2K"
    Clear(UntilNewLine) => b"\x1b[K"
  }
}
