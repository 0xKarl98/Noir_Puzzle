use dep::std;

// Given a 4x4 sudoku board with array signal input "question" and "solution", check if the solution is correct.

//     "question" is a 16 length array. Example: [0,4,0,0,0,0,1,0,0,0,0,3,2,0,0,0] == [0, 4, 0, 0]
//                                                                                    [0, 0, 1, 0]
//                                                                                    [0, 0, 0, 3]
//                                                                                    [2, 0, 0, 0]

//     "solution" is a 16 length array. Example: [1,4,3,2,3,2,1,4,4,1,2,3,2,3,4,1] == [1, 4, 3, 2]
//                                                                                    [3, 2, 1, 4]
//                                                                                    [4, 1, 2, 3]
//                                                                                    [2, 3, 4, 1]
// In prover.toml , we gave the solution corresponding to the question 
// 
fn main(question: pub [Field; 16], answer : [Field; 16]) {
       
    // Verifying the Question
    for i in 0..16 {
        let mut a = question[i] == answer[i];
        let mut b = question[i] == 0;
        let c = a | b;
        std::println(c);
        assert(c == true);
    }

    // Check first row has 3 inputs as 0 and 1 input as non zero
    let mut m:[Field; 16] = [0; 16];
    for i in 0..4 {
        let mut a = question[i] ;
        assert(a == question[i]);
        let mut b = 0;
        assert(b == 0);
        let c =  a==b; 
        m[i] = c as Field;
    }
    assert(3 == (m[0] + m[1] +m[2] + m[3]));

    // Check second row has 3 inputs as 0 and 1 input as non zero

    for i in 4..8 {
    let mut a = question[i] ;
    assert(a == question[i]);
    let mut b = 0;
    assert(b == 0);
    let c =  a==b; 
    m[i] = c as Field;
    }
    assert(3 == (m[4] + m[5] +m[6] + m[7]));

    // Check third row has 3 inputs as 0 and 1 input as non zero

    for i in 8..12 {
        let mut a = question[i] ;
        assert(a == question[i]);
        let mut b = 0;
        assert(b == 0);
        let c =  a==b; 
        m[i] = c as Field;
    }
    assert(3 == (m[8] + m[9] +m[10] + m[11]));

    // Check fourth row has 3 inputs as 0 and 1 input as non zero

    for i in 12..16 {
        let mut a = question[i] ;
        assert(a == question[i]);
        let mut b = 0;
        assert(b == 0);
        let c =  a==b; 
        m[i] = c as Field;
    }
    assert(3 == (m[12] + m[13] +m[14] + m[15]));    

    // Solution Starts Here ..
     // Validate each row
    validate_set(answer[0], answer[1], answer[2], answer[3]);
    validate_set(answer[4], answer[5], answer[6], answer[7]);
    validate_set(answer[8], answer[9], answer[10], answer[11]);
    validate_set(answer[12], answer[13], answer[14], answer[15]);
    
    // Validate each column
    validate_set(answer[0], answer[4], answer[8], answer[12]);
    validate_set(answer[1], answer[5], answer[9], answer[13]);
    validate_set(answer[2], answer[6], answer[10], answer[14]);
    validate_set(answer[3], answer[7], answer[11], answer[15]);
    
    // Validate each 2x2 box
    // Top-left box
    validate_set(answer[0], answer[1], answer[4], answer[5]);
    // Top-right box
    validate_set(answer[2], answer[3], answer[6], answer[7]);
    // Bottom-left box
    validate_set(answer[8], answer[9], answer[12], answer[13]);
    // Bottom-right box
    validate_set(answer[10], answer[11], answer[14], answer[15]);
}

    fn validate_set(a: Field, b: Field, c: Field, d: Field) {
        // Cast fields to u32 for comparison
        let a_u32 = a as u32;
        let b_u32 = b as u32;
        let c_u32 = c as u32;
        let d_u32 = d as u32;

        // Check that each number is between 1 and 4
        assert(a_u32 >= 1 & a_u32 <= 4);
        assert(b_u32 >= 1 & b_u32 <= 4);
        assert(c_u32 >= 1 & c_u32 <= 4);
        assert(d_u32 >= 1 & d_u32 <= 4);
        
        // Check that all numbers are different
        assert(a != b);
        assert(a != c);
        assert(a != d);
        assert(b != c);
        assert(b != d);
        assert(c != d);
    }
    
   
