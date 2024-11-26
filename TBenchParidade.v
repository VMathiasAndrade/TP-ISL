`include "bitparidade.v"

module testbench_bitparidade;

    // Sinais de teste
    reg B1, B2, B3, B4, B5, bitparidade; // Entradas
    wire saida;                          // Saída

    // Instância do módulo bitparidade
    bitparidade uut (
        .B1(B1),
        .B2(B2),
        .B3(B3),
        .B4(B4),
        .B5(B5),
        .bitparidade(bitparidade),
        .saida(saida)
    );

    initial begin
        $dumpfile("bitparidade.vcd"); // Arquivo para visualização no GTKWave
        $dumpvars(0, testbench_bitparidade);

        $monitor("Time=%0t | B1=%b B2=%b B3=%b B4=%b B5=%b | bitparidade=%b | saida=%b",
                 $time, B1, B2, B3, B4, B5, bitparidade, saida);

        // Teste 1: Todos os bits em 0, paridade esperada 0
        B1 = 0; B2 = 0; B3 = 0; B4 = 0; B5 = 0; bitparidade = 0; #10;
        // Teste 2: Todos os bits em 1, paridade esperada 1
        B1 = 1; B2 = 1; B3 = 1; B4 = 1; B5 = 1; bitparidade = 1; #10;
        // Teste 3: Sequência alternada com paridade esperada 0
        B1 = 1; B2 = 0; B3 = 1; B4 = 0; B5 = 1; bitparidade = 0; #10;
        // Teste 4: Sequência alternada com paridade esperada 1
        B1 = 1; B2 = 0; B3 = 1; B4 = 1; B5 = 0; bitparidade = 1; #10;
        // Teste 5: Apenas um bit ativo, paridade esperada 1
        B1 = 1; B2 = 0; B3 = 0; B4 = 0; B5 = 0; bitparidade = 1; #10;
        // Teste 6: Dois bits ativos, paridade esperada 0
        B1 = 1; B2 = 1; B3 = 0; B4 = 0; B5 = 0; bitparidade = 0; #10;

        // Teste 7: Cenário onde a paridade fornecida não bate
        B1 = 1; B2 = 0; B3 = 1; B4 = 1; B5 = 0; bitparidade = 0; #10; // Esperado: saida=0

        // Finalizando a simulação
        $finish;
    end

endmodule
