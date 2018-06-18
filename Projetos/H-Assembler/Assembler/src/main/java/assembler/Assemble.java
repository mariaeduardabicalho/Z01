/**
 * Curso: Elementos de Sistemas
 * Arquivo: Assemble.java
 * Created by Luciano <lpsoares@insper.edu.br> 
 * Date: 04/02/2017
 *
 * 2018 @ Rafael Corsi
 */

package assembler;

import java.io.*;
import java.util.*;

/**
 * Faz a geração do código gerenciando os demais módulos
 */
public class Assemble {
    private String inputFile;              // arquivo de entrada nasm
    File hackFile = null;                  // arquivo de saída hack
    private PrintWriter outHACK = null;    // grava saida do código de máquina em Hack
    boolean debug;                         // flag que especifica se mensagens de debug são impressas
    private SymbolTable table;             // tabela de símbolos (variáveis e marcadores)

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public Assemble(String inFile, String outFileHack, boolean debug) throws IOException {
        this.debug = debug;
        inputFile  = inFile;
        hackFile   = new File(outFileHack);                      // Cria arquivo de saída .hack
        outHACK    = new PrintWriter(new FileWriter(hackFile));  // Cria saída do print para
                                                                 // o arquivo hackfile
        table      = new SymbolTable();                          // Cria e inicializa a tabela de simbolos

    }

    /**
     * primeiro passo para a construção da tabela de símbolos de marcadores (labels)
     * varre o código em busca de Símbolos novos Labels e Endereços de memórias
     * e atualiza a tabela de símbolos com os endereços.
     *
     * Dependencia : Parser, SymbolTable
     */
    public void fillSymbolTable() throws FileNotFoundException, IOException {

        Parser parser = new Parser(inputFile);  // abre o arquivo e aponta para o começo
        
        int ram = 16;
        
        int line = 0;
        
        while (parser.advance()){ //itinera sobre as linhas do arquivo para comandos do tipo L (labels)

            if (parser.commandType(parser.command()) == Parser.CommandType.L_COMMAND){  //checa se � do tipo L
                String add_table = parser.label(parser.command()); //criando a string do novo label
                table.addEntry(add_table, line); //adicionando essa string na tabela (linha)
            }
            
            //se nao for do tipo L passa para a proxima linha
            else{
    			line = line + 1;
    			}
        }
        
        while (parser.advance()){  //itinera sobre as linhas do arquivo, dessa vez para comandos do tipo A (enderecos)
            if (parser.commandType(parser.command()) == Parser.CommandType.A_COMMAND){  //checa se � do tipo A
          	  if (!table.contains(parser.symbol(parser.command()))){ //se a tabela nao tiver o endereceo
  					table.addEntry(parser.symbol(parser.command()), ram); //ela � adicionada a tabela (ram)
  					ram ++;
  				}
            }
        }
    }
    /**
     * Segundo passo para a geração do código de máquina
     * Varre o código em busca de instruções do tipo A, C
     * gerando a linguagem de máquina a partir do parse das instruções.
     *
     * Dependencias : Parser, Code
     */
    public void generateMachineCode() throws FileNotFoundException, IOException{
        Parser parser = new Parser(inputFile);  // abre o arquivo e aponta para o começo

        while (parser.advance()){
            String binary_code ="";
            String instructions ="0";

            String machine_instruction ="";
            String [] mnemnonic = parser.instruction(parser.command());

            
        if (parser.commandType(parser.command()) == Parser.CommandType.A_COMMAND){  //considera instrucoes do tipo A
              if (table.contains(parser.symbol(parser.command()))){
                  binary_code = Code.toBinary(String.valueOf(table.getAddress(parser.symbol(parser.command()))));  //gera o binario para a maquina
                  machine_instruction =binary_code+ instructions;
                  //outHACK.write(machine_instruction);
                  //outHACK.print(machine_instruction);
              }
              else {
            	  
            	  //machine_instruction =binary_code+ instruction;
            	  String RESULT = parser.symbol(parser.command());
            	  machine_instruction = instructions + (Code.toBinary(RESULT));;
            	  
              }
              outHACK.write(machine_instruction);  //salva o codigo de maquina
       
              }
        else if (parser.commandType(parser.command()) == Parser.CommandType.C_COMMAND){//considera instrucoes do tipo C
        	binary_code = Code.dest(mnemnonic)+ Code.jump(mnemnonic)+Code.comp(mnemnonic);
        	String x = "1";
        	machine_instruction =binary_code+ instructions;
            outHACK.write(machine_instruction);
            //outHACK.print(machine_instruction);
        }
        }
             

              }


    /**
     * Fecha arquivo de escrita
     */
    public void close() throws IOException {
        if(outHACK!=null) {
            outHACK.close();
        }
    }

    /**
     * Remove o arquivo de .hack se algum erro for encontrado
     */
    public void delete() {
        try{
            if(hackFile!=null) {
                hackFile.delete();
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

}
