----------------------------------------------------------------------------------
--
-- University: Politecnico di Milano
-- Professors: William Fornaciari, Federico Terraneo
-- Students: Bendinelli Marco (10673478), Bosisio Andrea (10669287)
-- Create Date: 02.03.2021 23:09:39
-- Project Name: Prova Finale del corso di Reti Logiche A.A. 2020/2021
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Dichiarazione interfaccia componente da realizzare
entity project_reti_logiche is
    port (
        i_clk : in std_logic;
        i_rst : in std_logic;
        i_start : in std_logic;
        i_data : in std_logic_vector(7 downto 0);
        o_address : out std_logic_vector(15 downto 0);
        o_done : out std_logic;
        o_en : out std_logic;
        o_we : out std_logic;
        o_data : out std_logic_vector (7 downto 0)
    );
end project_reti_logiche;

architecture Structural of project_reti_logiche is
-- Dichiarazione componente Datapath
component datapath is
    Port ( i_clk : in STD_LOGIC;
           i_rst : in STD_LOGIC;
           i_start : in STD_LOGIC;
           i_data : in STD_LOGIC_VECTOR (7 downto 0);           
           r_addr_sel : in STD_LOGIC_VECTOR (1 downto 0);
           r_addr_load : in STD_LOGIC;
           o_addr_sel : in STD_LOGIC;
           rC_load : in STD_LOGIC;
           rDIM_load : in STD_LOGIC;
           rDC_load : in STD_LOGIC;
           rDR_load : in STD_LOGIC;
           rMIN_load : in STD_LOGIC;
           rMAX_load : in STD_LOGIC;
           rS_load : in STD_LOGIC;
           rDC_sel : in STD_LOGIC;
           rDR_sel : in STD_LOGIC;
           rDIM_sel : in STD_LOGIC;
           o_end0 : out STD_LOGIC;
           o_end1 : out STD_LOGIC;
           o_end2 : out STD_LOGIC;
           o_data : out STD_LOGIC_VECTOR (7 downto 0);
           o_address : out STD_LOGIC_VECTOR (15 downto 0) );
end component;

-- Dichiarazione componente FSM
component FSM is
    Port ( i_clk : in STD_LOGIC;
           i_rst : in STD_LOGIC;
           i_start : in STD_LOGIC;
           o_end0 : in STD_LOGIC;
           o_end1 : in STD_LOGIC;
           o_end2 : in STD_LOGIC;
           r_addr_sel : out STD_LOGIC_VECTOR (1 downto 0);
           r_addr_load : out STD_LOGIC;
           o_addr_sel : out STD_LOGIC;
           rC_load : out STD_LOGIC;
           rDIM_load : out STD_LOGIC;
           rDC_load : out STD_LOGIC;
           rDR_load : out STD_LOGIC;
           rMIN_load : out STD_LOGIC;
           rMAX_load : out STD_LOGIC;
           rS_load : out STD_LOGIC;
           rDC_sel : out STD_LOGIC;
           rDR_sel : out STD_LOGIC;
           rDIM_sel : out STD_LOGIC;
           o_en : out STD_LOGIC;
           o_we : out STD_LOGIC;
           o_done : out STD_LOGIC );
end component;

-- Dichiarazione segnali interni 
signal r_addr_sel : STD_LOGIC_VECTOR (1 downto 0);
signal r_addr_load : STD_LOGIC;
signal o_addr_sel : STD_LOGIC;
signal rC_load : STD_LOGIC;
signal rDIM_load : STD_LOGIC;
signal rDC_load : STD_LOGIC;
signal rDR_load : STD_LOGIC;
signal rMIN_load : STD_LOGIC;
signal rMAX_load : STD_LOGIC;
signal rS_load : STD_LOGIC;
signal rDC_sel : STD_LOGIC;
signal rDR_sel : STD_LOGIC;
signal rDIM_sel : STD_LOGIC;
signal o_end0 : STD_LOGIC;
signal o_end1 : STD_LOGIC;
signal o_end2 : STD_LOGIC;

