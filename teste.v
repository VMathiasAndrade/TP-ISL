`timescale 1ns/1ps

`include "tp.v"

module testebench;
    // Sinais de teste
    reg B1, B2, B3, B4, B5, bitparidade; 
    wire saida, Y1, Y2, Y3, Y4, Y5, Y6, Y7;

    // Instância do módulo sendo testado
    boolean_expression_initial uut (
        .B1(B1), 
        .B2(B2), 
        .B3(B3), 
        .B4(B4), 
        .B5(B5), 
        .bitparidade(bitparidade), 
        .saida(saida), 
        .Y1(Y1), 
        .Y2(Y2), 
        .Y3(Y3), 
        .Y4(Y4), 
        .Y5(Y5), 
        .Y6(Y6), 
        .Y7(Y7)
    );



    initial begin
        $dumpfile("boolean_expression.vcd"); 
        $dumpvars(0, testebench);
        

        $monitor("Time=%0t | B1=%b B2=%b B3=%b B4=%b B5=%b bitparidade=%b | Saida=%b | Y1=%b Y2=%b Y3=%b Y4=%b Y5=%b Y6=%b Y7=%b",
                 $time, B1, B2, B3, B4, B5, bitparidade, saida, Y1, Y2, Y3, Y4, Y5, Y6, Y7);

        // Casos de teste
        B1 = 0; B2 = 0; B3 = 0; B4 = 0; B5 = 0; bitparidade = 0; #100;
        B1 = 0; B2 = 0; B3 = 0; B4 = 0; B5 = 1; bitparidade = 1; #100;
        B1 = 0; B2 = 0; B3 = 0; B4 = 1; B5 = 0; bitparidade = 1; #100;
        B1 = 0; B2 = 0; B3 = 0; B4 = 1; B5 = 1; bitparidade = 0; #100;
        B1 = 0; B2 = 0; B3 = 1; B4 = 0; B5 = 0; bitparidade = 1; #100;
        B1 = 0; B2 = 0; B3 = 1; B4 = 0; B5 = 1; bitparidade = 0; #100;
        B1 = 0; B2 = 0; B3 = 1; B4 = 1; B5 = 0; bitparidade = 0; #100;
        B1 = 0; B2 = 0; B3 = 1; B4 = 1; B5 = 1; bitparidade = 1; #100;
        B1 = 0; B2 = 1; B3 = 0; B4 = 0; B5 = 0; bitparidade = 1; #100;
        B1 = 0; B2 = 1; B3 = 0; B4 = 0; B5 = 1; bitparidade = 0; #100;
        B1 = 0; B2 = 1; B3 = 0; B4 = 1; B5 = 0; bitparidade = 0; #100;
        B1 = 0; B2 = 1; B3 = 0; B4 = 1; B5 = 1; bitparidade = 1; #100;
        B1 = 0; B2 = 1; B3 = 1; B4 = 0; B5 = 0; bitparidade = 0; #100;
        B1 = 0; B2 = 1; B3 = 1; B4 = 0; B5 = 1; bitparidade = 1; #100;
        B1 = 0; B2 = 1; B3 = 1; B4 = 1; B5 = 0; bitparidade = 1; #100;
        B1 = 0; B2 = 1; B3 = 1; B4 = 1; B5 = 1; bitparidade = 0; #100;
        B1 = 1; B2 = 0; B3 = 0; B4 = 0; B5 = 0; bitparidade = 1; #100;
        B1 = 1; B2 = 0; B3 = 0; B4 = 0; B5 = 1; bitparidade = 0; #100;
        B1 = 1; B2 = 0; B3 = 0; B4 = 1; B5 = 0; bitparidade = 0; #100;
        B1 = 1; B2 = 0; B3 = 0; B4 = 1; B5 = 1; bitparidade = 1; #100;
        B1 = 1; B2 = 1; B3 = 1; B4 = 1; B5 = 1; bitparidade = 0; #100; // bitparidade errado
        B1 = 1; B2 = 0; B3 = 1; B4 = 0; B5 = 0; bitparidade = 1; #100;//bitparidade errado
        B1 = 1; B2 = 0; B3 = 1; B4 = 0; B5 = 1; bitparidade = 0; #100;
        $finish;
    end
endmodule
