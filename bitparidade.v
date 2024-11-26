module bitparidade (
    input wire B1, B2, B3, B4, B5, bitparidade,
    output reg saida
);
    always @(*) begin

        
        // Calculando o bit de paridade
        if (bitparidade == (B1 ^ B2 ^ B3 ^ B4 ^ B5)) begin
            saida = 1'b1; // Igualdade confirmada
        end else begin
            saida = 1'b0; // Igualdade não confirmada
        end
    end
endmodule
