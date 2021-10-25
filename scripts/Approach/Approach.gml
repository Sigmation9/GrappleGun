// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Approach(low, high, dest){
if (low < high){
return min(low + dest, high);
} else {
return max(low - dest, high);
}
}