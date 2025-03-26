use dep::std;
// Create a 3 x 3 Sujiko Verifier circuit 

/// Question will be in the form of  
/// q[0]  q[1]
/// q[2]  q[3]

/// solution will be in the form of 
/// s[0]  s[1]  s[2]
/// s[3]  s[4]  s[5]
/// s[6]  s[7]  s[8]


fn main(question: pub [Field; 4], solution:[Field; 9]) {
   
    // Your solution starts here ..
    std::println("Question: ");
    std::println(question);
    std::println("Solution: ");
    std::println(solution);
    
    // Verify that all numbers 1-9 are used exactly once
    verify_solution_uses_1_to_9(solution);
    
    // Verify that the 2x2 sub-grid sums match the question values
    verify_sums(question, solution);
}

// Verify that the solution contains exactly the numbers 1-9
fn verify_solution_uses_1_to_9(solution: [Field; 9]) {
    // Check each number appears exactly once
    for i in 1..10 {
        let i_field = Field::from(i as u64);
        let mut found = false;
        
        // Check if number i exists in the solution
        for j in 0..9 {
            // Update found without using break
            found = found | (solution[j] == i_field);
        }
        
        // Assert that the number was found
        assert(found);
    }
    
    // Check all values are between 1 and 9
    for i in 0..9 {
        let value = solution[i];
        let value_u32 = value as u32 ;
        // Check each value is between 1 and 9 using individual assertions
        assert(value_u32 >= 1);
        assert(value_u32 <= 9);
    }
}

// Verify that the sums match the question values
fn verify_sums(question: [Field; 4], solution: [Field; 9]) {
    // Top-left 2x2 grid sum should equal question[0]
    assert(solution[0] + solution[1] + solution[3] + solution[4] == question[0]);
    
    // Top-right 2x2 grid sum should equal question[1]
    assert(solution[1] + solution[2] + solution[4] + solution[5] == question[1]);
    
    // Bottom-left 2x2 grid sum should equal question[2]
    assert(solution[3] + solution[4] + solution[6] + solution[7] == question[2]);
    
    // Bottom-right 2x2 grid sum should equal question[3]
    assert(solution[4] + solution[5] + solution[7] + solution[8] == question[3]);
}

// Helper function
fn is_equal(a:Field, b:Field) -> pub bool {
    let z = a == b;
    let m = false;
    z| m 
}