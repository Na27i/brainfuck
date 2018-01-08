=== layout =================================

0  A1   constant : counter
1  B1   variable : comparison(1)
2  B2   variable : comparison(2)
3  C1   variable : flag of "comparison"
4  C2   variable : flag of "threee multiples of"
5  C3   variable : flag of "display"
6  D1   variable : the hundred's place
7  D2   variable : the ten's place
8  D3   variable : the one's place
9  E1   Character code(space 32)
10 E2   Character code(! 33)
11 E3   Character code(\n 10)
12 F1   variable : flag of "new line"
13 F2   variable : counter(F1)

============================================


// setup
>( B1 )++++++++++[-<( A1 )++++++++++>( B1 )]     // set A1 100
>>>( C2 )+++     // ste C2 3
<<<( B1 )++++[->>>>>>>>( E1 )++++++++>( E2 )++++++++<<<<<<<<<(B1)]     // set E1 32
>>>>>>>>>( E2 )+     // set E2 33
>( E3 )++++++++++     //set E3 10 
>>( F2 )++++++++++     //set F2 10
<<<<<<<<<<<<<( A1 )

// main
[
   >>>>>>>>( D3 )+     // add D3 1
   
   [<<<<<<<( B1 )+>( B2 )+>>>>>>( D3 )-]     // copy D3 to B1 and B2
   <<<<<<( B2 )[>>>>>>( D3 )+<<<<<<( B2 )-]     // copy B2 to D3
   ++++++++++     // set B2 10
   ========== branch
   <( B1 )[>( B2 )-<(B1)-]     // judge : B2 subtraction B1
      ========== B2 subtraction B1 == 0
      >>( C1 )+     // flag set
         ========== if
         <( B2 )[>( C1 )[-]<( B2 )[-]]
         >( C1 )[>>>>>( D3 )[-]<( D2 )+<<<<( C1 )-]     // " D3 = 0 "   " add D2 1 " 
         
   >>>>( D2 )[<<<<<<( B1 )+>( B2 )+>>>>>( D2 )-]     // copy D2 to B1 and B2
   <<<<<( B2 )[>>>>>( D2 )+<<<<<( B2 )-]     // copy B2 to D3
   ++++++++++     // set B2 10
   ========== branch
   <( B1 )[>( B2 )-<(B1)-]     // judge : B2 subtraction B1
      ========== B2 subtraction B1 == 0
      >>( C1 )+     // flag set
         ========== if
         <( B2 )[>( C1 )[-]<( B2 )[-]]
         >( C1 )[>>>>( D2 )[-]<( D1 )+<<<( C1 )-]     // " D2 = 0 "   " add D1 1 " 
         
   >>( C3 )+     // flag set
   ========== branch A
   <( C2 )-
   [<<<( B1 )+>( B2 )+>>( C2 )-]     // copy C2 to B1 and B2
   <<( B2 )[>>( C2 )+<<( B2 )-]     // copy B2 to C2
   >( C1 )+     // flag set 
      ========== C1 != 0
      <<( B1 )[>>( C1 )[-]<<( B1 )[-]]
         ========== if
         >>( C1 )[
		    >( C2 )+++   // set C2 3
		       ========== display
		       <<<( B1 )++++++     // set B1 6
		       [>>>>>( D1 )++++++++>( D2 )++++++++>( D3 )++++++++<<<<<<<(B1)-]
		       >>>>>( D1 ).
		       >( D2 ).
		       >( D3 ).
		       >>( E2 ).
		       
		       <<<<<<<<<( B1 )++++++  set B1 6
		       [>>>>>( D1 )-------->( D2 )-------->( D3 )--------<<<<<<<(B1)-]
		       
		       >>( C1 )[-]
		       >>( C3 )[-]
		       <<( C1 )
			]
   ========== branch B
   >>( C3 )[
      <<<<( B1 )++++++     // set B1 6
      [>>>>>( D1 )++++++++>( D2 )++++++++>( D3 )++++++++<<<<<<<(B1)-]
	  >>>>>( D1 ).
	  >( D2 ).
	  >( D3 ).
	  >( E1 ).
	  
	  <<<<<<<<( B1 )++++++  set B1 6
      [>>>>>( D1 )-------->( D2 )-------->( D3 )--------<<<<<<<(B1)-]
      >>>>( C3 )[-]
   ]
   
   >>>>( E1 ).
   
   >>>( F1 )+
   >( F2 )-
   [<<<<<<<<<<<<( B1 )+>( B2 )+>>>>>>>>>>>( F2 )-]     // copy F2 to B1 and B2
   <<<<<<<<<<<( B2 )[>>>>>>>>>>>( F2 )+<<<<<<<<<<<( B2 )-]     // copy B2 to F2
   >( C1 )+     // flag set
      ===== C1 != 0
	  <<( B1 )[>>( C1 )[-]<<( B1 )[-]]
	     ===== if
	     >>( C1 )[
		    >>>>>>>>>>( F2 )++++++++++
		    <<( E3 ).
		    <<<<<<<<( C1 )-
			]	        
   
   <<<( A1 )-
]  