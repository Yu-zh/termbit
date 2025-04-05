# Yu-zh/termbit

A terminal manipulation library written in MoonBit. This repository is under
development, and I have only tested it on macOS Sonama 14.6 (M1 Chip).

## Example usage:

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

## Shoutout

This project draws inspiration from [crossterm-rs](https://github.com/crossterm-rs/crossterm), an awesome cross-platform terminal manipulation library for Rust.