-- Istanziamento di DATAPATH e FSM
begin
    DATAPATH_1: datapath port map(
        i_clk, 
        i_rst,
        i_start, 
        i_data,
        r_addr_sel,
        r_addr_load,
        o_addr_sel,
        rC_load,
        rDIM_load,
        rDC_load,
        rDR_load,
        rMIN_load,
        rMAX_load,
        rS_load,
        rDC_sel,
        rDR_sel,
        rDIM_sel,
        o_end0,
        o_end1,
        o_end2,
        o_data,
        o_address
    );
    
    FSM_1: FSM port map(
    i_clk, 
    i_rst, 
    i_start,
    o_end0,
    o_end1,
    o_end2,
    r_addr_sel,
    r_addr_load,
    o_addr_sel,
    rC_load,
    rDIM_load,
    rDC_load,
    rDR_load,
    rMIN_load,
    rMAX_load,
    rS_load,
    rDC_sel,
    rDR_sel,
    rDIM_sel,
    o_en, 
    o_we, 
    o_done
    );    

end Structural;

-----------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Dichiarazione interfaccia FSM
entity FSM is
    Port ( i_clk : in STD_LOGIC;
           i_rst : in STD_LOGIC;
           i_start : in STD_LOGIC;
           o_end0 : in STD_LOGIC;
           o_end1 : in STD_LOGIC;
           o_end2 : in STD_LOGIC;
           r_addr_sel : out STD_LOGIC_VECTOR (1 downto 0);
           r_addr_load : out STD_LOGIC;
           o_addr_sel : out STD_LOGIC;
           rC_load : out STD_LOGIC;
           rDIM_load : out STD_LOGIC;
           rDC_load : out STD_LOGIC;
           rDR_load : out STD_LOGIC;
           rMIN_load : out STD_LOGIC;
           rMAX_load : out STD_LOGIC;
           rS_load : out STD_LOGIC;
           rDC_sel : out STD_LOGIC;
           rDR_sel : out STD_LOGIC;
           rDIM_sel : out STD_LOGIC;
           o_en : out STD_LOGIC;
           o_we : out STD_LOGIC;
           o_done : out STD_LOGIC );
end FSM;

architecture Behavioral of FSM is
type S is (S_WAIT, S_READ_C, S_READ_R, S_CHECK_R, S_READ_P1, S_READ_ROW, S_DECR_ROW, S_READ_DONE, S_WRITE_P1, S_EQ, S_WRITE, S_DONE);
signal cur_state, next_state : S;
begin
    
