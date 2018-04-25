/**
 * Curso: Elementos de Sistemas
 * Arquivo: CodeTest.java
 * Created by Luciano Soares <lpsoares@insper.edu.br> 
 * Date: 16/04/2017
 */

package assembler;

import org.junit.Test;
import org.junit.Assert;
import static org.junit.Assert.assertTrue;

import assembler.Code;

public class CodeTest  {

    /**
     * Create the test case
     */
    public CodeTest() {

    }
	
    /**
     * Teste para conversão para binário
     */
    @Test
    public void testCode_toBinary() {

    	try {
    		org.junit.Assume.assumeNotNull( Code.toBinary("0") );		// ignora test
        } catch(Exception e) { 
        	org.junit.Assume.assumeNoException(e);
        	org.junit.Assert.fail();
        }  
    	
        try {

	        assertTrue(Code.toBinary(    "0").equals("000000000000000"));
            assertTrue(Code.toBinary(    "1").equals("000000000000001"));
            assertTrue(Code.toBinary(   "10").equals("000000000001010"));
            assertTrue(Code.toBinary(  "100").equals("000000001100100"));
            assertTrue(Code.toBinary( "1000").equals("000001111101000"));
            assertTrue(Code.toBinary("21845").equals("101010101010101"));
            assertTrue(Code.toBinary("32767").equals("111111111111111"));
                	
        } catch(Exception e) {
            e.printStackTrace();
        	org.junit.Assert.fail();
        }
    }

	/**
     * Teste para geração de código para Destino
     */
    @Test
    public void testCode_Destine() {

    	try {
    		org.junit.Assume.assumeNotNull( Code.dest(new String[] {"nop"}) );		// ignora test
        } catch(Exception e) { 
        	org.junit.Assume.assumeNoException(e);
        	org.junit.Assert.fail("exception");
        }  
		try {

			assertTrue("movw %S, %A"		,Code.dest(new String[] {"movw","%S","%A"}).equals("1000"));
			assertTrue("movw %A, %S"		,Code.dest(new String[] {"movw","%A","%S"}).equals("0100"));
			assertTrue("movw %A, %D"		,Code.dest(new String[] {"movw","%A","%D"}).equals("0010"));
			assertTrue("movw %A, (%A)"		,Code.dest(new String[] {"movw","%A","(%A)"}).equals("0001"));
			assertTrue("movw %A, %S, %D"	,Code.dest(new String[] {"movw","%A","%S","%D"}).equals("0110"));
			assertTrue("movw %A, %D, %S"	,Code.dest(new String[] {"movw","%A","%D","%S"}).equals("0110"));
			assertTrue("movw %A, %D, (%A)"	,Code.dest(new String[] {"movw","%A","%D","(%A)"}).equals("0011"));
			assertTrue("movw (%A), %D"		,Code.dest(new String[] {"movw","(%A)","%D"}).equals("0010"));

			assertTrue("addw %A, %S, %S"	,Code.dest(new String[] {"addw","%A","%S","%S"}).equals("0100"));
			assertTrue("addw %S, %D, %A"	,Code.dest(new String[] {"addw","%S","%D","%A"}).equals("1000"));
            assertTrue("addw (%A) %D %D",Code.dest(new String[] {"addw","(%A)","%D","%D"}).equals("0010"));

        	assertTrue("incw %A"			,Code.dest(new String[] {"incw","%A"}).equals("1000"));
			assertTrue("incw %S"			,Code.dest(new String[] {"incw","%S"}).equals("0100"));
			assertTrue("incw %D"			,Code.dest(new String[] {"incw","%D"}).equals("0010"));
			assertTrue("incw (%A)"			,Code.dest(new String[] {"incw","(%A)"}).equals("0001"));

			assertTrue("nop",Code.dest(new String[] {"nop"}).equals("0000"));

			assertTrue("subw %D (%A) %A",Code.dest(new String[] {"subw","%D","(%A)","%A"}).equals("1000"));
			assertTrue("rsubw %D (%A) %A",Code.dest(new String[] {"rsubw","%D","(%A)","%A"}).equals("1000"));

			assertTrue("subw %D (%A) %S",Code.dest(new String[] {"subw","%D","(%A)","%S"}).equals("0100"));
			assertTrue("rsubw %D (%A) %S",Code.dest(new String[] {"rsubw","%D","(%A)","%S"}).equals("0100"));

        	assertTrue("decw %A",Code.dest(new String[] {"decw","%A"}).equals("1000"));
        	assertTrue("decw %D",Code.dest(new String[] {"decw","%D"}).equals("0010"));

        	assertTrue("notw %A",Code.dest(new String[] {"notw","%A"}).equals("1000"));
        	assertTrue("notw %D",Code.dest(new String[] {"notw","%D"}).equals("0010"));

        	assertTrue("negw %A",Code.dest(new String[] {"negw","%A"}).equals("1000"));
        	assertTrue("negw %D",Code.dest(new String[] {"negw","%D"}).equals("0010"));

        	assertTrue("andw (%A) %D %D",Code.dest(new String[] {"andw","(%A)","%D","%D"}).equals("0010"));
        	assertTrue("andw %D %A %A",Code.dest(new String[] {"andw","%D","%A","%A"}).equals("1000"));

        	assertTrue("orw (%A) %D %D",Code.dest(new String[] {"orw","(%A)","%D","%D"}).equals("0010"));
        	assertTrue("orw %D %A %A",Code.dest(new String[] {"orw","%D","%A","%A"}).equals("1000"));

        	assertTrue("jmp",Code.dest(new String[] {"jmp"}).equals("0000"));
        	assertTrue("je",Code.dest(new String[] {"je"}).equals("0000"));
        	assertTrue("jne",Code.dest(new String[] {"jne"}).equals("0000"));
        	assertTrue("jg",Code.dest(new String[] {"jg"}).equals("0000"));
        	assertTrue("jge",Code.dest(new String[] {"jge"}).equals("0000"));
        	assertTrue("jl",Code.dest(new String[] {"jl"}).equals("0000"));
        	assertTrue("jle",Code.dest(new String[] {"jle"}).equals("0000"));

		} catch(Exception e) {
		  	e.printStackTrace();
		}
    	
    }

