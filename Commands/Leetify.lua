require("Funcs")
Help = {Help = "Leetify/Englishify Convert from leet and to 1337!",Category = "Fun"}
-- THIS CODE MAKES ME SHIVER IT'S SO FUCKING UGLY I shall never touch this script again 
local EnglishLetters = {
    ['a'] = "@"; ['A'] = "@"; ['b'] = "8"; ['B'] = "8"; ['c'] = "c"; ['C'] = "C"; ['d'] = "d"; ['D'] = "D"; ['e'] = "3";
    ['E'] = "3"; ['f'] = "f"; ['F'] = "F"; ['g'] = "g"; ['G'] = "G"; ['h'] = "h"; ['H'] = "H"; ['i'] = "1"; ['I'] = "1"; 
    ['j'] = "j"; ['J'] = "J"; ['k'] = "k"; ['K'] = "K"; ['l'] = "1"; ['L'] = "1"; ['m'] = "m"; ['M'] = "M"; ['n'] = "n";
    ['N'] = "N"; ['o'] = "0"; ['O'] = "0"; ['p'] = "p"; ['P'] = "P"; ['q'] = "q"; ['Q'] = "Q"; ['r'] = "r"; ['R'] = "R"; 
    ['s'] = "5"; ['S'] = "5"; ['t'] = "7"; ['T'] = "7"; ['u'] = "u"; ['U'] = "U"; ['v'] = "v"; ['V'] = "V"; ['w'] = "w"; 
    ['W'] = "W"; ['x'] = "x"; ['X'] = "X"; ['y'] = "y"; ['Y'] = "Y"; ['z'] = "z"; ['Z'] = "Z"; [' '] = " "; ['@'] = "@"; 
    ['0'] = "0"; ['1'] = "1"; ['2'] = "2"; ['3'] = "3"; ['4'] = "4"; ['5'] = "5"; ['6'] = "6"; ['7'] = "7"; ['8'] = "8"; 
    ['9'] = "9"; ['!'] = "!"; ['#'] = "#"; ['$'] = "$"; ['%'] = "%"; ['^'] = "^"; ['&'] = "&"; ['*'] = "*"; ['('] = "("; 
    [')'] = ")"; ['_'] = "_"; ['-'] = "-"; ['='] = "="; ['+'] = "+"; ['`'] = "`"; ['~'] = "~"; ['<'] = "<"; ['>'] = ">"; 
    [';'] = ";"; [':'] = ":"; ['"'] = '"'; ["'"] = "'"; ['.'] = "."; [','] = ","; ['{'] = "{"; ['}'] = "}"; ['['] = "[";
    [']'] = "]"; ['|'] = "|"; ['/'] = "/";
}

local LeetLetters = { 
    ['@'] = "a"; ['8'] = "b"; ['c'] = "c"; ['C'] = "C"; ['d'] = "d"; ['D'] = "D"; ['3'] = "e"; ['f'] = "f"; ['F'] = "F"; 
    ['G'] = "G"; ['h'] = "h"; ['H'] = "H"; ['i'] = "i"; ['I'] = "I"; ['j'] = "j"; ['J'] = "J"; ['k'] = "k"; ['K'] = "K"; 
    ['1'] = "l"; ['m'] = "m"; ['M'] = "M"; ['n'] = "n"; ['N'] = "N"; ['0'] = "o"; ['p'] = "p"; ['P'] = "p"; ['q'] = "q"; 
    ['Q'] = "Q"; ['r'] = "r"; ['R'] = "R"; ['5'] = "s"; ['7'] = "t"; ['u'] = "u"; ['U'] = "U"; ['v'] = "v"; ['V'] = "V"; 
    ['w'] = "w"; ['W'] = "W"; ['x'] = "x"; ['X'] = "X"; ['y'] = "y"; ['Y'] = "Y"; ['z'] = "z"; ['Z'] = "Z"; [' '] = " ";
    ['2'] = "2"; ['4'] = "a"; ['6'] = "g"; ['9'] = "9"; ['!'] = "!"; ['#'] = "#"; ['$'] = "$"; ['%'] = "%"; ['^'] = "^"; 
    ['&'] = "&"; ['*'] = "*"; ['('] = "("; [')'] = ")"; ['_'] = "_"; ['-'] = "-"; ['='] = "="; ['+'] = "+"; ['`'] = "`"; 
    ['~'] = "~"; ['<'] = "<"; ['>'] = ">"; [';'] = ";"; [':'] = ":"; ['"'] = '"'; ["'"] = "'"; ['.'] = "."; [','] = ","; 
	['{'] = "{"; ['}'] = "}"; ['['] = "["; [']'] = "]"; ['|'] = "|"; ['/'] = "/"; ['a'] = "a"; ['b'] = "b"; ['e'] = "e";
	['l'] = "l"; ['o'] = "o"; ['s'] = "s"; ['t'] = "t"; ['A'] = "A"; ['B'] = "B"; ['E'] = "E"; ['L'] = "L"; ['O'] = "O"; 
	['S'] = "S"; ['T'] = "T"; ['g'] = "g";
	
}

local function English(Message,Arguments)
    local Input,EnglishTable,LeetTable = concat(Arguments," "):gsub("`",""),{},{}
		for i = 1, #Input do
			LeetTable[i] = Input:sub(i,i)
		end
		for _,v in pairs(LeetTable) do
			insert(EnglishTable,LeetLetters[v])
		end
	return reply(Message,">>> "..concat(EnglishTable,""))
end

local function SpeakIn1337(Message,Arguments)
    local Input,EnglishTable,LeetTable = concat(Arguments," "):gsub("`",""),{},{}
		for i = 1, #Input do
			EnglishTable[i] = Input:sub(i,i)
		end
		for _,v in pairs(EnglishTable) do
			insert(LeetTable,EnglishLetters[v])
		end
	return reply(Message,">>> "..concat(LeetTable,""))
end

commandAdd("leetify",SpeakIn1337)
commandAdd("englishify",English)