-- Processo di reset e avanzamento della FSM
    process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            cur_state <= S_WAIT;
        elsif rising_edge(i_clk) then
            cur_state <= next_state;
        end if;
    end process;
    
    -- Processo di calcolo della funzione stato prossimo della FSM 
    process(cur_state, i_start, o_end0, o_end1, o_end2)
    begin
        next_state <= cur_state;
        case cur_state is
            when S_WAIT =>
                if i_start = '1' then
                    next_state <= S_READ_C;
                else
                    next_state <= S_WAIT;
                end if;
                
            when S_READ_C =>
                next_state <= S_READ_R;
                
            when S_READ_R =>
                if o_end0 = '0' then
                    next_state <= S_CHECK_R;
                else
                    next_state <= S_DONE; -- Caso limite: dimensione immagine nulla (C = 0)
                end if;    
                
            when S_CHECK_R =>
                if o_end0 = '0' then
                    next_state <= S_READ_P1;
                else
                    next_state <= S_DONE; -- Caso limite: dimensione immagine nulla (R = 0)
                end if;             
                   
            when S_READ_P1 =>
                if o_end1 = '1' then    
                    if o_end2 = '0' then 
                        next_state <= S_DECR_ROW; -- Caso limite: dimensione immagine 1xN
                    else   
                        next_state <= S_READ_DONE; -- Caso limite: dimensione immagine 1x1
                    end if;
                else 
                    next_state <= S_READ_ROW;
                end if; 
                
            when S_READ_ROW =>
                if o_end1 = '0' then
                    next_state <= S_READ_ROW;
                else
                    if o_end0 = '0' then
                        next_state <= S_DECR_ROW;
                    else
                        next_state <= S_READ_DONE;
                    end if;        
                end if;
                
            when S_DECR_ROW =>
                if o_end1 = '0' then
                    next_state <= S_READ_ROW;
                else 
                    if  o_end2 = '0' then 
                        next_state <= S_DECR_ROW; -- Caso limite: dimensione immagine 1xN
                    else
                        next_state <= S_READ_DONE;
                    end if;    
                end if; 
            
            when S_READ_DONE => 
                next_state <= S_WRITE_P1;                                           
                    
            when S_WRITE_P1 => 
                if o_end0 = '0' then
                    next_state <= S_EQ;
                else
                    next_state <= S_DONE;
                end if;
                
            when S_EQ => 
                    next_state <= S_WRITE;
                    
            when S_WRITE =>
                if o_end0 = '0' then
                    next_state <= S_EQ;
                else
                    next_state <= S_DONE;
                end if;
                
            when S_DONE =>
                if i_start = '1' then
                    next_state <= S_DONE; -- Attesa di i_start = 0
                else 
                    next_state <= S_WAIT;
                end if;
        end case;
    end process;
    
    -- Processo di calcolo della funzione di uscita della FSM   
    process(cur_state)
    begin 
        
        -- Default
        r_addr_sel <= "11";
        r_addr_load <= '1';
        o_addr_sel <= '0';
        rDC_sel <= '0';        
        rDR_sel <= '0';
        rDIM_sel <= '0';
        rS_load <= '0';
        rC_load <= '0';
        rDIM_load <= '0';
        rDC_load <= '0';
        rDR_load <= '0';     
        rMIN_load <= '0';       
        rMAX_load <= '0';             
        o_done <= '0';
        o_en <= '0';
        o_we <= '0';
	    
       case cur_state is
       
            when S_WAIT =>
                r_addr_sel <= "00";
                r_addr_load <= '0';
                
            -- Richiesta lettura indirizzo 0 alla RAM          
            when S_READ_C =>
                r_addr_sel <= "00";
                o_en <= '1';
                
            -- Memorizzazione dell'indirizzo 0 in rC, richiesta lettura indirizzo 1 alla RAM
            when S_READ_R =>
                rC_load <= '1';
                o_en <= '1';
            
            when S_CHECK_R =>
                r_addr_load <= '0';
                
            -- Richiesta lettura primo pixel, memorizzazione dell'indirizzo 1 in rDEC_R e del valore C in rDEC_C
            when S_READ_P1 =>
                rDC_load <= '1';
                rDR_load <= '1'; 
                o_en <= '1';
                
            -- Richiesta lettura pixel della riga, inizio ricerca max e min                                  
            when S_READ_ROW =>
                rDC_sel <= '1';
                rDR_sel <= '1';
                rDC_load <= '1';
                rMIN_load <= '1';       
                rMAX_load <= '1';
                o_en <= '1';
            
            -- Decremento numero di righe rimanenti   
            when S_DECR_ROW =>
                rDC_load <= '1';
                rDR_sel <= '1';
                rDR_load <= '1';                               
                rMIN_load <= '1';   
                rMAX_load <= '1';
                o_en <= '1';
                
            -- Richiesta lettura primo pixel, inizializzazione ciclo di conteggio (rDIM), memorizzazione SHIFT_LEVEL                
            when S_READ_DONE =>
                rDR_load <= '1';                              
                rMIN_load <= '1';   
                rMAX_load <= '1';
                rS_load <= '1';
                rDIM_sel <= '1';
                rDIM_load <= '1'; 
                r_addr_sel <= "01";
                r_addr_load <= '0';
                o_en <= '1';
                
            -- Scrittura primo NEW_PIXEL_VALUE  
            when S_WRITE_P1 =>
                r_addr_sel <= "01";
                o_addr_sel <= '1';
                rDR_sel <= '1';
                rDIM_sel <= '1';
                o_en <= '1';
                o_we <= '1';
            
            -- Ciclo di lettura di CURRENT_PIXEL_VALUE e scrittura di NEW_PIXEL_VALUE
            when S_EQ =>
                r_addr_load <= '0';
                rDR_sel <= '1';
                rDR_load <= '1';
                rDIM_sel <= '1';
                o_en <= '1';
                  
            when S_WRITE =>
                o_addr_sel <= '1';
                rDR_sel <= '1';
                rDIM_sel <= '1';
                o_en <= '1';
                o_we <= '1';
            
            -- Fine elaborazione con segnale o_done alto  
            when S_DONE =>
                r_addr_sel <= "00";
                r_addr_load <= '0';
                o_done <= '1';                                    
        end case;
    end process;
    
