`include "bitparidade.v"
module boolean_expression_initial (
    input wire B1, B2, B3, B4, B5, 
    input wire bitparidade, 
    output wire saida, 
    output reg Y1, Y2, Y3, Y4, Y5, Y6, Y7
    
);
    // Instanciando o módulo PARIDADE
    bitparidade U_PARIDADE (
        .B1(B1), 
        .B2(B2), 
        .B3(B3), 
        .B4(B4), 
        .B5(B5), 
        .bitparidade(bitparidade), 
        .saida(saida)
    );


    always @(*) begin
        if (saida == 1'b1) begin
            // Expressões booleanas para LEDs (Y1 a Y7)
            Y1 <= (~B2 & ~B3 & ~B4 & ~B5) | (~B1 & ~B4 & B5) | (~B2 & B4 & B5) | (B3 & B4) | (B1 & ~B5);
            Y2 <= (~B2 & ~B4) | (~B2 & ~B5) | (~B3 & ~B5 & ~B4) | (B2 & B3 & B5) | (B1);
            Y3 <= (~B4 & B5) | (~B2 & B4 & ~B5) | (B3) | (B2 & ~B4) | (B2 & B5) | (B1);
            Y4 <= (B4 & ~B5) | (B3 & ~B4 & B5) | (B2 & B5) | (B1);
            Y5 <= (~B1 & ~B2) | (~B1 & ~B3 & ~B5) | (~B2 & B4 & ~B5) | (~B1 & B4 & B5);
            Y6 <= (~B1 & ~B2 & ~B4) | (~B2 & ~B3 & B5) | (~B4 & B5) | (B3 & B4 & ~B5) | (B2 & ~B3 & ~B5) | (B2 & B3 & ~B4) | (B1 & B4);
            Y7 <= (~B2 & ~B3) | ~B4 | (B2 & B3 & ~B5);
        end else begin
            // Valores padrão quando `saida` é 0
            Y1 = 1'b0;
            Y2 = 1'b0;
            Y3 = 1'b0;
            Y4 = 1'b0;
            Y5 = 1'b0;
            Y6 = 1'b0;
            Y7 = 1'b1;
        end
    end
endmodule
