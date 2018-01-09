=== update =================================

ver 1.0   Implementing the program to disp numbers and to disp "!" with number when multiples of 3 
ver 1.1   Add function of new line
ver 1.2   Add function of Enter a number
ver 1.3   Add function of to disp "!" with number when 3 is attached(will)

============================================
 
=== layout =================================
ver 1.0
0  A1   constant : counter

1  B1   variable : comparison(1)
2  B2   variable : comparison(2)

3  C1   variable : flag of "comparison"
4  C2   variable : flag of "threee multiples of"
5  C3   variable : flag of "display"

6  D1   variable : the hundred's place
7  D2   variable : the ten's place
8  D3   variable : the one's place

ver 1.1
9  E1   Character code(space 32)
10 E2   Character code(! 33)
11 E3   Character code(\n 10)
12 F1   variable : flag of "new line"
13 F2   variable : counter(F1)

ver 1.2
14 G4   Character code(: 58)
15 G5   Character code(( 40 & ) 41)

ver 1.3
16 H1   variable : counter of "attach(1)"
17 H2   variable : counter of "attach(10)"

============================================

// setup
( A1 )>>>>( C2 )+++     // set C2 3
<<<( B1 )++++[->>>>>>>>( E1 )++++++++>( E2 )++++++++<<<<<<<<<(B1)]     // set E1 32
>>>>>>>>>( E2 )+     // set E2 33
>( E3 )++++++++++     // set E3 10 
>>( F2 )++++++++++     // set F2 10
>>>( H1 )+++     // set H1 3   
>( H2 )+++     // set H2 3
<<<<<<<<<<<<<<<<( B1 )++++++[->>>>>>>>>>>>>( E4 )++++++++++<<<<<<<<<<<<<( B1 )]  
>>>>>>>>>>>>>( E4 )--     // set E4 58
<<<<<<<<<<<<( B1 )++++[->>>>>>>>>>>>>( E5 )++++++++++<<<<<<<<<<<<<( B1 )]     //set E5 40 
<<( A1 )
>( B1 )++++++++++[-<( A1 )++++++++++>( B1 )]<( A1 )+++++.     // i 105 
+++++.     // n 110
++.     // p 112
+++++.     // u 117
-.     // t 116
>>>>>>>>>( E1 ).     // space 32( E1 )
<<<<<<<<<------( A1 ).     // n 110
+++++++.     // u 117
--------.     // m 109
-----------.     // b 98
+++.   // e 101
+++++++++++++.     // r 114
>>>>>>>>>>>>>>>( E5 ).     // ( 40
<<<<<<<<<<<<<<<( A1 )-----.     // m 109 
------------.     // a 97 
>( B1 )++[-<( A1 )++++++++++>( B1 )]<( A1 )+++.     // x 120
>>>>>>>>>( E1 ).     // space 32
>>>>>>++++++++++.     // 2 50
+++.     // 5 53
.     // 5 53
------------( E5 ).     // ) 41
<<<<<<( E1 ).     // space 32( E1 )
>>>>>( E4 ).     // : 58( E4 )
<<<<<( E1 ).     // space 32( E1 )
<<<<<<<<<( A1 ),     // input
>>>>>>>>>>>( F1 ).     // newline(10)
<<<<<<<<<<<( A1 )
// main
[
   ( A1 )>>>>>>>>( D3 )+     // add D3 1
   
   
   ========== Carry(one's place) ==========
   
   [<<<<<<<( B1 )+>( B2 )+>>>>>>( D3 )-]     // copy D3 to B1 and B2
   <<<<<<( B2 )[>>>>>>( D3 )+<<<<<<( B2 )-]     // copy B2 to D3
   ++++++++++     // set B2 10
   <( B1 )[>( B2 )-<(B1)-]     // judge : B2 subtraction B1
   >>( C1 )+     // flag set
      ========== if
      <( B2 )[>( C1 )[-]<( B2 )[-]]
      >( C1 )[>>>>>( D3 )[-]<( D2 )+<<<<( C1 )-]     // " D3 = 0 "   " add D2 1 " 
   
   
   
   ========== Carry(ten's place) ==========
   
   >>>>( D2 )[<<<<<<( B1 )+>( B2 )+>>>>>( D2 )-]     // copy D2 to B1 and B2
   <<<<<( B2 )[>>>>>( D2 )+<<<<<( B2 )-]     // copy B2 to D3
   ++++++++++     // set B2 10
   <( B1 )[>( B2 )-<(B1)-]     // judge : B2 subtraction B1
      >>( C1 )+     // flag set
      ========== if
      <( B2 )[>( C1 )[-]<( B2 )[-]]
      >( C1 )[>>>>( D2 )[-]<( D1 )+<<<( C1 )-]     // " D2 = 0 "   " add D1 1 " 
   
   
   
   ========== Disp(public) ==========
   
   >>( C3 )+     // flag set
   <( C2 )-[<<<( B1 )+>( B2 )+>>( C2 )-]     // copy C2 to B1 and B2
   <<( B2 )[>>( C2 )+<<( B2 )-]     // copy B2 to C2
   >( C1 )+     // flag set       
   
   
   ========== Disp(multiples of 3) ==========
   
      ========== check C1
      <<( B1 )[>>( C1 )[-]<<( B1 )[-]]
         ========== C1 == 0
         >>( C1 )[
		    >( C2 )+++   // set C2 3
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
   
   
   
   ========== Disp(not multiples of 3) ==========
         
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
   
   
   
   ========== Disp(public) ==========
   
   >>>>( E1 ).
   
   
   
   ========== New line ==========
   
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