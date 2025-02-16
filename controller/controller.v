//Moore machine for controller

module controller_module (
	input clk, rst, 
	input init,
	output reg [1:0] out, state, next_state
);
	// States S0: initial state S1: store 8bit in memory S2: computation logic S3: BCD Display
	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;

	// Determine the output depending on the current state only .
	always @(rst or init or state) begin
		if (rst == 1'b1) begin
			next_state <= S0;
		end
		else begin
			case (state)
		  		S0: begin
			    	if (init == 1'b1) begin
				    	next_state <= S1;
					end
					else begin
				    	next_state <= S0;
					end
            	end
            	S1: begin
					out <= S1;
                	if (init == 1'b1) begin
			    		next_state <= S0;
			    	end
			    	else begin
			    		next_state <= S2;
					end
            	end
            	S2: begin
					out <= S2;
            	    if (init == 1'b1) begin
					    next_state <= S0;
					end
					else begin
						next_state <= S3;
					end
				end
				S3: begin
					out <= S3;
					if (init == 1'b1) begin
						next_state <= S0;
					end
					else begin
						next_state <= S3;
					end
				end
				default: begin
					out <= S0;
					next_state <= S0;
				end
			endcase
		end
	end

	// Output at the state
	always @(state) begin
		case (state)
			S0: begin
				out <= S0;
			end
			S1: begin
				out <= S1;
			end
			S2: begin
				out <= S2;
			end
			S3: begin
				out <= S3;
			end
			default: begin
				out <= S0;
			end
		endcase
	end

	// State change with clock signal
	always @(posedge clk) begin
	    state <= next_state;
	end
endmodule