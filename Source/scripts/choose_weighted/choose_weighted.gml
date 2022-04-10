/*
Function by YellowAfterLife

This function acts like choose(), but after each result, you can
give the value a specific chance to appear

choose_weighted(0,0.5,1,0.5) here 0 and 1 both have a probability of 50% to be chosen

choose_weighted(0,1,1,0) here 0 will always appear, while 1 will never appear

infinite values can be inserted
*/
function choose_weighted() {
    var n = 0;
    for (var i = 1; i < argument_count; i += 2) {
        if (argument[i] <= 0) continue;
        n += argument[i];
    }
    
    n = random(n);
    for (var i = 1; i < argument_count; i += 2) {
        if (argument[i] <= 0) continue;
        n -= argument[i];
        if (n < 0) return argument[i - 1];
    }
    
    return argument[0];
}
