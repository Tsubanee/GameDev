///@desc Merge number
///@Arg num1
///@Arg num2
///@Arg amount

var num1 = argument0;
var num2 = argument1;
var amount = argument2;

var diff = num1 - num2;
var merged = num1 - (diff * amount);

return merged;
