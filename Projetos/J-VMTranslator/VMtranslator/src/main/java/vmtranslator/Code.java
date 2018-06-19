/**
* Curso: Elementos de Sistemas
 * Arquivo: Code.java
 * Created by Luciano Soares <lpsoares@insper.edu.br>
 * Date: 2/05/2017
 * Adaptado por Rafael Corsi <rafael.corsi@insper.edu.br>
 * Date: 5/2018
 */

package vmtranslator;

import java.util.*;
import java.io.*;
import java.nio.file.*;

/**
 * Traduz da linguagem vm para códigos assembly.
 */
public class Code {

    PrintWriter outputFile = null;  // arquivo .nasm de saída
    String filename = null;         // arquivo .vm de entrada
    int lineCode = 0;               // Linha do codigo vm que gerou as instrucoes

    /**
     * Abre o arquivo de saida e prepara para escrever
     * @param filename nome do arquivo NASM que receberá o código traduzido.
     */
    public Code(String filename) throws FileNotFoundException,IOException {
        File file = new File(filename);
        this.outputFile = new PrintWriter(new FileWriter(file));
    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para executar o comando aritmético.
     * @param  command comando aritmético a ser analisado.
     */
    protected String getSaltString() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 18) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;
        
    }
    
    String eqlabelt = getSaltString();
    String eqlabelf = getSaltString();
    String gtlabelt = getSaltString();
    String gtlabelf = getSaltString();
    String ltlabelt = getSaltString();
    String ltlabelf = getSaltString();
    
    
    public void writeArithmetic(String command) {

        if ( command.equals("")) {
            Error.error("Instrução invalida");
        }
 
        List<String> commands = new ArrayList<String>();

        if(command.equals("add")) {
            commands.add(String.format("; %d - ADD", lineCode++));
            // gurda a ram que o sp ta apontando em A e oq essa ram ta apontando em S
            commands.add("leaw $SP,%A"); // SP = 0
            commands.add("movw (%A),%S");
            commands.add("movw %S,%A");
            commands.add("movw (%A),%S");
           //guarda o que esta acima da ram do sp em A 
            commands.add("decw %A");
            // Faz a soma
            commands.add("addw (%A),%S,%D");
            // depois guarda na ram acima o que deu na soma  
            commands.add("movw %D, (%A)");
            commands.add("movw %A, %D");
            // muda o SP para apontar para essa ram
            commands.add("leaw $SP,%A"); // SP = 0
            commands.add("movw %D,(%A)"); // S = RAM[0] -> SP 
          
     
            System.out.println("soma realizada");
 
        } else if (command.equals("sub")) {
            commands.add(String.format("; %d - SUB", lineCode++));
            // gurda a ram que o sp ta apontando em A e oq essa ram ESta guardando em S
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%S");
            commands.add("movw %S,%A");
            commands.add("movw (%A),%S");
            //guarda o que esta acima da ram do sp em A 
            commands.add("decw %A");
            // Faz a subtracao
            commands.add("subw (%A),%S,%D");
            commands.add("movw %D, (%A)");
            //passa a ram que a esta guardando para D para passar a ram para o SP
            commands.add("movw %A, %D");
            commands.add("leaw $SP,%A");
            commands.add("movw %D, (%A)");
            
            System.out.println("subtacao realizada");
            

        } else if (command.equals("neg")) {
            commands.add(String.format("; %d - NEG", lineCode++));
            
            // gurda a ram que o sp ta apontando em A e oq essa ram esta guardando em S
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%S");
            commands.add("movw %S,%A");
            commands.add("movw (%A),%S");
            //Faz a negacao
            commands.add("neg %S");
            // Move para a ram que A esta apontando
            commands.add("movw %S, (%A)");
            
            System.out.println("negacao realizada");

        } else if (command.equals("eq")) {
            commands.add(String.format("; %d - EQ", lineCode++));
            
            // gurda a ram que o sp ta apontando em A e oq essa ram ESta guardando em S
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%S");
            commands.add("movw %S,%A");
            commands.add("movw (%A),%S");
            //guarda o que esta acima da ram do sp em A 
            commands.add("decw %A");
            // Faz a subtracao
            commands.add("subw (%A),%S,%D");
            commands.add("leaw $eqlabelt, %A");
            // Vai para o if se o resultado da sub for igual a zero
            commands.add("je %D");
            commands.add("nop");
           
            // se n, adciona 0 na pilha
            //coloca na ram depois que o SP aponta 
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%S");
            commands.add("movw %S,%A");
            commands.add("incw %A");
            commands.add("leaw $0, (%A)");
            // e muda o SP para apontar para ela
            commands.add("movw %A, %D");
            commands.add("leaw $SP,%A");
            commands.add("movw %D, (%A)");
            commands.add("leaw $eqlabelf, %A");
            commands.add("jmp ");
            commands.add("nop");
            
            
            //cria o label 
            commands.add("eqlabelt");
            // se sim, adciona 0 na pilha
            //coloca na ram depois que o SP aponta 
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%S");
            commands.add("movw %S,%A");
            commands.add("incw %A");
            commands.add("leaw $-1, (%A)");
            // e muda o SP para apontar para ela
            commands.add("movw %A, %D");
            commands.add("leaw $SP,%A");
            commands.add("movw %D, (%A)");
            
            commands.add("eqlabelf");
            
            
            System.out.println("eq realizado");
            
            
            
            

        } else if (command.equals("gt")) {
            commands.add(String.format("; %d - GT", lineCode++));
         // gurda a ram que o sp ta apontando em A e oq essa ram ESta guardando em S
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%S");
            commands.add("movw %S,%A");
            commands.add("movw (%A),%S");
            //guarda o que esta acima da ram do sp em A 
            commands.add("decw %A");
            // Faz a subtracao
            commands.add("subw (%A),%S,%D");
            commands.add("leaw $gtlabelt, %A");
            // Vai para o if se o resultado da sub for igual a zero
            commands.add("jg %D");
            commands.add("nop");
            
         // se n, adciona 0 na pilha
            //coloca na ram depois que o SP aponta 
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%S");
            commands.add("movw %S,%A");
            commands.add("incw %A");
            commands.add("leaw $0, (%A)");
            // e muda o SP para apontar para ela
            commands.add("movw %A, %D");
            commands.add("leaw $SP,%A");
            commands.add("movw %D, (%A)");
            commands.add("leaw $gtlabelf, %A");
            commands.add("jmp ");
            commands.add("nop");
            
            
            //cria o label 
            commands.add("gtlabelt");
            // se sim, adciona 0 na pilha
            //coloca na ram depois que o SP aponta 
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%S");
            commands.add("movw %S,%A");
            commands.add("incw %A");
            commands.add("leaw $-1, (%A)");
            // e muda o SP para apontar para ela
            commands.add("movw %A, %D");
            commands.add("leaw $SP,%A");
            commands.add("movw %D, (%A)");
            
            commands.add("eqlabelf");
            
            System.out.println("gt realizado");
            
            
            
            
            
            
            

        } else if (command.equals("lt")) {
            commands.add(String.format("; %d - LT", lineCode++));
            
         // gurda a ram que o sp ta apontando em A e oq essa ram ESta guardando em S
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%S");
            commands.add("movw %S,%A");
            commands.add("movw (%A),%S");
            //guarda o que esta acima da ram do sp em A 
            commands.add("decw %A");
            // Faz a subtracao
            commands.add("subw (%A),%S,%D");
            commands.add("leaw $ltlabelt, %A");
            // Vai para o if se o resultado da sub for igual a zero
            commands.add("jl %D");
            commands.add("nop");
            
         // se n, adciona 0 na pilha
            //coloca na ram depois que o SP aponta 
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%S");
            commands.add("movw %S,%A");
            commands.add("incw %A");
            commands.add("leaw $0, (%A)");
            // e muda o SP para apontar para ela
            commands.add("movw %A, %D");
            commands.add("leaw $SP,%A");
            commands.add("movw %D, (%A)");
            commands.add("leaw $ltlabelf, %A");
            commands.add("jmp ");
            commands.add("nop");
            
            
            //cria o label 
            commands.add("ltlabelt");
            // se sim, adciona 0 na pilha
            //coloca na ram depois que o SP aponta 
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%S");
            commands.add("movw %S,%A");
            commands.add("incw %A");
            commands.add("leaw $-1, (%A)");
            // e muda o SP para apontar para ela
            commands.add("movw %A, %D");
            commands.add("leaw $SP,%A");
            commands.add("movw %D, (%A)");
            
            commands.add("ltlabelf");
            
            System.out.println("lt realizado");

        } else if (command.equals("and")) {
            commands.add(String.format("; %d - AND", lineCode++));
            
            // gurda a ram que o sp ta apontando em A e oq essa ram ESta guardando em S
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%S");
            commands.add("movw %S,%A");
            commands.add("movw (%A),%S");
            //guarda o que esta acima da ram do sp em A 
            commands.add("decw %A");
            // faz o and 
            commands.add("andw (%A), %S, %D");
            commands.add("movw %D, (%A)");
            //passa a ram que a esta guardando para D para passar a ram para o SP
            commands.add("movw %A, %D");
            commands.add("leaw $SP,%A");
            commands.add("movw %D, (%A)");
            
            System.out.println("and  realizado");
            
            
            

        } else if (command.equals("or")) {
            commands.add(String.format("; %d - OR", lineCode++));
            

            // gurda a ram que o sp ta apontando em A e oq essa ram ESta guardando em S
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%S");
            commands.add("movw %S,%A");
            commands.add("movw (%A),%S");
            //guarda o que esta acima da ram do sp em A 
            commands.add("decw %A");
            // faz o and 
            commands.add("orw (%A), %S, %D");
            commands.add("movw %D, (%A)");
            //passa a ram que a esta guardando para D para passar a ram para o SP
            commands.add("movw %A, %D");
            commands.add("leaw $SP,%A");
            commands.add("movw %D, (%A)");
            
            System.out.println("and  realizado");

        } else if (command.equals("not")) {
            commands.add(String.format("; %d - NOT", lineCode++));
            
         // gurda a ram que o sp ta apontando em A e oq essa ram esta guardando em S
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%S");
            commands.add("movw %S,%A");
            commands.add("movw (%A),%S");
            //Faz o not
            commands.add("notw %S");
            // Move para a ram que A esta apontando
            commands.add("movw %S, (%A)");

        }

        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);

    }


	/**
	 * Grava no arquivo de saida as instruções em Assembly para executar o comando de Push ou Pop.
	 * @param  command comando de push ou pop a ser analisado.
	 * @param  segment segmento de memória a ser usado pelo comando.
	 * @param  index índice do segkento de memória a ser usado pelo comando.
	 */
	public void writePushPop(Parser.CommandType command, String segment, Integer index) {

		if ( command.equals("")) {
			Error.error("Instrução invalida");
		}

		List<String> commands = new ArrayList<String>();

		if(command == Parser.CommandType.C_POP) {
			commands.add(String.format("; %d - POP %s %d", lineCode++ ,segment, index));

			if (segment.equals("constant")) {
				Error.error("Não faz sentido POP com constant");
			} else if (segment.equals("local")) {
				commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
				commands.add("movw (%A), %A"); //move o valor apontado pelo SP para o reg A
				commands.add("decw %A"); //subtrai 1 do valor apontado pelo SP para pegar o ultimo valor da pilha
				commands.add("movw (%A), %D"); //move o ultimo valor da pilha para o reg D
				//acabou de pegar o ultimo valor da pilha e armazenar no reg D


				commands.add("leaw $LCL, %A"); //passa o valor do local para o reg A
				commands.add("movw (%A), %S"); //move o valor apontado pelo Local para o reg S
				commands.add("leaw $"+index+", %A"); //pega o index
				commands.add("addw %S, %A, %A"); //soma o valor do local 0 com o valor do index
				commands.add("movw %D, (%A)"); //move o ultimo valor da pilha armzenado em D para o endereco do local(index)

				commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
				commands.add("movw (%A), %A"); //move o valor apontado pelo SP para o reg A
				commands.add("decw %A"); //subtrai 1 do valor apontado pelo SP para pegar o ultimo valor da pilha
				commands.add("movw %A, %S"); //move o valor apontado pelo sp menos 1 para o reg S
				commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
				commands.add("movw %S, (%A)"); //aponta o SP para uma pilha a menos  
				//acabou de mudar o SP para 'retirar' o ultimo elemento da pilha

			} else if (segment.equals("argument")) {
				commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
				commands.add("movw (%A), %A"); //move o valor apontado pelo SP para o reg A
				commands.add("decw %A"); //subtrai 1 do valor apontado pelo SP para pegar o ultimo valor da pilha
				commands.add("movw (%A), %D"); //move o ultimo valor da pilha para o reg D
				//acabou de pegar o ultimo valor da pilha e armazenar no reg D


				commands.add("leaw $ARG, %A"); //passa o valor do argument para o reg A
				commands.add("movw (%A), %S"); //move o valor apontado pelo Argument para o reg S
				commands.add("leaw $"+index+", %A"); //pega o index
				commands.add("addw %S, %A, %A"); //soma o valor do arg 0 com o valor do index
				commands.add("movw %D, (%A)"); //move o ultimo valor da pilha armzenado em D para o endereco do arg(index)

				commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
				commands.add("movw (%A), %A"); //move o valor apontado pelo SP para o reg A
				commands.add("decw %A"); //subtrai 1 do valor apontado pelo SP para pegar o ultimo valor da pilha
				commands.add("movw %A, %S"); //move o valor apontado pelo sp menos 1 para o reg S
				commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
				commands.add("movw %S, (%A)"); //aponta o SP para uma pilha a menos  
				//acabou de mudar o SP para 'retirar' o ultimo elemento da pilha

			} else if (segment.equals("this")) {
				commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
				commands.add("movw (%A), %A"); //move o valor apontado pelo SP para o reg A
				commands.add("decw %A"); //subtrai 1 do valor apontado pelo SP para pegar o ultimo valor da pilha
				commands.add("movw (%A), %D"); //move o ultimo valor da pilha para o reg D
				//acabou de pegar o ultimo valor da pilha e armazenar no reg D


				commands.add("leaw $THIS, %A"); //passa o valor do this para o reg A
				commands.add("movw (%A), %S"); //move o valor apontado pelo This para o reg S
				commands.add("leaw $"+index+", %A"); //pega o index
				commands.add("addw %S, %A, %A"); //soma o valor do this 0 com o valor do index
				commands.add("movw %D, (%A)"); //move o ultimo valor da pilha armzenado em D para o endereco do this(index)

				commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
				commands.add("movw (%A), %A"); //move o valor apontado pelo SP para o reg A
				commands.add("decw %A"); //subtrai 1 do valor apontado pelo SP para pegar o ultimo valor da pilha
				commands.add("movw %A, %S"); //move o valor apontado pelo sp menos 1 para o reg S
				commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
				commands.add("movw %S, (%A)"); //aponta o SP para uma pilha a menos  
				//acabou de mudar o SP para 'retirar' o ultimo elemento da pilha

			} else if (segment.equals("that")) {
				commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
				commands.add("movw (%A), %A"); //move o valor apontado pelo SP para o reg A
				commands.add("decw %A"); //subtrai 1 do valor apontado pelo SP para pegar o ultimo valor da pilha
				commands.add("movw (%A), %D"); //move o ultimo valor da pilha para o reg D
				//acabou de pegar o ultimo valor da pilha e armazenar no reg D

				commands.add("leaw $THAT, %A"); //passa o valor do THAT para o reg A
				commands.add("movw (%A), %S"); //move o valor apontado pelo THAT para o reg S
				commands.add("leaw $"+index+", %A"); //pega o index
				commands.add("addw %S, %A, %A"); //soma o valor do THAT 0 com o valor do index
				commands.add("movw %D, (%A)"); //move o ultimo valor da pilha armzenado em D para o endereco do THAT(index)

				commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
				commands.add("movw (%A), %A"); //move o valor apontado pelo SP para o reg A
				commands.add("decw %A"); //subtrai 1 do valor apontado pelo SP para pegar o ultimo valor da pilha
				commands.add("movw %A, %S"); //move o valor apontado pelo sp menos 1 para o reg S
				commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
				commands.add("movw %S, (%A)"); //aponta o SP para uma pilha a menos  
				//acabou de mudar o SP para 'retirar' o ultimo elemento da pilha

			} else if (segment.equals("static")) {
				commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
				commands.add("movw (%A), %A"); //move o valor apontado pelo SP para o reg A
				commands.add("decw %A"); //subtrai 1 do valor apontado pelo SP para pegar o ultimo valor da pilha
				commands.add("movw (%A), %D"); //move o ultimo valor da pilha para o reg D
				//acabou de pegar o ultimo valor da pilha e armazenar no reg D

				commands.add("leaw $LCL, %A"); //passa o valor do local para o reg A
				commands.add("movw (%A), %S"); //move o valor apontado pelo local para o reg S
				commands.add("leaw $"+filename + "-" +  index+", %A"); //pega o index
				commands.add("addw %S, %A, %A"); //soma o valor do local 0 com o valor do index
				commands.add("movw %D, (%A)"); //move o ultimo valor da pilha armzenado em D para o endereco

				commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
				commands.add("movw (%A), %A"); //move o valor apontado pelo SP para o reg A
				commands.add("decw %A"); //subtrai 1 do valor apontado pelo SP para pegar o ultimo valor da pilha
				commands.add("movw %A, %S"); //move o valor apontado pelo sp menos 1 para o reg S
				commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
				commands.add("movw %S, (%A)"); //aponta o SP para uma pilha a menos  
				//acabou de mudar o SP para 'retirar' o ultimo elemento da pilha

			} else if (segment.equals("temp")) {
				commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
				commands.add("movw (%A), %A"); //move o valor apontado pelo SP para o reg A
				commands.add("decw %A"); //subtrai 1 do valor apontado pelo SP para pegar o ultimo valor da pilha
				commands.add("movw (%A), %D"); //move o ultimo valor da pilha para o reg D
				commands.add("movw %A, %S"); //passa o endereco do ultimo valor da pilha para o reg S
				//acabou de pegar o ultimo valor da pilha e armazenar no reg D

				commands.add("leaw $SP, %A"); //passa o valor do sp para o reg A
				commands.add("leaw $"+index+", %A");  //pega o index
				commands.add("movw %A, %S"); //move o valor apontado pelo local para o reg S
				commands.add("leaw $5, %A"); //pega o index
				commands.add("addw %S, %A, %A"); //soma o valor do local 0 com o valor do index
				commands.add("movw %D, (%A)"); //move o ultimo valor da pilha armzenado em D para o endereco

				commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
				commands.add("movw (%A), %A"); //move o valor apontado pelo SP para o reg A
				commands.add("decw %A"); //subtrai 1 do valor apontado pelo SP para pegar o ultimo valor da pilha
				commands.add("movw %A, %S"); //move o valor apontado pelo sp menos 1 para o reg S
				commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
				commands.add("movw %S, (%A)"); //aponta o SP para uma pilha a menos  
				//acabou de mudar o SP para 'retirar' o ultimo elemento da pilha

			} else if (segment.equals("pointer")) {
				if(index==0) {
					commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
					commands.add("movw (%A), %A"); //move o valor apontado pelo SP para o reg A
					commands.add("decw %A"); //subtrai 1 do valor apontado pelo SP para pegar o ultimo valor da pilha
					commands.add("movw (%A), %D"); //move o ultimo valor da pilha para o reg D
					commands.add("movw %A, %S"); //passa o endereco do ultimo valor da pilha para o reg S
					//acabou de pegar o ultimo valor da pilha e armazenar no reg D

					commands.add("leaw $SP, %A"); //passa o valor do sp para o reg A
					commands.add("leaw $THIS, %A");  //pega o this
					commands.add("movw %D, (%A)"); //move o ultimo valor da pilha armzenado em D para o endereco

					commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
					commands.add("movw (%A), %A"); //move o valor apontado pelo SP para o reg A
					commands.add("decw %A"); //subtrai 1 do valor apontado pelo SP para pegar o ultimo valor da pilha
					commands.add("movw %A, %S"); //move o valor apontado pelo sp menos 1 para o reg S
					commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
					commands.add("movw %S, (%A)"); //aponta o SP para uma pilha a menos  
					//acabou de mudar o SP para 'retirar' o ultimo elemento da pilha

				} else {
					commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
					commands.add("movw (%A), %A"); //move o valor apontado pelo SP para o reg A
					commands.add("decw %A"); //subtrai 1 do valor apontado pelo SP para pegar o ultimo valor da pilha
					commands.add("movw (%A), %D"); //move o ultimo valor da pilha para o reg D
					commands.add("movw %A, %S"); //passa o endereco do ultimo valor da pilha para o reg S
					//acabou de pegar o ultimo valor da pilha e armazenar no reg D

					commands.add("leaw $SP, %A"); //passa o valor do sp para o reg A
					commands.add("leaw $THAT, %A");  //pega o that
					commands.add("movw %D, (%A)"); //move o ultimo valor da pilha armzenado em D para o endereco

					commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
					commands.add("movw (%A), %A"); //move o valor apontado pelo SP para o reg A
					commands.add("decw %A"); //subtrai 1 do valor apontado pelo SP para pegar o ultimo valor da pilha
					commands.add("movw %A, %S"); //move o valor apontado pelo sp menos 1 para o reg S
					commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A
					commands.add("movw %S, (%A)"); //aponta o SP para uma pilha a menos  
					//acabou de mudar o SP para 'retirar' o ultimo elemento da pilha

				}
			}
		} else if (command == Parser.CommandType.C_PUSH) {
			commands.add(String.format("; %d - PUSH %s %d", lineCode++ ,segment, index));


            if (segment.equals("constant")) {
            	commands.add("leaw $SP, %A"); //passa o valor do stack pointer (0) para o reg A

				commands.add("movw (%A), %A"); //move o valor apontado pelo SP para o reg A
				commands.add("decw %A"); //subtrai 1 do valor apontado pelo SP para pegar o ultimo valor da pilha

			} else if (segment.equals("local")) {

			} else if (segment.equals("argument")) {

			} else if (segment.equals("this")) {

			} else if (segment.equals("that")) {

			} else if (segment.equals("static")) {

			} else if (segment.equals("temp")) {

			} else if (segment.equals("pointer")) {
				if(index==0) {

				} else {

				}
			}
		}

		String[] stringArray = new String[ commands.size() ];
		commands.toArray( stringArray );
		write(stringArray);

	}

	/**
	 * Grava no arquivo de saida as instruções em Assembly para inicializar o processo da VM (bootstrap).
	 * Também prepara a chamada para a função Sys.init
	 * O código deve ser colocado no início do arquivo de saída.
	 */
	public void writeInit(boolean bootstrap, boolean isDir) {

		List<String> commands = new ArrayList<String>();

		if(bootstrap || isDir)
			commands.add( "; Inicialização para VM" );

		if(bootstrap) {
			commands.add("leaw $256,%A");
			commands.add("movw %A,%D");
			commands.add("leaw $SP,%A");
			commands.add("movw %D,(%A)");
		}

		if(isDir){
			commands.add("leaw $Main.main, %A");
			commands.add("jmp");
			commands.add("nop");
		}

		if(bootstrap || isDir) {
			String[] stringArray = new String[commands.size()];
			commands.toArray(stringArray);
			write(stringArray);
		}
	}

	/**
	 * Grava no arquivo de saida as instruções em Assembly para gerar o labels (marcadores de jump).
	 * @param  label define nome do label (marcador) a ser escrito.
	 */
	public void writeLabel(String label) {

		List<String> commands = new ArrayList<String>();
		commands.add( "; Label (marcador)" );

	}

	/**
	 * Grava no arquivo de saida as instruções em Assembly para gerar as instruções de goto (jumps).
	 * Realiza um jump incondicional para o label informado.
	 * @param  label define jump a ser realizado para um label (marcador).
	 */
	public void writeGoto(String label) {

		List<String> commands = new ArrayList<String>();
		commands.add(String.format("; %d - Goto Incondicional", lineCode++));

	}

	/**
	 * Grava no arquivo de saida as instruções em Assembly para gerar as instruções de goto condicional (jumps condicionais).
	 * Realiza um jump condicional para o label informado.
	 * @param  label define jump a ser realizado para um label (marcador).
	 */
	public void writeIf(String label) {

		List<String> commands = new ArrayList<String>();
		commands.add(String.format("; %d - Goto Condicional", lineCode++));

	 }

	/**
	 * Grava no arquivo de saida as instruções em Assembly para uma chamada de função (Call).
	 * @param  functionName nome da função a ser "chamada" pelo call.
	 * @param  numArgs número de argumentos a serem passados na função call.
	 */
	public void writeCall(String functionName, Integer numArgs) {

		List<String> commands = new ArrayList<String>();
		commands.add(String.format("; %d - chamada de funcao %s", lineCode++, functionName));

	}

	/**
	 * Grava no arquivo de saida as instruções em Assembly para o retorno de uma sub rotina.
	 */
	public void writeReturn() {

		List<String> commands = new ArrayList<String>();
		commands.add(String.format("; %d - Retorno de função", lineCode++));

	}

	/**
	 * Grava no arquivo de saida as instruções em Assembly para a declaração de uma função.
	 * @param  functionName nome da função a ser criada.
	 * @param  numLocals número de argumentos a serem passados na função call.
	 */
	public void writeFunction(String functionName, Integer numLocals) {

		List<String> commands = new ArrayList<String>();
		commands.add(String.format("; %d - Declarando função %s", lineCode++, functionName));

	}

	/**
	 * Armazena o nome do arquivo vm de origem.
	 * Usado para definir os dados estáticos do código (por arquivo).
	 * @param file nome do arquivo sendo tratado.
	 */
	public void vmfile(String file) {

		int i = file.lastIndexOf(File.separator);
		int j = file.lastIndexOf('.');
		this.filename = file.substring(i+1,j);

	}

	// grava as instruções em Assembly no arquivo de saída
	public void write(String[] stringArray) {
		// gravando comandos no arquivos
		for (String s: stringArray) {
			this.outputFile.println(s);
		}
	}

	// fecha o arquivo de escrita
	public void close() throws IOException {
		this.outputFile.close();
	}

}
