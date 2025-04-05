///|
extern "c" fn write(fd : Int, p : Bytes, len : Int) -> Int = "write"

///|
extern "c" fn perror(s : Bytes) = "perror"

///|
extern "c" fn exit(status : Int) = "exit"
