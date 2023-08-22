library IEEE;
use IEEE.std_logic_1164.all;

entity TestDesign is
end TestDesign;

architecture behavioral of TestDesign is

	signal CLK, Reset, Enable: std_logic := '0';
    signal D: std_logic_vector(19 downto 0) := (others => '0');
	signal X: std_logic_vector(3 downto 0) := (others => '0');
	signal Q: std_logic_vector(19 downto 0) := (others => '0');

component SearchAndReverse 
	port(CLK: in std_logic;
    	 Reset: in std_logic;
         Enable: in std_logic;
         D: in std_logic_vector(19 downto 0);
         X: in std_logic_vector(3 downto 0);
         Q: out std_logic_vector(19 downto 0);
         );
end component;

constant clk_period : time := 20 ns;

begin
	uu: SearchAndReverse port map (CLK, Reset, Enable, D, X, Q);
    
    process
	begin
		CLK <= '1';
		wait for clk_period/2;
		CLK <= '0';
		wait for clk_period/2;
	end process;
    
    process
	begin
		Reset <= '1';
        wait for clk_period*3;
        
        Reset <= '0';
        Enable <= '0';
        wait for clk_period*3;
        
        Reset <= '0';
        D <= "10101010101010101010";
        X <= "1010";
        Enable <= '1';
        wait for clk_period*3;    
        
        Reset <= '0';
        D <= "10101010101010101010";
        X <= "0101";
        Enable <= '0';
        wait for clk_period*3;
        
        Reset <= '0';
        D <= "11111111111111111111";
        X <= "0000";
        Enable <= '1';
        wait for clk_period*3;
        
        Reset <= '0';
        D <= "00001111000011110001";
        X <= "0011";
        Enable <= '1';
        wait for clk_period*3;
        
        wait;   
	end process;
end behavioral;