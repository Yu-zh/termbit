///|
pub fn int_to_bytes(a : Int) -> Bytes {
  if a == 0 {
    return "0"
  }
  let buf = @buffer.new()
  fn go(i : Int) {
    let r = i / 10
    if r != 0 {
      go(r)
    }
    buf.write_byte((i % 10).to_byte() + b'0')
  }

  go(a)
  buf.to_bytes()
}
