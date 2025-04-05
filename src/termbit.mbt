///|
const STDOUT_FILENO = 1

///|
trait Command {
  ansi_repr(Self) -> Bytes
}

///|
pub type Executor @buffer.T

///|
pub fn Executor::new() -> Executor {
  @buffer.new()
}

///|
pub fn queue[C : Command](self : Executor, cmd : C) -> Unit {
  let ansi_repr = cmd.ansi_repr()
  self._.write_bytes(ansi_repr)
}

///|
pub fn flush(self : Executor) -> Unit {
  guard write(STDOUT_FILENO, self._.contents(), self._.length()) != -1 else {
    perror("Failed to write to stdout")
    exit(1)
  }
  self._.reset()
}
