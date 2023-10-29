const std = @import("std");

const print = std.debug.print;
fn add(x: u32, y: u32) u32{
    return x + y;
    
}

pub fn main() void {

    var a: u8 = 23;
    var b: i8 = -34;
    var c: u16 = 2345;
    var d: i16 = -345;

    var e: f32 = 23.5;
    var f: f64 = 34.66;

    print("{d} \n{d}\n", .{a, b});

    print("{}\n", .{c});
    print("{}\n", .{d});
    print("{}\n", .{e});
    print("{}\n", .{f});


    // booleans
    var isOk: bool = false;
    print("{}\n", .{isOk});

    // storing characters in u8
    var myfavchar: u8 = 's';
    print("{c}\n", .{myfavchar});


    // Enums
    const Direction = enum{
        North, 
        East,
        West,
        South
    };

    var our_direction: Direction = Direction.North;
    print("{}\n",.{our_direction});

    const firstName = "fahad";
    const lastName = "ali sarwar";

    print("{s}\n",.{firstName++lastName});


    const nums = [_]u8{2, 5, 6, 4};
    var x: usize = 3;
    const slice = nums[1..x];

    std.debug.print("{any}\n", .{slice});        // { 5, 6 }
    std.debug.print("{}\n", .{@TypeOf(slice)});  // []const u8


    const Person = struct{
        name: *const [5:0] u8,
        age: u8,
        is_employed: bool,

    };

    var new_person: Person = Person{
        .name="fahad",
        .age=34,
        .is_employed=true
    };
    print("{any}\n",.{new_person});

    //unions
    // unions are like strycts but they only have 1 active field at a time. 
    const ActionResult = union {
        code_int: u8,
        code_float: f32
    };
    const ar1 = ActionResult{
        .code_int=233
    };
    

    const ar2 = ActionResult{
        .code_float=34.5
    };
    print("{any}\n",.{ar1});
    print("{}\n", .{ar2});


    //control structures

    var score: u16 =  10;
    if (score > 50) {
        print("passed with {}\n", .{score});
    
    }
    else {
        print("failed with {}\n", .{score});
    }

    var age: u8= 89;
    switch (age){
        0...10 => {
            print("you are young {}\n", .{age});
        },
        11...50 => {
            print("a little old {}\n", .{age});
        },
        else => {
            print("very old {}\n", .{age});
        }
    }

    // loops
    // while

    var t: u32 = 0;
    while (t <= 10){
        print("t = {}\n", .{t});
        t = t + 1;
    }
    

    // functions

    var n1: u32 = 34;
    var n2: u32 = 23;
    var sum = add(n1, n2);

    print("sum = {}\n", .{sum});

    // OOP
    //onst Rectangl = struct{};
    const Rectangl = struct {
        width: f32,
        height: f32,

        pub fn calculate_area(self: @This()) f32{
            return self.width * self.height;
            
        }
    };
    var r: Rectangl = Rectangl{
        .width=34.5,
        .height=23.66
    };
    print("area is {}\n", .{r.calculate_area()});

 
    // pointers
    var tt: u8 = 20;
    var ptr_tt = &tt;
    ptr_tt.* = 34; // in C it would be *ptr_tt
    print("{}\n", .{tt});
    print("{}\n", .{ptr_tt});

    // lets see pointer to arrays
    

}

