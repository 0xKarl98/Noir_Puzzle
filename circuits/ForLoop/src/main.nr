// Modify the "main" function so it takes an array of field of length '3',
// and a loop that adds the elements of the array. Return the result of the
// addition.
// Note: The value of the last expression in a Noir function is implicitly returned.

// See here: https://noir-lang.org/language_concepts/control_flow/#loops

// take array's each elements as input , and then add them together 
fn main(x : [ Field; 3 ]) -> pub Field {
   
   let mut result= 0 ;
   for i in 0..3{
     result += x[i];
   }
   result

}

////////////////////
//     TESTS      //
////////////////////
#[test]
// Do not modify this function
fn test_loop() {
  let arr : [ Field; 3 ] = [ 2, 4, 6 ];
  assert(main(arr) == 12);

  let arr2 : [ Field; 3 ] = [ 0, 6, 34 ];
  assert(main(arr2) == 40);

  let arr3 : [ Field; 3 ] = [ 32, 128, 256 ];
  assert(main(arr3) == 416);
}
