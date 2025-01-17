`timescale 1ns / 1ps

module test_ecb_enc;

	// Outputs
	//wire ;
	reg [64:1] key;
	integer i;
	
	integer f;
	reg [64:1] msg[1:131072];
	reg [64:1] message;
	wire [64:1] ciphertext;

	ECB_enc e(ciphertext, message, key);
	//ECB_dec e(ciphertext, message, key);
	initial 
	begin
		
		#10 $readmemb("binary1.txt",msg);
		//$display("f=%b",msg[1]);
		f=$fopen("ecb_enc_1.txt","w");
		#10
		for(i=1;i<=131072;i=i+1)
		 begin
			  #1 message=msg[i];
			  //$display("%b",msg[i]);
			  key = 64'b00010011_00110100_01010111_01111001_10011011_10111100_11011111_11110001;
			  //$monitor("%d",i);  
			  $display("%b",ciphertext);
			  //$fwrite(f,"%d",i);  
			  $fwrite(f,"%b\n",ciphertext);
		 end 
		#10 $fclose(f);
	end
      
endmodule