end Behavioral;

-----------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Dichiarazione interfaccia FSM
entity datapath is
    Port ( i_clk : in STD_LOGIC;
           i_rst : in STD_LOGIC;
           i_start : in STD_LOGIC;
           i_data : in STD_LOGIC_VECTOR (7 downto 0);           
           r_addr_sel : in STD_LOGIC_VECTOR (1 downto 0);
           r_addr_load : in STD_LOGIC;
           o_addr_sel : in STD_LOGIC;
           rC_load : in STD_LOGIC;
           rDIM_load : in STD_LOGIC;
           rDC_load : in STD_LOGIC;
           rDR_load : in STD_LOGIC;
           rMIN_load : in STD_LOGIC;
           rMAX_load : in STD_LOGIC;
           rS_load : in STD_LOGIC;
           rDC_sel : in STD_LOGIC;
           rDR_sel : in STD_LOGIC;
           rDIM_sel : in STD_LOGIC;
           o_end0 : out STD_LOGIC;
           o_end1 : out STD_LOGIC;
           o_end2 : out STD_LOGIC;
           o_data : out STD_LOGIC_VECTOR (7 downto 0);
           o_address : out STD_LOGIC_VECTOR (15 downto 0) );
end datapath;

architecture Behavioral of datapath is

--Dichiarazione segnali interni al DATAPATH
signal o_rC : STD_LOGIC_VECTOR (7 downto 0);
signal o_rDIM : STD_LOGIC_VECTOR (15 downto 0);
signal o_rDEC_C : STD_LOGIC_VECTOR (7 downto 0);
signal o_rDEC_R : STD_LOGIC_VECTOR (15 downto 0);
signal o_rMIN : STD_LOGIC_VECTOR (7 downto 0);
signal o_rMAX : STD_LOGIC_VECTOR (7 downto 0);
signal o_rSHIFT : STD_LOGIC_VECTOR (3 downto 0);
signal o_rADDR : STD_LOGIC_VECTOR (15 downto 0);

signal mux_rDC : STD_LOGIC_VECTOR (7 downto 0);
signal mux_rDR : STD_LOGIC_VECTOR (15 downto 0);
signal mux_rDIM : STD_LOGIC_VECTOR (15 downto 0);
signal mux_rADDR : STD_LOGIC_VECTOR (15 downto 0);

signal sub_rDC : STD_LOGIC_VECTOR (7 downto 0);
signal sub_rDR : STD_LOGIC_VECTOR (15 downto 0);
signal sub_rDIM : STD_LOGIC_VECTOR (15 downto 0);
signal min : STD_LOGIC_VECTOR (7 downto 0);
signal max : STD_LOGIC_VECTOR (7 downto 0);
signal TOSHIFT_PXL : STD_LOGIC_VECTOR (7 downto 0);
signal TEMP_PIXEL : STD_LOGIC_VECTOR (15 downto 0);
signal DELTA_VALUE_1 : STD_LOGIC_VECTOR (7 downto 0);
signal sub_shift : STD_LOGIC_VECTOR (3 downto 0);
signal floorlog : STD_LOGIC_VECTOR (3 downto 0);
signal sum_offset : STD_LOGIC_VECTOR (15 downto 0);
signal sum_count : STD_LOGIC_VECTOR (15 downto 0);

