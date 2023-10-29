const std = @import("std");

const print = std.debug.print;
pub fn main() !void {
    
    //lets take a look at advanced features of zig. 
    // for loops
    const string = [_]u8{'a', 'b', 'c', 'd', 'e', 'f'};
    for (string, 0..)|ch, index|{
        print("{} {}\n", .{index, ch});
    }

    // all function arguments are immutable, if a copy is required it must be made explicitly. 
    // defer statement 
    // defer is used when you want to execute some statement when leaving a block, like memory free or close connection etc. 

    var x: i16 = 23;
    {
        print("x before defer statement {}\n", .{x});
        defer x = 43;
        print("x after defer statement {}\n",.{x});


    }
    print("x after leaving block {}\n", .{x});
}
