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


    // lets take a deep look at pointers

}
test "testing_error" {
        // failing error
    var err = error.oops;
    try expect(err == failing_function());
}

fn increment_by_5(num: *u32)void{
    num.* += 5;
}
test "testing_pointers"{
    var x: u32 = 23;
    increment_by_5(&x);
    print("{}",.{x});
    try expect( x==28);

}


test "methods_on_enums"{
    const Clothes = enum{
        sweatpants,
        trousers,
        coat,

        fn is_coat(self: @This())bool{
            return self == @This().coat;
        }
    };
    var myclothes = Clothes.coat;
    try expect(myclothes.is_coat() == true);
}

test "swapping_struct_fields"{
    const Numbers = struct {
        x: u32,
        y: u32,
        fn swap_values(self: *@This()) void {
            var temp = self.x;
            self.x = self.y;
            self.y = temp;
        }
    };
    var nums: Numbers = Numbers{
        .x=20,
        .y=24
    };
    nums.swap_values();
    print("x= {}, y= {}\n", .{nums.x, nums.y});
    try expect(nums.x == 24);
}