begin    
    -- Descrizione registri (inizializzati a 0)
    
    -- Registro contenente il numero di colonne dell'immagine (C)
    process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_rC <= "00000000"; 
        elsif rising_edge(i_clk) then
            if(rC_load = '1') then
                o_rC <= i_data;
            end if;
        end if;
    end process;
    
    -- Registro contenente la dimmensione dell'immagine CxR
    process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_rDIM <= "0000000000000000"; 
        elsif rising_edge(i_clk) then
            if(rDIM_load = '1') then
                o_rDIM <= mux_rDIM;
            end if;
        end if;
    end process;    
    
    -- Registro utilizzato per il counter che decrementa il valore C
    process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_rDEC_C <= "00000000";
        elsif rising_edge(i_clk) then
            if(rDC_load = '1') then
                o_rDEC_C <= mux_rDC;
            end if;
        end if;
    end process;
    
    -- Registro utilizzato per il counter che decrementa il valore R (numero di righe) e successivamente il valore CxR 
    process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_rDEC_R <= "0000000000000000"; 
        elsif rising_edge(i_clk) then
            if(rDR_load = '1') then
                o_rDEC_R <= mux_rDR;
            end if;
        end if;
    end process;
    
    -- Registro utilizzato per salvare il valore minimo
    process(i_clk, i_rst, i_start)
    begin
        if(i_rst = '1' or i_start = '0') then
            o_rMIN <= "11111111"; -- viene inizializzato a 255 
        elsif rising_edge(i_clk) then
            if(rMIN_load = '1') then
                o_rMIN <= min;
            end if;
        end if;
    end process;
    
    -- Registro utilizzato per salvare il valore massimo
    process(i_clk, i_rst, i_start)
    begin
        if(i_rst = '1' or i_start = '0') then
            o_rMAX <= "00000000"; -- viene inizializzato a 0
        elsif rising_edge(i_clk) then
            if(rMAX_load = '1') then
                o_rMAX <= max;
            end if;
        end if;
    end process;
    
    -- Registro utilizzato per salvare lo SHIFT_LEVEL
    process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_rSHIFT <= "0000";
        elsif rising_edge(i_clk) then
            if(rS_load = '1') then
                o_rSHIFT <= sub_shift;
            end if;
        end if;
    end process;
    
    -- Registro utilizzato per salvare l'incremento degli indirizzi	
    process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_rADDR <= "0000000000000000";
        elsif rising_edge(i_clk) then
            if(r_addr_load = '1') then
                o_rADDR <= sum_count;
            end if;
        end if;
    end process;
    
    -- Descrizione multiplexers
    with rDC_sel select
        mux_rDC <= o_rC when '0',
                    sub_rDC when '1',
                    "XXXXXXXX" when others;
                    
    with rDR_sel select
        mux_rDR <= mux_rDIM when '0',
                    sub_rDR when '1',
                    "XXXXXXXXXXXXXXXX" when others; 
                    
    with rDIM_sel select
        mux_rDIM <= ("00000000" & i_data) when '0',
                    sub_rDIM when '1',
                    "XXXXXXXXXXXXXXXX" when others;
                    
    with r_addr_sel select
        mux_rADDR <= "0000000000000000" when "00",
                       "0000000000000010" when "01",
                       o_rADDR when "11",
                       "XXXXXXXXXXXXXXXX" when others;                                                                                                                      

    with o_addr_sel select
        o_address <= mux_rADDR when '0',
                     sum_offset when '1',
                     "XXXXXXXXXXXXXXXX" when others;
                             
    -- Descrizione moduli
    -- Comparatori

    o_end0 <= '1' when (mux_rDR = "0000000000000000") else '0';
    o_end1 <= '1' when (mux_rDC = "00000001") else '0';
    o_end2 <= '1' when (mux_rDR = "0000000000000001") else '0';
    
    -- Sottrattori
    sub_rDC <= o_rDEC_C - "00000001";
    sub_rDR <= o_rDEC_R - "0000000000000001";
    sub_rDIM <= o_rADDR - "0000000000000010";
    TOSHIFT_PXL <= (i_data - o_rMIN) when (i_data >= o_rMIN) else o_rMIN;
    DELTA_VALUE_1 <= (max - min) + "00000001";
    sub_shift <= "1000" - floorlog;
    
    -- Addizionatori 
    sum_offset <= mux_rADDR + o_rDIM;
    sum_count <= mux_rADDR + "0000000000000001";
    
    -- Floor(log2(DELTA_VALUE + 1)) MODULE  
    --- DELTA_VALUE_1 = DELTA_VALUE + 1
    process(DELTA_VALUE_1)
    begin
        if (DELTA_VALUE_1 = "00000000") then floorlog <= "1000";   -- 8 in decimale
        elsif (DELTA_VALUE_1 = "00000001") then floorlog <= "0000";    -- 0 in decimale
        elsif (DELTA_VALUE_1 >= "00000010" and DELTA_VALUE_1 < "00000100") then floorlog <= "0001";    -- 1 in decimale
        elsif (DELTA_VALUE_1 >= "00000100" and DELTA_VALUE_1 < "00001000") then floorlog <= "0010";    -- 2 in decimale
        elsif (DELTA_VALUE_1 >= "00001000" and DELTA_VALUE_1 < "00010000") then floorlog <= "0011";    -- 3 in decimale
        elsif (DELTA_VALUE_1 >= "00010000" and DELTA_VALUE_1 < "00100000") then floorlog <= "0100";    -- 4 in decimale
        elsif (DELTA_VALUE_1 >= "00100000" and DELTA_VALUE_1 < "01000000") then floorlog <= "0101";    -- 5 in decimale
        elsif (DELTA_VALUE_1 >= "01000000" and DELTA_VALUE_1 < "10000000") then floorlog <= "0110";    -- 6 in decimale
        elsif (DELTA_VALUE_1 >= "10000000") then floorlog <= "0111";    -- 7 in decimale
        else floorlog <= "XXXX";      
        end if;
    end process;
                
    -- shift MODULE
    process(TOSHIFT_PXL, o_rSHIFT)
    begin
        case o_rSHIFT is
            when "0000" =>
                TEMP_PIXEL <= "00000000" & TOSHIFT_PXL;
            when "0001" =>
                TEMP_PIXEL <= "0000000" & TOSHIFT_PXL & '0'; 
            when "0010" =>
                TEMP_PIXEL <= "000000" & TOSHIFT_PXL & "00";
            when "0011" =>
                TEMP_PIXEL <= "00000" & TOSHIFT_PXL & "000";
            when "0100" =>
                TEMP_PIXEL <= "0000" & TOSHIFT_PXL & "0000";
            when "0101" =>
                TEMP_PIXEL <= "000" & TOSHIFT_PXL & "00000";
            when "0110" =>
                TEMP_PIXEL <= "00" & TOSHIFT_PXL & "000000";
            when "0111" =>
                TEMP_PIXEL <= '0' & TOSHIFT_PXL & "0000000";
            when "1000" =>
                TEMP_PIXEL <= TOSHIFT_PXL & "00000000";
            when others => 
                TEMP_PIXEL <= "XXXXXXXXXXXXXXXX";                   
        end case;
    end process;
    
    -- min MODULE
    -- 1)
    process (i_data, o_rMIN)
    begin
        if (i_data < o_rMIN) then
            min <= i_data; 
        else
            min <= o_rMIN;
        end if;
    end process;
    
    -- 2)
    process (TEMP_PIXEL)
    begin
        if (TEMP_PIXEL < "0000000011111111") then
            o_data <= TEMP_PIXEL(7 downto 0); 
        else
            o_data <= "11111111";
        end if;
    end process;
    
    -- max MODULE 
    process (i_data, o_rMAX)
    begin
        if (i_data > o_rMAX) then
            max <= i_data; 
        else
            max <= o_rMAX;
        end if;
    end process; 
                          
end Behavioral;
