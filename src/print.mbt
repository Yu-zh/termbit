///|
pub(all) enum Print {
  Bytes(Bytes)
}

///|
pub impl Command for Print with ansi_repr(self) {
  match self {
    Bytes(bytes) => bytes
  }
}