	/**
     * Teste para geração de código para Calculo
     */
    //@Ignore
    @Test
    public void testCode_Computation() {

    	try {
    		org.junit.Assume.assumeNotNull( Code.comp(new String[] {"nop"}) );		// ignora test
	    } catch(Exception e) { 
	    	org.junit.Assume.assumeNoException(e);
	    }  
		try {
			
        	assertTrue("movw %A %D",Code.comp(new String[] {"movw","%A","%D"}).equals("10110000"));
			assertTrue("movw %A %D",Code.comp(new String[] {"movw","%S","%A"}).equals("00001100"));
			assertTrue("movw %S %A",Code.comp(new String[] {"movw","%S","%A"}).equals("00001100"));
			assertTrue("movw %S (%A)",Code.comp(new String[] {"movw","%S","(%A)"}).equals("00001100"));
			assertTrue("movw %D %A",Code.comp(new String[] {"movw","%D","%A"}).equals("10001100"));
			assertTrue("movw %D (%A)",Code.comp(new String[] {"movw","%D","(%A)"}).equals("10001100"));

			assertTrue("addw %A   %D %D",Code.comp(new String[] {"addw","%A","%D","%D"}).equals("10000010"));
			assertTrue("addw (%A) %D %D",Code.comp(new String[] {"addw","(%A)","%D","%D"}).equals("11000010"));
			assertTrue("addw %A   %S %D",Code.comp(new String[] {"addw","%A","%S","%D"}).equals("00000010"));
			assertTrue("addw (%A) %S %D",Code.comp(new String[] {"addw","(%A)","%S","%D"}).equals("01000010"));

			assertTrue("incw %A"  ,Code.comp(new String[] {"incw","%A"}).equals("10110111"));
			assertTrue("incw %S"  ,Code.comp(new String[] {"incw","%S"}).equals("00011111"));
			assertTrue("incw %D"  ,Code.comp(new String[] {"incw","%D"}).equals("10011111"));
			assertTrue("incw (%A)",Code.comp(new String[] {"incw","(%A)"}).equals("11110111"));

        	assertTrue("nop",Code.comp(new String[] {"nop"}).equals("10101010"));
        	assertTrue("movw (%A) %D",Code.comp(new String[] {"movw","(%A)","%D"}).equals("11110000"));
        	assertTrue("addw (%A) %D %D",Code.comp(new String[] {"addw","(%A)","%D","%D"}).equals("11000010"));
			assertTrue("subw %D (%A) %A",Code.comp(new String[] {"subw","%D","(%A)","%A"}).equals("11010011"));
			assertTrue("rsubw %D (%A) %A",Code.comp(new String[] {"rsubw","%D","(%A)","%A"}).equals("11000111"));
        	assertTrue("decw %A",Code.comp(new String[] {"decw","%A"}).equals("10110010"));
        	assertTrue("decw %D",Code.comp(new String[] {"decw","%D"}).equals("10001110"));
        	assertTrue("notw %A",Code.comp(new String[] {"notw","%A"}).equals("10110001"));
        	assertTrue("notw %D",Code.comp(new String[] {"notw","%D"}).equals("10001101"));
        	assertTrue("negw %A",Code.comp(new String[] {"negw","%A"}).equals("10110011"));
        	assertTrue("negw %D",Code.comp(new String[] {"negw","%D"}).equals("10001111"));
        	assertTrue("andw (%A) %D %D",Code.comp(new String[] {"andw","(%A)","%D","%D"}).equals("11000000"));
        	assertTrue("andw %D %A %A",Code.comp(new String[] {"andw","%D","%A","%A"}).equals("10000000"));
        	assertTrue("orw (%A) %D %D",Code.comp(new String[] {"orw","(%A)","%D","%D"}).equals("11010101"));
        	assertTrue("orw %D %A %A",Code.comp(new String[] {"orw","%D","%A","%A"}).equals("10010101"));
        	assertTrue("jmp",Code.comp(new String[] {"jmp"}).equals("10001100"));
        	assertTrue("je",Code.comp(new String[] {"je"}).equals("10001100"));
        	assertTrue("jne",Code.comp(new String[] {"jne"}).equals("10001100"));
        	assertTrue("jg",Code.comp(new String[] {"jg"}).equals("10001100"));
        	assertTrue("jge",Code.comp(new String[] {"jge"}).equals("10001100"));
        	assertTrue("jl",Code.comp(new String[] {"jl"}).equals("10001100"));
        	assertTrue("jle",Code.comp(new String[] {"jle"}).equals("10001100"));
        	
		} catch(Exception e) {
		  	e.printStackTrace();
		}
    	
    }

