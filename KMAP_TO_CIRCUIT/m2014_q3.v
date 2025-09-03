module top_module (
	input [4:1] x, 
	output f );

	//sop
	// assign f= (x[2]&x[4])|(~x[1]&x[3]);
    
	//pos
	assign f = (x[1]|x[3]) & (~x[1]|x[2]) & (~x[1]|~x[3]) ;
endmodule
