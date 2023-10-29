const std = @import("std");

const print = std.debug.print;
const expect = @import("std").testing.expect;

fn failing_function() error{oops}!void{
    return error.oops;
}

pub fn main() !void {

    //lets take a look at advanced features of zig.
    // for loops
    const string = [_]u8{ 'a', 'b', 'c', 'd', 'e', 'f' };
    for (string, 0..) |ch, index| {
        print("{} {}\n", .{ index, ch });
    }

    // all function arguments are immutable, if a copy is required it must be made explicitly.
    // defer statement
    // defer is used when you want to execute some statement when leaving a block, like memory free or close connection etc.

    var x: i16 = 23;
    {
        print("x before defer statement {}\n", .{x});
        defer x = 43;
        print("x after defer statement {}\n", .{x});
    }
    print("x after leaving block {}\n", .{x});

    // ERRORS

    const FileError = error{
        ACCESS_DENIED,
        OUT_OF_MEMORY,
        FILE_NOT_FOUND,
    };
    var f_error: FileError = FileError.ACCESS_DENIED;
    print("error is {}\n", .{f_error});

    //error set

    const maybe_error: FileError!u16 = 10;
    print("maybe_error = {any}\n", .{maybe_error});
}
test "testing_error" {
        // failing error
    var err = error.oops;
    try expect(err == failing_function());
}