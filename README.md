# Yu-zh/termbit

A terminal library for MoonBit.

Example usage:

* Print "Hello, World!" in blue at position (10, 10) in the terminal.

```moonbit
fn main {
  let exec = @termbit.Executor::new()
  exec
    ..queue(@termbit.Clear(All))
    ..queue(@termbit.Cursor::MoveTo(10, 10))
    ..queue(@termbit.SetForegroundColor(Blue))
    ..queue(@termbit.Print::Bytes("Hello, World!\n"))
    .flush()
}
```

* Draw a red rectangle in the terminal.

```moonbit
fn main {
  let exec = @termbit.Executor::new()

  for y in 0..=40 {
    for x in 0..=80 {
      if y == 0 || y == 40 || x == 0 || x == 80 {
        exec
        ..queue(@termbit.Cursor::MoveTo(x.to_uint16(), y.to_uint16()))
        ..queue(@termbit.SetForegroundColor(Red))
        .queue(@termbit.Print::Bytes("█"))
      }
    }
  }
  exec..queue(@termbit.Print::Bytes("\n")).flush()
}

```