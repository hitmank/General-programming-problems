func countDenomination( value : Int, deno : Int) -> Int {
    
    var next_deno = 0
    
    switch(deno){
        
    case 25:    next_deno = 10
                break;
    case 10:    next_deno = 5
                break;
    case 5:    next_deno = 1
                break;
    case 1:      return 1;
        
    default:
        return 0
    }
    
    var ways = 0
    
    for i in 0...value/deno{
        ways += countDenomination( value: value-i*deno, deno : next_deno)
    }
    
    return ways
}


print(countDenomination( value: 100, deno : 25))

