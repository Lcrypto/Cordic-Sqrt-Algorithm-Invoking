// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.1
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="sqrt_CORDIC,hls_ip_2017_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=1,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu19eg-ffve1924-3-e-es2,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.653200,HLS_SYN_LAT=2007001,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=719,HLS_SYN_LUT=1049}" *)

module sqrt_CORDIC (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        returnValue_din,
        returnValue_full_n,
        returnValue_write
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_state2 = 6'd2;
parameter    ap_ST_fsm_state3 = 6'd4;
parameter    ap_ST_fsm_state4 = 6'd8;
parameter    ap_ST_fsm_state5 = 6'd16;
parameter    ap_ST_fsm_state6 = 6'd32;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [31:0] returnValue_din;
input   returnValue_full_n;
output   returnValue_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg returnValue_write;

(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    returnValue_blk_n;
wire    ap_CS_fsm_state6;
wire   [9:0] i_1_fu_80_p2;
reg   [9:0] i_1_reg_154;
wire    ap_CS_fsm_state2;
wire   [47:0] input_in_V_fu_90_p3;
reg   [47:0] input_in_V_reg_159;
wire   [0:0] exitcond_fu_74_p2;
wire   [24:0] grp_cordic_base_fu_66_ap_return;
reg   [24:0] output_out_V_reg_164;
wire    ap_CS_fsm_state3;
wire    grp_cordic_base_fu_66_ap_done;
wire   [0:0] tmp_3_fu_99_p2;
reg   [0:0] tmp_3_reg_169;
wire    ap_CS_fsm_state4;
wire   [31:0] res_V_1_fu_109_p1;
reg   [31:0] res_V_1_reg_179;
wire    ap_CS_fsm_state5;
reg   [7:0] exp_V_reg_184;
wire    grp_cordic_base_fu_66_ap_start;
wire    grp_cordic_base_fu_66_ap_idle;
wire    grp_cordic_base_fu_66_ap_ready;
reg   [9:0] i_reg_55;
reg    ap_reg_grp_cordic_base_fu_66_ap_start;
wire   [31:0] grp_fu_71_p0;
wire   [0:0] tmp_fu_86_p1;
wire   [31:0] grp_fu_71_p1;
wire   [7:0] exp_V_2_fu_123_p2;
wire   [31:0] p_Result_s_fu_128_p5;
wire   [31:0] dp_fu_139_p1;
reg   [5:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'd1;
#0 ap_reg_grp_cordic_base_fu_66_ap_start = 1'b0;
end

cordic_base grp_cordic_base_fu_66(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_cordic_base_fu_66_ap_start),
    .ap_done(grp_cordic_base_fu_66_ap_done),
    .ap_idle(grp_cordic_base_fu_66_ap_idle),
    .ap_ready(grp_cordic_base_fu_66_ap_ready),
    .inputData_in_V_read(input_in_V_reg_159),
    .ap_return(grp_cordic_base_fu_66_ap_return)
);

sqrt_CORDIC_uitofbkb #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
sqrt_CORDIC_uitofbkb_U2(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_71_p0),
    .ce(1'b1),
    .dout(grp_fu_71_p1)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_reg_grp_cordic_base_fu_66_ap_start <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state2) & (exitcond_fu_74_p2 == 1'd0))) begin
            ap_reg_grp_cordic_base_fu_66_ap_start <= 1'b1;
        end else if ((1'b1 == grp_cordic_base_fu_66_ap_ready)) begin
            ap_reg_grp_cordic_base_fu_66_ap_start <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state6) & (returnValue_full_n == 1'b1))) begin
        i_reg_55 <= i_1_reg_154;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_reg_55 <= 10'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd0 == tmp_3_reg_169) & (1'b1 == ap_CS_fsm_state5))) begin
        exp_V_reg_184 <= {{res_V_1_fu_109_p1[30:23]}};
        res_V_1_reg_179 <= res_V_1_fu_109_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_1_reg_154 <= i_1_fu_80_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (exitcond_fu_74_p2 == 1'd0))) begin
        input_in_V_reg_159[47] <= input_in_V_fu_90_p3[47];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state3) & (grp_cordic_base_fu_66_ap_done == 1'b1))) begin
        output_out_V_reg_164 <= grp_cordic_base_fu_66_ap_return;
        tmp_3_reg_169 <= tmp_3_fu_99_p2;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (exitcond_fu_74_p2 == 1'd1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (exitcond_fu_74_p2 == 1'd1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        returnValue_blk_n = returnValue_full_n;
    end else begin
        returnValue_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) & (returnValue_full_n == 1'b1))) begin
        returnValue_write = 1'b1;
    end else begin
        returnValue_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (exitcond_fu_74_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (grp_cordic_base_fu_66_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == ap_CS_fsm_state6) & (returnValue_full_n == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign dp_fu_139_p1 = p_Result_s_fu_128_p5;

assign exitcond_fu_74_p2 = ((i_reg_55 == 10'd1000) ? 1'b1 : 1'b0);

assign exp_V_2_fu_123_p2 = ($signed(8'd232) + $signed(exp_V_reg_184));

assign grp_cordic_base_fu_66_ap_start = ap_reg_grp_cordic_base_fu_66_ap_start;

assign grp_fu_71_p0 = output_out_V_reg_164;

assign i_1_fu_80_p2 = (i_reg_55 + 10'd1);

assign input_in_V_fu_90_p3 = {{tmp_fu_86_p1}, {47'd0}};

assign p_Result_s_fu_128_p5 = {{res_V_1_reg_179[31:31]}, {exp_V_2_fu_123_p2}, {res_V_1_reg_179[22:0]}};

assign res_V_1_fu_109_p1 = grp_fu_71_p1;

assign returnValue_din = ((tmp_3_reg_169[0:0] === 1'b1) ? 32'd0 : dp_fu_139_p1);

assign tmp_3_fu_99_p2 = ((grp_cordic_base_fu_66_ap_return == 25'd0) ? 1'b1 : 1'b0);

assign tmp_fu_86_p1 = i_1_fu_80_p2[0:0];

always @ (posedge ap_clk) begin
    input_in_V_reg_159[46:0] <= 47'b00000000000000000000000000000000000000000000000;
end

endmodule //sqrt_CORDIC
