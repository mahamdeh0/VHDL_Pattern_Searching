library IEEE;
use IEEE.std_logic_1164.all;

entity SearchAndReverse is
	port(CLK: in std_logic;
    	 Reset: in std_logic;
         Enable: in std_logic;
         D: in std_logic_vector(19 downto 0);
         X: in std_logic_vector(3 downto 0);
         Q: out std_logic_vector(19 downto 0);
         );
end SearchAndReverse;

architecture behavioral of SearchAndReverse is
begin
	process (CLK, Reset)  
    variable TempD : std_logic_vector(19 downto 0);
    variable reverseX : std_logic_vector(3 downto 0); 
    	begin
        
        	if (Reset = '1') then
            	Q <= (others => '0');
                
            elsif (CLK 'event and CLK = '1' and Enable = '1') then
            	TempD := D;
                
                for i in X 'range loop
                	reverseX(3 - i) := X(i);
                end loop;
                
                for i in 0 to 16 loop                    
                	if (D(i+3 downto i) = X) then
                    	TempD(i+3 downto i) := reverseX;
                    end if;
      
                end loop;
            end if;
           	Q <= TempD;  
    end process;
end behavioral;