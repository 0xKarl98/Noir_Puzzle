//run nargo execute 
//it will take inputs from prover.toml and solve the circuit witnesses
//fail if the x is equal to y 
fn main(x : Field, y : pub Field) {
    assert(x != y);
}

#[test]
fn test_main() {
    main(1, 2);
    
    // Uncomment to make test fail
    //main(1, 1);
}
