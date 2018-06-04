/**
 **
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;


/**
 * Traduz mnemônicos da linguagem assembly para códigos binários da arquitetura Z0.
 */
public class Code {

    /**
     * Retorna o código binário do(s) registrador(es) que vão receber o valor da instrução.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @codigo= Opcode (String de 4 bits) com código em linguagem de máquina para a instrução.
     */
    public static String dest(String[] mnemnonic) {
    	// MOVW %A, %D
    	// [MOVW, %A, %D]
    	// JMP %D
    	// [JMP, %D]
    	String codigo;
        int size = mnemnonic.length;
    	
    	if (mnemnonic[(size-1)] == "%A"){
    		codigo= "1000";
    	}
    	if (mnemnonic[(size-1)] == "%D"){
    		codigo= "0010";
    	}
    	if (mnemnonic[(size-1)] == "%S"){
    		codigo= "0100";
    	}
    	if (mnemnonic[(size-1)] == "(%A)"){
    		codigo= "0001";
    	}
    	else{
    		codigo= null;	
    	}
    	
    	return codigo;
		
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @codigo= Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
    	String codigo = null;
    	
    	if(mnemnonic[0] == "movw"){
    		if (mnemnonic[1] == "%D" ){
    			codigo= "00001100" ;
    		}
    		else if (mnemnonic[1] == "%A" ){
    			codigo= "00110000" ;
    		}
    		else if (mnemnonic[1] == "%S" ){
    			codigo= "01001100" ;
    		}
    		else{
    			codigo= "10110000" ;
    		}			
    	}
    	
    	else if(mnemnonic[0] == "addw"){
    		if (mnemnonic[1] == "%D" || mnemnonic[1] == "%A"  ){
    			if(mnemnonic[2] == "%A" || mnemnonic[2] == "%D"){
    				codigo= "00000010" ;
    			}
    		}
    			
    		else if (mnemnonic[1] == "%S" || mnemnonic[1] == "%A" ){
    			if(mnemnonic[2] == "%A" || mnemnonic[2] == "%S"){
    				codigo= "01000010" ;
    			}
    			
    		}
    		else if (mnemnonic[1] == "%D" || mnemnonic[1] == "(%A)" ){
    			if(mnemnonic[2] == "(%A)" || mnemnonic[2] == "%D"){
    				codigo= "10000010" ;
    			}
    		}
    		else if (mnemnonic[1] == "%S" || mnemnonic[1] == "(%A)" ){
    			if(mnemnonic[2] == "(%A)" || mnemnonic[2] == "%S"){
    				codigo= "11000010" ;
    			}
    		}
    	}
    	
    	else if(mnemnonic[0] == "subw"){
    		if (mnemnonic[1] == "%D" ){
       			if(mnemnonic[2] == "%A"){
       				codigo= "00010011" ;
       			}
       			else if(mnemnonic[2] == "(%A)"){
       				codigo= "10010011" ;
       			}
       		}
       			
       		else if (mnemnonic[1] == "%S" ){
            	
       			if(mnemnonic[2] == "%A"){
           			codigo= "01010011" ;
           		}
            	else if(mnemnonic[2] == "(%A)"){
           			codigo= "11010011" ;
           		}	
       		}
       		else if (mnemnonic[1] == "%A" ){
       			if(mnemnonic[2] == "%D"){
       				codigo= "00000111" ;
       			}
       			else if(mnemnonic[2] == "(%S)"){
       				codigo= "01000111" ;
       			}
       		}
       			
       		else if (mnemnonic[1] == "(%A)" ){
       			if(mnemnonic[2] == "%D"){
           			codigo= "10000111" ;
           		}
            	else if(mnemnonic[2] == "%S") {
            		codigo= "11000111";
            	}
       		}
    	}
    	else if(mnemnonic[0] == "rsubw"){
    		if (mnemnonic[2] == "%D" ){
       			if(mnemnonic[1] == "%A"){
       				codigo= "00010011" ;
       			}
       			else if(mnemnonic[1] == "(%A)"){
       				codigo= "10010011" ;
       			}
       		}
       			
       		else if (mnemnonic[2] == "%S" ){
            	
       			if(mnemnonic[1] == "%A"){
           			codigo= "01010011" ;
           		}
            	else if(mnemnonic[1] == "(%A)"){
           			codigo= "11010011" ;
           		}	
       		}
       		else if (mnemnonic[2] == "%A" ){
       			if(mnemnonic[1] == "%D"){
       				codigo= "00000111" ;
       			}
       			else if(mnemnonic[1] == "(%S)"){
       				codigo= "01000111" ;
       			}
       		}
       			
       		else if (mnemnonic[2] == "(%A)" ){
       			if(mnemnonic[1] == "%D"){
           			codigo= "10000111" ;
           		}
            	else if(mnemnonic[1] == "%S") {
            		codigo= "11000111";
            	}
       		}
    	}

    	else if(mnemnonic[0] == "incw"){
    		
    		if (mnemnonic[1] == "%D" ){
    			codigo= "00011111" ;
    		}
    		else if (mnemnonic[1] == "%A" ){
    			codigo= "00111011" ;
    		}
    		else if (mnemnonic[1] == "%S" ){
    			codigo= "01011111" ;
    		}
    		else{
    			codigo= "10011111" ;
    		}	
    			
    	}
    	else if(mnemnonic[0] == "decw"){
    		
    		if (mnemnonic[1] == "%D" ){
    			codigo= "00001110" ;
    		}
    		else if (mnemnonic[1] == "%A" ){
    			codigo= "00110010" ;
    		}
    		else if (mnemnonic[1] == "%S" ){
    			codigo= "01001110" ;
    		}
    		else{
    			codigo= "10110010" ;
    		}		
    	}
    	else if(mnemnonic[0] == "notw"){
    		
    		if (mnemnonic[1] == "%D" ){
    			codigo= "00001101" ;
    		}
    		else if (mnemnonic[1] == "%A" ){
    			codigo= "00110001" ;
    		}
    		else if (mnemnonic[1] == "%S" ){
    			codigo= "01001101" ;
    		}
    		else{
    			codigo= "10110001" ;
    		}		
    	}
    	else if(mnemnonic[0] == "negw"){	
    		if (mnemnonic[1] == "%D" ){
    			codigo= "00001111" ;
    		}
    		else if (mnemnonic[1] == "%A" ){
    			codigo= "00110011" ;
    		}
    		else if (mnemnonic[1] == "%S" ){
    			codigo= "01001111" ;
    		}
    		else{
    			codigo= "10110011" ;
    		}	
    			
    	}
    	else if(mnemnonic[0] == "orw"){
    		if (mnemnonic[1] == "%D" || mnemnonic[1] == "%A"  ){
    			if(mnemnonic[2] == "%A" || mnemnonic[2] == "%D"){
    				codigo= "00010101" ;
    			}
    		}
    			
    		else if (mnemnonic[1] == "%S" || mnemnonic[1] == "%A" ){
    			if(mnemnonic[2] == "%A" || mnemnonic[2] == "%S"){
    				codigo= "01010101" ;
    			}
    		}
    		else if (mnemnonic[1] == "%D" || mnemnonic[1] == "(%A)" ){
    			if(mnemnonic[2] == "(%A)" || mnemnonic[2] == "%D"){
    				codigo= "10010101" ;
    			}
    		}
    		else if (mnemnonic[1] == "%S" || mnemnonic[1] == "(%A)" ){
    			if(mnemnonic[2] == "(%A)" || mnemnonic[2] == "%S"){
    				codigo= "11010101" ;
    			}
    		}
    	}
    	else if(mnemnonic[0] == "andw"){
    		if (mnemnonic[1] == "%D" || mnemnonic[1] == "%A"  ){
    			if(mnemnonic[2] == "%A" || mnemnonic[2] == "%D"){
    				codigo= "00000000" ;
    			}
    		}
    			
    		else if (mnemnonic[1] == "%S" || mnemnonic[1] == "%A" ){
    			if(mnemnonic[2] == "%A" || mnemnonic[2] == "%S"){
    				codigo= "01000000" ;
    			}
    		}
    		else if (mnemnonic[1] == "%D" || mnemnonic[1] == "(%A)" ){
    			if(mnemnonic[2] == "(%A)" || mnemnonic[2] == "%D"){
    				codigo= "10000000" ;
    			}
    		}
    		else if (mnemnonic[1] == "%S" || mnemnonic[1] == "(%A)" ){
    			if(mnemnonic[2] == "(%A)" || mnemnonic[2] == "%S"){
    				codigo= "11000000" ;
    			}
    		}
    	}   	
    	return codigo;
  
    }
    	

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @codigo= Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {
    	// MOVW %A, %D
    	// [MOVW, %A, %D]
    	// JMP %D
    	// [JMP, %D]
    	//String jumpBin =""  ;
    	String codigo;
    	if (mnemnonic[0] == "JG"){
    		codigo= "001";
    	}
    	else if(mnemnonic[0] == "JE"){
    		codigo= "010";
    	}
    	else if(mnemnonic[0] == "JGE"){
    		codigo= "011";
    	}
    	else if(mnemnonic[0] == "JL"){
    		codigo= "100";
    	}
    	else if(mnemnonic[0] == "JNE"){
    		codigo=  "101";
    	}
    	else if(mnemnonic[0] == "JLE"){
    		codigo=  "110";
    	}
    	else if(mnemnonic[0] == "JMP"){
    		codigo= "111";
    	}
    	else{
    		codigo= null;
    	}
    	return codigo;
		
    }

    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     * @param  symbol valor numérico decimal armazenado em uma String.
     * @codigo= Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {
    	String codigo= null;
    	int symbolInt = Integer.parseInt(symbol);
    	String b=Integer.toBinaryString(symbolInt);
    	System.out.println(b);
    	if (b.length() !=15){
    		System.out.println("entrrou");
    		String a = "0";
    		int n = 15 - b.length();
    		for (int i = 0; i < n-1; i++) {
    			a = a.concat("0");
    		}
    		System.out.println(a);
    		a= a.concat(b);
    		System.out.println(a);
    		
    	}
    	else{
    		codigo= b;
    	}
    	return codigo;
    	 	
    }

}