	/**
     * Teste para geração de código para Calculo
     */
    @Test
    public void testCode_Jump() {

    	try {
    		org.junit.Assume.assumeNotNull( Code.jump(new String[] {"nop"}) );		// ignora test
        } catch(Exception e) { 
        	org.junit.Assume.assumeNoException(e);
        }  
    	
		try {
	
        	assertTrue("movw %A,%D",Code.jump(new String[] {"movw","%A","%D"}).equals("000"));
        	assertTrue("addw %A,%D,%D",Code.jump(new String[] {"addw","%A","%D","%D"}).equals("000"));
        	assertTrue("movw %D,%A",Code.jump(new String[] {"movw","%D","%A"}).equals("000"));
        	assertTrue("movw %D,(%A)",Code.jump(new String[] {"movw","%D","(%A)"}).equals("000"));
        	assertTrue("incw %D",Code.jump(new String[] {"incw","%D"}).equals("000"));
        	assertTrue("nop",Code.jump(new String[] {"nop"}).equals("000"));
        	assertTrue("movw (%A),%D",Code.jump(new String[] {"movw","(%A)","%D"}).equals("000"));
        	assertTrue("addw (%A),%D,%D",Code.jump(new String[] {"addw","(%A)","%D","%D"}).equals("000"));
			assertTrue("subw %D,(%A),%A",Code.jump(new String[] {"subw","%D","(%A)","%A"}).equals("000"));
			assertTrue("rsubw %D,(%A),%A",Code.jump(new String[] {"rsubw","%D","(%A)","%A"}).equals("000"));
        	assertTrue("decw %A",Code.jump(new String[] {"decw","%A"}).equals("000"));
        	assertTrue("decw %D",Code.jump(new String[] {"decw","%D"}).equals("000"));
        	assertTrue("notw %A",Code.jump(new String[] {"notw","%A"}).equals("000"));
        	assertTrue("notw %D",Code.jump(new String[] {"notw","%D"}).equals("000"));
        	assertTrue("negw %A",Code.jump(new String[] {"negw","%A"}).equals("000"));
        	assertTrue("negw %D",Code.jump(new String[] {"negw","%D"}).equals("000"));
        	assertTrue("andw (%A),%D,%D",Code.jump(new String[] {"andw","(%A)","%D","%D"}).equals("000"));
        	assertTrue("andw %D,%A,%A",Code.jump(new String[] {"andw","%D","%A","%A"}).equals("000"));
        	assertTrue("orw (%A),%D,%D",Code.jump(new String[] {"orw","(%A)","%D","%D"}).equals("000"));
        	assertTrue("orw %D,%A,%A",Code.jump(new String[] {"orw","%D","%A","%A"}).equals("000"));
        	assertTrue("jmp",Code.jump(new String[] {"jmp"}).equals("111"));
        	assertTrue("je",Code.jump(new String[] {"je"}).equals("010"));
        	assertTrue("jne",Code.jump(new String[] {"jne"}).equals("101"));
        	assertTrue("jg",Code.jump(new String[] {"jg"}).equals("001"));
        	assertTrue("jge",Code.jump(new String[] {"jge"}).equals("011"));
        	assertTrue("jl",Code.jump(new String[] {"jl"}).equals("100"));
        	assertTrue("jle",Code.jump(new String[] {"jle"}).equals("110"));
	    	
		} catch(Exception e) {
		  	e.printStackTrace();
		}
    	
    }

}