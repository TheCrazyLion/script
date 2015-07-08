--[[
	BBBBBBBBBBBBBBBBB   IIIIIIIIII      GGGGGGGGGGGGG     FFFFFFFFFFFFFFFFFFFFFF      AAA         TTTTTTTTTTTTTTTTTTTTTTT      
	B::::::::::::::::B  I::::::::I   GGG::::::::::::G     F::::::::::::::::::::F     A:::A        T:::::::::::::::::::::T      
	B::::::BBBBBB:::::B I::::::::I GG:::::::::::::::G     F::::::::::::::::::::F    A:::::A       T:::::::::::::::::::::T      
	BB:::::B     B:::::BII::::::IIG:::::GGGGGGGG::::G     FF::::::FFFFFFFFF::::F   A:::::::A      T:::::TT:::::::TT:::::T      
	  B::::B     B:::::B  I::::I G:::::G       GGGGGG       F:::::F       FFFFFF  A:::::::::A     TTTTTT  T:::::T  TTTTTT      
	  B::::B     B:::::B  I::::IG:::::G                     F:::::F              A:::::A:::::A            T:::::T              
	  B::::BBBBBB:::::B   I::::IG:::::G                     F::::::FFFFFFFFFF   A:::::A A:::::A           T:::::T              
	  B:::::::::::::BB    I::::IG:::::G    GGGGGGGGGG       F:::::::::::::::F  A:::::A   A:::::A          T:::::T              
	  B::::BBBBBB:::::B   I::::IG:::::G    G::::::::G       F:::::::::::::::F A:::::A     A:::::A         T:::::T              
	  B::::B     B:::::B  I::::IG:::::G    GGGGG::::G       F::::::FFFFFFFFFFA:::::AAAAAAAAA:::::A        T:::::T              
	  B::::B     B:::::B  I::::IG:::::G        G::::G       F:::::F         A:::::::::::::::::::::A       T:::::T              
	  B::::B     B:::::B  I::::I G:::::G       G::::G       F:::::F        A:::::AAAAAAAAAAAAA:::::A      T:::::T              
	BB:::::BBBBBB::::::BII::::::IIG:::::GGGGGGGG::::G     FF:::::::FF     A:::::A             A:::::A   TT:::::::TT            
	B:::::::::::::::::B I::::::::I GG:::::::::::::::G     F::::::::FF    A:::::A               A:::::A  T:::::::::T            
	B::::::::::::::::B  I::::::::I   GGG::::::GGG:::G     F::::::::FF   A:::::A                 A:::::A T:::::::::T            
	BBBBBBBBBBBBBBBBB   IIIIIIIIII      GGGGGG   GGGG     FFFFFFFFFFF  AAAAAAA                   AAAAAAATTTTTTTTTTT            
																															   
																															   
																															   
																															   
																															   
																															   
																															   
																															   
																															   
	UUUUUUUU     UUUUUUUURRRRRRRRRRRRRRRRR   FFFFFFFFFFFFFFFFFFFFFF       GGGGGGGGGGGGG     OOOOOOOOO     DDDDDDDDDDDDD        
	U::::::U     U::::::UR::::::::::::::::R  F::::::::::::::::::::F    GGG::::::::::::G   OO:::::::::OO   D::::::::::::DDD     
	U::::::U     U::::::UR::::::RRRRRR:::::R F::::::::::::::::::::F  GG:::::::::::::::G OO:::::::::::::OO D:::::::::::::::DD   
	UU:::::U     U:::::UURR:::::R     R:::::RFF::::::FFFFFFFFF::::F G:::::GGGGGGGG::::GO:::::::OOO:::::::ODDD:::::DDDDD:::::D  
	 U:::::U     U:::::U   R::::R     R:::::R  F:::::F       FFFFFFG:::::G       GGGGGGO::::::O   O::::::O  D:::::D    D:::::D 
	 U:::::D     D:::::U   R::::R     R:::::R  F:::::F            G:::::G              O:::::O     O:::::O  D:::::D     D:::::D
	 U:::::D     D:::::U   R::::RRRRRR:::::R   F::::::FFFFFFFFFF  G:::::G              O:::::O     O:::::O  D:::::D     D:::::D
	 U:::::D     D:::::U   R:::::::::::::RR    F:::::::::::::::F  G:::::G    GGGGGGGGGGO:::::O     O:::::O  D:::::D     D:::::D
	 U:::::D     D:::::U   R::::RRRRRR:::::R   F:::::::::::::::F  G:::::G    G::::::::GO:::::O     O:::::O  D:::::D     D:::::D
	 U:::::D     D:::::U   R::::R     R:::::R  F::::::FFFFFFFFFF  G:::::G    GGGGG::::GO:::::O     O:::::O  D:::::D     D:::::D
	 U:::::D     D:::::U   R::::R     R:::::R  F:::::F            G:::::G        G::::GO:::::O     O:::::O  D:::::D     D:::::D
	 U::::::U   U::::::U   R::::R     R:::::R  F:::::F             G:::::G       G::::GO::::::O   O::::::O  D:::::D    D:::::D 
	 U:::::::UUU:::::::U RR:::::R     R:::::RFF:::::::FF            G:::::GGGGGGGG::::GO:::::::OOO:::::::ODDD:::::DDDDD:::::D  
	  UU:::::::::::::UU  R::::::R     R:::::RF::::::::FF             GG:::::::::::::::G OO:::::::::::::OO D:::::::::::::::DD   
		UU:::::::::UU    R::::::R     R:::::RF::::::::FF               GGG::::::GGG:::G   OO:::::::::OO   D::::::::::::DDD     
		  UUUUUUUUU      RRRRRRRR     RRRRRRRFFFFFFFFFFF                  GGGGGG   GGGG     OOOOOOOOO     DDDDDDDDDDDDD    
		  
	version 0.07
					
]]--

if myHero.charName ~= "Urgot" then return end

assert(load(Base64Decode("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AAQNAAAAQmlnIEZhdCBUZWFtAAQCAAAAUQAEBgAAAFJhbmdlAAMAAAAAAECPQAQGAAAAU3BlZWQAAwAAAAAAAJlABAYAAABEZWxheQADAAAAAAAAwD8EBgAAAFdpZHRoAAMAAAAAAABOQAQHAAAATVdpZHRoAAMAAAAAAABUQAQCAAAARQADAAAAAAAgjEADAAAAAABwl0ADAAAAAAAA0D8DAAAAAAAAaUAEBgAAAFdoaXRlAAMAAAAAAKiWQAMAAAAAAAAAAAMAAAAAAEB/QAQQAAAAdGFibGVfd2hpdGVsaXN0AAQFAAAAQVJHQgADAAAAAADgb0ADAAAAAAAAYEAECgAAAERyYXdMaW5lQQAEDgAAAENoZWNrRGlzdGFuY2UABAoAAABPblNjcmVlbl8ABA4AAABEcmF3RlBTQ2lyY2xlAAQEAAAAMC4zAAQIAAAAaXNWYWxpZAAEEAAAAHZhbmdhV2luZGluZ0ZpeAAEGAAAAEFkZFByb2Nlc3NTcGVsbENhbGxiYWNrAAQMAAAAQmlnRmF0VmFuZ2EABAYAAABDb3NpbgAEGAAAAENoZWNrT2JqZWN0Rm9yQ29sbGlzaW9uAAQWAAAAQmlnRmF0TWluaW9uQ29sbGlzaW9uAAQbAAAAQmlnRmF0TWluaW9uQ29sbGlzaW9uRGVidWcABBQAAABCaWdGYXRIZXJvQ29sbGlzaW9uAAQNAAAATW92ZW1lbnRQcmVkAAQIAAAAR2V0RGlzdAAEDAAAAG1pbmlvbkFycmF5AAMAAAAAAABZQAMAAAAAAMByQAQOAAAAanVuZ2xlTWluaW9ucwAEDQAAAHR1cnJldHNFbmVteQAEEAAAAGluaGliaXRvcnNFbmVteQAECwAAAG5leHVzRW5lbXkABAsAAABhbGxPYmplY3RzAAQKAAAAU2lnaHRXYXJkAAQMAAAAVGhlRG9vbUJhbGwABBMAAABQb3J0YWwgdG8gdGhlIFZvaWQABAkAAABGYWtlQ3JhYgAEBQAAAHdhcmQABBEAAABPYmplY3RzT25DcmVhdGVfAAQRAAAAT2JqZWN0c09uRGVsZXRlXwAEDwAAAE9iamVjdHNPbkxvYWRfAAQQAAAAQWRkTG9hZENhbGxiYWNrAAQVAAAAQWRkQ3JlYXRlT2JqQ2FsbGJhY2sABBUAAABBZGREZWxldGVPYmpDYWxsYmFjawAECgAAAENoZWNrTWFuYQAEBgAAAGNsYXNzAAQNAAAAU2NyaXB0U3RhdHVzAAQHAAAAX19pbml0AAQLAAAAU2VuZFVwZGF0ZQAEDAAAAFdKTUtRSlBRUVBNAAQTAAAARWJhbFlhVmFzaGlTb2NrZXRpAAQJAAAAU1hPbkxvYWQABAcAAABPbkxvYWQABBAAAABDaEluaXRBbmREcmF3U3AABAwAAABPbkNyZWF0ZU9iagAECgAAAHZhbmdhX3BseAAEBwAAAE9uVGljawAEAwAAAEtTAAQGAAAAQ29tYm8ABAcAAABIYXJhc3MABAcAAABPbkRyYXcAKQAAAAgAAAAIAAAAAQAFBwAAAEYAQACBQAAAwAAAAAGBAACWAAEBXUAAAR8AgAADAAAABAYAAABwcmludAAERQAAADxmb250IGNvbG9yPScjYzlkN2ZmJz5CaWcgRmF0IFVyZmdvZDogPC9mb250PiA8Zm9udCBjb2xvcj0iI0ZGRkZGRiI+AAQJAAAALjwvZm9udD4AAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAARAAAAEQAAAAAABAYAAAAGAEAARQCAAIUAAAHlAAAAHUAAAh8AgAABAAAABA0AAABEb3dubG9hZEZpbGUAAQAAABEAAAARAAAAAAAGCQAAAAYAQABBQAAAhQCAAMGAAAAGwUAAQQEBAFZAgQAdQAABHwCAAAUAAAAEDwAAAEF1dG91cGRhdGVyTXNnAAQYAAAAU3VjY2Vzc2Z1bGx5IHVwZGF0ZWQuICgABAUAAAAgPT4gAAQOAAAAU2VydmVyVmVyc2lvbgAELwAAACksIHByZXNzIEY5IHR3aWNlIHRvIGxvYWQgdGhlIHVwZGF0ZWQgdmVyc2lvbi4AAAAAAAIAAAAAAAADAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAEFAQQBAAAAAAAAAAAAAAAAAAAAAAAdAAAAHwAAAAIABg0AAACGAEAAh0BAAcYAQADHgMABAAEAAN2AAAEGAUAAB4FAAkABgAAdAQABngAAAJ8AAAAfAIAAAwAAAAQHAAAAc3RyaW5nAAQFAAAAZmluZAAEBgAAAGxvd2VyAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAIQAAACMAAAAAAAIEAAAABgBAAB4AgAAfAAAAHwCAAAEAAAAEDQAAAEdldFRpY2tDb3VudAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAACUAAAArAAAAAAAHDQAAAAYAQABFAIAAHQABARdAAYBGQUAAXYGAAIeBQAIZQAEDFwAAgEjAwAEigAAAo8D9fx8AgAAEAAAABAYAAABwYWlycwAEBQAAAFRpY2sABAgAAABFbmRUaW1lAAAAAAAAAgAAAAAAAQYAAAAAAAAAAAAAAAAAAAAALQAAADMAAAABAAMRAAAARwBAAEZAAABYQMAAF0ACgEcAQABGQAAAR4DAAIbAwACdgIAAGUAAAReAAIBDAIAAXwAAARdAAIBDAAAAXwAAAR8AgAAEAAAABAUAAABuYW1lAAAECAAAAEVuZFRpbWUABAUAAABUaWNrAAAAAAACAAAAAQYAAAAAAAAAAAAAAAAAAAAAAAA1AAAAQQAAAAEACx4AAABEAAAAgQAAAMFAAAAGgUAAHYGAABUBAAJBQQAA4YAEgMaBQADdgYAAx4GBAwfCwANGAkEAGEACBBfAAoAGQkEAQAKAA4ACAAAdgoABGoAABBdAAYBAAIADBkJBAEACgAOAAgAAHYKAAYAAAATgwPp/XwAAAR8AgAAGAAAAAwAAAAAAAFlAAwAAAAAAAPA/BA8AAABHZXRFbmVteUhlcm9lcwAEBQAAAHRlYW0ABAsAAABURUFNX0VORU1ZAAQIAAAAR2V0RGlzdAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAFMAAABrAAAAAAACJwAAAAsAAAAIAACABgBAAAqAwIAGAEAACoDAgQYAQAAKgECCBgBAAAqAwIIGAEAACoBAgwYAQAAKgMCDBgBAAAqAQIQGAEAACoDAhAYAQAAKgECFBgBAAAqAwIUGAEAACoBAhgYAQAAKgMCGBgBAAAqAQIcGAEAACoDAhwYAQAAKgECIBgBAAAqAwIgGAEAACoBAiQYAQAAKgMCJHwCAABQAAAAEDAAAAHdoaXRlbGlzdGVkAAQFAAAAQXNoZQABAQQIAAAAQ2FpdGx5bgAEBgAAAENvcmtpAAQHAAAARHJhdmVuAAQHAAAARXpyZWFsAAQHAAAAR3JhdmVzAAQFAAAASmlueAAEBwAAAEtvZ01hdwAEBwAAAEx1Y2lhbgAEDAAAAE1pc3NGb3J0dW5lAAQGAAAAUXVpbm4ABAYAAABTaXZpcgAECQAAAFRyaXN0YW5hAAQHAAAAVHdpdGNoAAQGAAAAVXJnb3QABAYAAABWYXJ1cwAEBgAAAFZheW5lAAQIAAAAS2FsaXN0YQAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAHgAAAB6AAAABQAMCQAAAEYBQACAAQAAwAGAAAACAAFAAoABgUIAAMACAAJdQYADHwCAAAIAAAAECQAAAERyYXdMaW5lAAMAAAAAAADwPwAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAfAAAAH4AAAAEAAcKAAAABgFAAAdBQAJOQQAAUoHAAo7BAAGSgUADTYGBAh4BAAEfAQAAHwCAAAMAAAAEBQAAAG1hdGgABAUAAABzcXJ0AAMAAAAAAAAAQAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAgAAAAIkAAAABAAYRAAAARwBAAIdAQADGgEAABsFAABpAAIIXwAGAGoAAghdAAYAawIAAF8AAgBoAAQEXQACAQwGAAF8BAAFDAQAAXwEAAR8AgAAFAAAABAIAAAB4AAQCAAAAeQAECQAAAFdJTkRPV19XAAQJAAAAV0lORE9XX0gAAwAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAACLAAAAnwAAAAUAFjkBAABGAUAAhkFAAMABAAABggAAQAKAAJ0BAAJdgQAAhsFAAMABgAKdgQABmwEAABfASoCTAQABxgFBAMdBwQMGAkEAB4JBBBDCQQTdgQABj8EBA8YBQQDHQcEDBgJBAAeCQQQQwkEE3YEAAc/BAQHOAcIDBgJBAAdCQQRGAkEAR4LBBFDCwQQdggABDwICARACAQShwR6AhgJAAMZCQAANQwIARkNCAEeDwgaGA0EAh8NCB8+DAAEPRIIEzgOEB52DAAGNg4MA3QIAAp2CAADGAkAABkNAAE1DAgCGQ0IAh4NCB8YDQQDHw8IHD4QAAU9EggQORAQI3YMAAc7DgwAdAwAC3YIAAAYDQABGQ0AAjUMCAMYDQQDHQ8EHBgRBAAeEQQgQxEEI3YMAAc/DAwHQA4EHjcMDB8ZDQgDHg8IHBgRBAAfEQghPhAABhgRBAIdEQQnGBEEAx4TBCdDEwQmdhAABj4QEAZAEAQmNhIQExgRBAMdEwQkGBUEAB4VBChDFQQrdhAABz8QEAdAEgQnNxIQEj8QECU6EhAgdhAABDQSEAF0DAAIdgwAARgNAAIZDQADNQwIABgRBAAdEQQhGBEEAR4TBCFDEwQgdhAABDwQEARAEAQjNA4QHBkRCAAeEQghGBEEAR8TCCI+EAAHGBEEAx0TBCQYFQQAHhUEKEMVBCt2EAAHPxAQB0ASBCc3EhAQGBUEAB0VBCkYFQQBHhcEKUMXBCh2FAAEPBQUBEAUBCg0FhQTPBIUJjsQECV2EAAFORIQAnQMAAl2DAACGA0MAx0NDBQeEQgVHREMGh4RCBsAEgAGdQwADhgNDAMdDwwUHhMIFR0TDBoeEwgbABIABnUMAA6CB4H+TAQABxgFBAMdBwQMGAkEAB4JBBBDCQQTdgQABj8EBA8YBQQDHQcEDBgJBAAeCQQQQwkEE3YEAAc/BAQHOAcIDBgJBAAdCQQRGAkEAR4LBBFDCwQQdggABDwICARACAQShwR6AhgJAAMZCQAAGA0EAB8NCBk+DAAGPQ4IEToODBh2DAAENAwMARkNCAEeDwgaNQ4IA3QIAAp2CAADGAkAABkNAAEYDQQBHw8IGj4MAAc9DggSOwwMHXYMAAU5DAwCGQ0IAh4NCB81DggAdAwAC3YIAAAYDQABGQ0AAhgNBAIfDQgfPgwABBgRBAAdEQQhGBEEAR4TBCFDEwQgdhAABDwQEARAEAQgNBIQERgRBAEdEwQiGBEEAh4RBCZDEQQldhAABT0QEAVAEgQhNRIQED0QECM4DhAedgwABjYMDAMZDQgDHg8IHDUSCAEYEQQBHRMEIhgRBAIeEQQmQxEEJXYQAAU9EBAFQBIEIDUQECF0DAAIdgwAARgNAAIZDQADGA0EAx8PCBw+EAAFGBEEAR0TBCIYEQQCHhEEJkMRBCV2EAAFPRAQBUASBCE1EhASGBEEAh0RBCcYEQQDHhMEJ0MTBCZ2EAAGPhAQBkAQBCY2EhARPhIQIDkQECN2DAAHOwwMABkRCAAeEQghNRIIAhgRBAIdEQQnGBEEAx4TBCdDEwQmdhAABj4QEAZAEAQlNhIQInQMAAl2DAACGA0MAx0NDBQeEQgVHREMGh4RCBsAEgAGdQwADhgNDAMdDwwUHhMIFR0TDBoeEwgbABIABnUMAA6CB4H8fAIAADgAAAAQOAAAAV29ybGRUb1NjcmVlbgAEDAAAAEQzRFhWRUNUT1IzAAMAAAAAAAAAAAQKAAAAT25TY3JlZW5fAAQFAAAAbWF0aAAEBAAAAGNvcwAEAwAAAHBpAAMAAAAAAAAQQAMAAAAAAADwPwQHAAAAbXlIZXJvAAQCAAAAeQAEBQAAAHNxcnQABAoAAABEcmF3TGluZUEABAIAAAB4AAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAApAAAAKYAAAACAAUdAAAAWABAABeABYCHQEAAmwAAABdABYCHgEAAmwAAABeABICHwEAAm0AAABdAA4CHAEEAGEBBAReAAoCHgEEAmwAAABdAAoBYAMAAF4ABgIbAQQDAAAAABgFCAJ2AgAFaQAABFwAAgINAAACDAIAAnwAAAR8AgAAJAAAAAAQGAAAAdmFsaWQABAgAAAB2aXNpYmxlAAQFAAAAZGVhZAAEDgAAAGJJbnZ1bG5lcmFibGUAAwAAAAAAAAAABAwAAABiVGFyZ2V0YWJsZQAECAAAAEdldERpc3QABAcAAABteUhlcm8AAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAACpAAAArgAAAAIABRQAAAAbAAAAFwAEgIcAQADGQEAAxwDAARjAAAEXwAKAh4BAAJtAAAAXAAKAWwAAABeAAYCHwEAASABBAYZAQQDlAAAAB4HBAA7BQQKdQIABHwCAAAgAAAAEBQAAAHR5cGUABAcAAABteUhlcm8ABAUAAABkZWFkAAQFAAAAaGFzaAABAQQMAAAARGVsYXlBY3Rpb24ABAsAAAB3aW5kVXBUaW1lAAN7FK5H4XqUPwEAAACsAAAArAAAAAAAAgMAAAAGAMAACEBAAB8AgAACAAAABAUAAABoYXNoAAEAAAAAAAIAAAAAAQEAAAAAAAAAAAAAAAAAAAAAAAIAAAAAAAEbAAAAAAAAAAAAAAAAAAAAALEAAACzAAAAAAACBAAAAAYAQAAeAIAAHwAAAB8AgAABAAAABA0AAABHZXRUaWNrQ291bnQAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAC2AAAA4QAAAAYAGNgAAACBAQAAx0FAANsBAAAXwC6AxoHAAN2BgADJAQAAxsHAAAACAADdgQABBwJBAFxCAAEXQACARkLBAEeCwQScQoABFwAAgIECAABbQQAAFwAAgEbBwQAbQQAAFwAAgAEBAADGAsIAB0NCAEdDwgIOQwMGQQMAAIeDQgDHg8ICjsMDB92CAAIGA8IAR8NCAEcDwwZHQ8IGh0NCAE6DgwaBAwAAx8NCAMcDwwfHg8IHB4RCAM4DhAcdgwACRgPCAIdDQgDBAwAAB4RCAF2DAAKGQ8MAwAOABQAEAAadg4ABkwMAB88DAgUGRMEAB4RDCEAEgASBxAMAHYSAAc8DhAcGRMEAB4RDCEAEAASBxAMAHYSAAQ8EhAMPhAMIzgOEBwZEwQAHBEQIRkTBAEeEwwiGRMEAh4RDCcAEAAQBxQMAnYSAAY+EhAOPhAMJzwQCBQZFwQAHhUMKQAWABIHFAwAdhYABzwSFCY7EBAnBxAMAXYSAAYZEwQCHhEMJwASABAHFAwCdhIABxkTBAMeEwwkABQAEQcUDAN2EgAGOxAQJxkTBAMeEwwkABQAFQcUDAN2EgAEGRcEAB4VDCkAFgASBxQMAHYWAAc8EhQkGRcEAB4VDCkAFAASBxQMAHYWAAc8EhQkGRcEAB4VDCkAFgAOBxQMAHYWAAUZFwQBHhcMKgAUABMHFAwBdhYABD0UFCs0EhQmPxAQJTYSECB2EAAHNA4QHBkTBAAeEQwhABIAEgcQDAB2EgAFGRMEAR4TDCIAEAATBxAMAXYSAAQ5EBAjQA4QHBkTBAAeERAhABIAHjMREBp0EAAEdhAAASACEiAwERQYdhAABRkTEAI9ERQJOhIQID0QECA0EhAZGxMAAgAQACF2EAAEaQIAIFwAFgIGBBQBMxEQGXYQAARlAhAcXAACAgcEDAEZEwQBHxMUIgAQAB12EAAGGRMEAhwRECcEEBgCdhAABkMRDCRlABAkXAACAgQEGABpARgQXAACAgYEGAEAEAAiABAADXwSAAReABYCBgQUAxQEAAFgAwAMXgAGAxoHAAN2BgAAFAgAAzgGCAxnAgY0XAACAgcEDAMcBRwDGwQEB2wEAABcAAICBAQYAxgHCAAdCQgBBAgAAh4JCAN2BAAIAAgAD3wGAAR8AgAAdAAAAAwAAAAAAAAAABAwAAABoYXNNb3ZlUGF0aAAEBQAAAFRpY2sABAgAAABHZXREaXN0AAQDAAAAbXMABAUAAABtYXRoAAQFAAAAaHVnZQAEBwAAAG15SGVybwAEBwAAAFZlY3RvcgAEAgAAAHgABAIAAAB6AAQFAAAAcGF0aAAECAAAAGVuZFBhdGgABAYAAABDb3NpbgAEBAAAAHBvdwADAAAAAAAAAEAEBQAAAHNxcnQABAQAAABfWEYABAQAAABtaW4ABAQAAABsZW4ABAsAAABub3JtYWxpemVkAAMAAAAAAADoPwMAAAAAAADwPwQEAAAAYWJzAAMAAAAAAAAIQAMAAAAAAMBiQAMAAAAAAAAQQAMAAAAAAECfQAQFAAAAaGFzaAAAAAAAAwAAAAEcAAABGwAAAAAAAAAAAAAAAAAAAADjAAAA6AAAAAIACScAAACHAEAAxwDAAI/AAAHHQEAAB0HAAM8AgQGNwAABxoBAAMfAwAEGgUAABwFBAkcBQACBQQEAHYGAAUaBQABHAcECh0FAAMFBAQBdgYABDUEBAt2AAAEGgUAAB8FAAkaBQABHAcEChwHAAMFBAQBdgYABhoFAAIcBQQPHQcAAAUIBAJ2BgAFNgYECHYEAAc8AgQEQwQABHwEAAR8AgAAGAAAABAIAAAB4AAQCAAAAegAEBQAAAG1hdGgABAUAAABzcXJ0AAQEAAAAcG93AAMAAAAAAAAAQAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAA6gAAAAABAAAGABlOAAAAgAGAAsYBQAAHQsAAQYIAAIfCwADdgQACBgJAAEdCQACBggAAx8JAAB2CAAJGAkAAh0JAA8GCAAAHw0ADXYIAAo4CggTOAoIDBgNBAEADgAWAAwAFHYOAAUZDQQCAAwAAwAMAA12DgAGGg0EAh8NBB8ADAAadgwABT4ODBpCDgAaNwwAHwQMCAAZEQgBABIACgAQABx2EgAFGBEAAh0RACMGEAAAHxUAIXYQAAo4EggjGBEEAAAWABUAFAAndhIABBoVBAAeFQgpGhUEAR8XCCoAFgAnBBQMAXYWAAU5FhYYdhQABTIVDCV2FAAFPRQUKTsWDCoyFQwmdhQABj4WFCY7FAwsaAIEKF8ABgBnABIEXQAGAzIXDBd2FAAEawAULF0AAgMMFgADfBQABwwUAAN8FAAEfAIAADwAAAAQHAAAAVmVjdG9yAAQCAAAAeAADAAAAAAAAAAAEAgAAAHoABAYAAABDb3NpbgAECAAAAEdldERpc3QABAUAAABtYXRoAAQEAAAAYWJzAAMAAAAAAIBRQAQNAAAATW92ZW1lbnRQcmVkAAQFAAAAc3FydAAEBAAAAHBvdwADAAAAAAAAAEADAAAAAAAA8D8EBAAAAGxlbgAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAIBAAASAQAABgASPwAAAIYBQADGQUAABoJAAMcBggOdAQEBF4AFgMbCQAAAAwAF3YIAAdsCAAAXQASAxgJBAAADAAXdggABD0NBARoAgwUXwAKAxoJBAAADAABAA4AAgAOAAcADAAIABIACQAQABd2CgAPbAgAAF0AAgMMCgADfAgABooEAACOC+X+GAUAAxsFBAJ0BAQEXgAWAxsJAAAADAAXdggAB2wIAABdABIDGAkEAAAMABd2CAAEPQ0EBGgCDBRfAAoDGgkEAAAMAAEADgACAA4ABwAMAAgAEgAJABAAF3YKAA9sCAAAXQACAwwKAAN8CAAGigQAAI4L5f4MBAACfAQABHwCAAAgAAAAEBgAAAHBhaXJzAAQMAAAAbWluaW9uQXJyYXkABAsAAABURUFNX0VORU1ZAAQIAAAAaXNWYWxpZAAECAAAAEdldERpc3QAAwAAAAAAAABABBgAAABDaGVja09iamVjdEZvckNvbGxpc2lvbgAEDgAAAGp1bmdsZU1pbmlvbnMAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAUAQAAIwEAAAQAElEAAAAGAUAARkFAAIaBQABHgYECHQEBARcACIBGwkAAgAIABF2CAAFbAgAAF8AGgEYCQQCAAgAEXYIAAY9CQQAagIIEF0AFgEaCQQCGwkEAxgJCAAADgABAAwABgAOAAcADAARdgoADWwIAABfAAoBGQkIAh4JCBMfCQgQBAwMARkNDAIGDAwDBgwMAAcQDAEHEAwBdg4ACgQMEAF1CAAMigQAAowH3fwYBQABGQUQAHQEBARcACIBGwkAAgAIABF2CAAFbAgAAF8AGgEYCQQCAAgAEXYIAAY9CQQAagIIEF0AFgEaCQQCGwkEAxgJCAAADgABAAwABgAOAAcADAARdgoADWwIAABfAAoBGQkIAh4JCBMfCQgQBAwMARkNDAIGDAwDBgwMAAcQDAEHEAwBdg4ACgQMEAF1CAAMigQAAowH3fx8AgAASAAAABAYAAABwYWlycwAEDAAAAG1pbmlvbkFycmF5AAQLAAAAVEVBTV9FTkVNWQAECAAAAGlzVmFsaWQABAgAAABHZXREaXN0AAMAAAAAAAAAQAQYAAAAQ2hlY2tPYmplY3RGb3JDb2xsaXNpb24ABAcAAABteUhlcm8ABAkAAABtb3VzZVBvcwAEDgAAAERyYXdGUFNDaXJjbGUABAIAAAB4AAQCAAAAegADAAAAAAAASUAEBQAAAEFSR0IAAwAAAAAA4G9AAwAAAAAAAAAAAwAAAAAAAAhABA4AAABqdW5nbGVNaW5pb25zAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAJQEAAC8BAAAGABIlAAAAgQEAAMZBQADHgcADAQIAAKHBBoCGQkAAjMJABQADgASdgoABxwJBBQZDQQAHA0EGWACDBReABIDGgkEAAAMABd2CAAHbAgAAF0ADgFhAAQUXwAKAxsJBAAADAABAA4AAgAMAAcADgAEABAACQAQABd2CgAPbAgAAF0AAgMMCgADfAgABoIH4f4MBAACfAQABHwCAAAgAAAADAAAAAAAA8D8EDAAAAGhlcm9NYW5hZ2VyAAQHAAAAaUNvdW50AAQIAAAAR2V0SGVybwAEBQAAAHRlYW0ABAcAAABteUhlcm8ABAgAAABpc1ZhbGlkAAQYAAAAQ2hlY2tPYmplY3RGb3JDb2xsaXNpb24AAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAxAQAAQQEAAAIACiYAAACHAEAAmwAAABfABoCHQEAAxoBAAAfBQABBAQEAh0FBAN2AAAIGgUAAR4FBAEfBwQJHwcACgQEBAMeBQQDHwcEDx0HBAx2BAAJOwQACjAHCAp2BAAHPgYAAGcABAxcAAIDAAQADDELCAh2CAAEPwgEEDQKCAR8CAAEXQAGAhoBAAMfAQAABAQEAR0FBAJ4AAAKfAAAAHwCAAAoAAAAEDAAAAGhhc01vdmVQYXRoAAQDAAAAbXMABAcAAABWZWN0b3IABAIAAAB4AAMAAAAAAAAAAAQCAAAAegAEBQAAAHBhdGgABAgAAABlbmRQYXRoAAQEAAAAbGVuAAQLAAAAbm9ybWFsaXplZAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAEMBAABGAQAAAgAGEQAAAFtAAAAXAACARgBAAIZAQACHgEABx8BAAAfBwADOAIEB0gDBAQdBQQBHQcEADkEBAhIBQQLNAIEBngAAAZ8AAAAfAIAABgAAAAQHAAAAbXlIZXJvAAQFAAAAbWF0aAAEBQAAAHNxcnQABAIAAAB4AAMAAAAAAAAAQAQCAAAAegAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAFwBAABeAQAAAgAGDQAAAIYAQACHQEABxgBAAMeAwAEAAQAA3YAAAQYBQAAHgUACQAGAAB0BAAGeAAAAnwAAAB8AgAADAAAABAcAAABzdHJpbmcABAUAAABmaW5kAAQGAAAAbG93ZXIAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAABfAQAAeQEAAAEACHQAAAAbAAAAF8ATgEcAQABbAAAAFwATgEZAQACHgEAASgAAAUfAQACGAEEAh8BAAViAgAAXgAmAR0BBABiAwQAXgACAR8BAAFjAwQAXQAeAR0BBABiAwQAXQAeAR4BAAEwAwgDBQAIAAYECAF2AAAJYwMIAF4AFgEeAQABMAMIAwUACAAEBAwBdgAACWEDDABfAA4BGgEMAR8DDAIUAgADHgEAAXYCAAVtAAAAXAAKARgBEAIeAQADBQAQAXYCAAVtAAAAXgACARoBEAIeAQABKAAABR0BBABjAxAAXgAGAR8BAAIYARQAYgIAAF4AAgEZARQCHgEAASgAAAUdAQQAYgMUAF4ABgEfAQACGAEUAGICAABeAAIBGwEUAh4BAAEoAAAFHQEEAGADGABeAAYBHwEAAhgBFABiAgAAXgACARkBGAIeAQABKAAABGwAAABeAB4BHAEAAWwAAABfABoBHQEEAGIDBABcABoBHgEAAjADCAAFBAgBBgQIAnYAAAljAQgEXQAGAjADCAAFBAgBBAQMAnYAAAhhAQwEXwAKAhoBGAMbARgAMAcIAgQEHAMFBBwAdAQAC3YAAAIfAAAGbAAAAF0AAgMeAQACKAIABHwCAAB4AAAAEBgAAAHZhbGlkAAQLAAAAYWxsT2JqZWN0cwAEBQAAAG5hbWUABAUAAAB0ZWFtAAQHAAAAbXlIZXJvAAQFAAAAdHlwZQAEDgAAAG9ial9BSV9NaW5pb24AAwAAAAAAwHJABAQAAABzdWIAAwAAAAAAAPA/AwAAAAAAACBABAkAAABNaW5pb25fVAADAAAAAAAAEEAEBQAAAE9kaW4ABAYAAAB0YWJsZQAECQAAAGNvbnRhaW5zAAQJAAAAaW5TdHJpbmcABAUAAAB3YXJkAAQOAAAAanVuZ2xlTWluaW9ucwAEDgAAAG9ial9BSV9UdXJyZXQABAsAAABURUFNX0VORU1ZAAQNAAAAdHVycmV0c0VuZW15AAQVAAAAb2JqX0JhcnJhY2tzRGFtcGVuZXIABBAAAABpbmhpYml0b3JzRW5lbXkABAcAAABvYmpfSFEABAsAAABuZXh1c0VuZW15AAQMAAAAbWluaW9uQXJyYXkABAkAAAB0b251bWJlcgADAAAAAAAAIkADAAAAAAAAJkAAAAAAAgAAAAAAAR0AAAAAAAAAAAAAAAAAAAAAewEAAI8BAAABAAQmAAAARgBAAIdAQABHgIAAWwAAABdAAICHgEAASsBAAYYAQQCbAAAAF4AAgIYAQQDHgEAAisDAAYZAQQCbAAAAF4AAgIZAQQDHgEAAisDAAYaAQQCbAAAAF4AAgIaAQQDHgEAAisDAAYbAQQCbAAAAF4AAgIYAQgDHgEAAisDAAYZAQgCbAAAAF4AAgIZAQgDHgEAAisDAAR8AgAAKAAAABAwAAABtaW5pb25BcnJheQAEBQAAAHRlYW0ABAUAAABuYW1lAAAEDgAAAGp1bmdsZU1pbmlvbnMABA0AAAB0dXJyZXRzRW5lbXkABBAAAABpbmhpYml0b3JzRW5lbXkABAYAAABuZXh1cwAECwAAAG5leHVzRW5lbXkABAsAAABhbGxPYmplY3RzAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAkQEAAJUBAAAAAAgNAAAAAQAAAEZAQABHgMAAgcAAACFAAYAGAUEARkFAAExBwQLAAYABXQGAAR1BAAAgAP5/HwCAAAYAAAADAAAAAAAAAAAECwAAAG9iak1hbmFnZXIABAsAAABtYXhPYmplY3RzAAMAAAAAAADwPwQRAAAAT2JqZWN0c09uQ3JlYXRlXwAECgAAAGdldE9iamVjdAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAJ8BAACnAQAAAQAEDgAAAEYAQABHQMAAhgBAAIeAQAHQwEAAj8AAARmAgAAXgACAQwCAAF8AAAEXQACAQwAAAF8AAAEfAIAABAAAAAQHAAAAbXlIZXJvAAQFAAAAbWFuYQAECAAAAG1heE1hbmEAAwAAAAAAAFlAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAACrAQAAtQEAAAIACicAAACGQEAAxoBAAAbBQAAHAUECQUEBAB2BAAFBgQEAgcEBAMbBQADHAcEDAQICAN2BAAEGwkAABwJBBEFCAgAdggABFgECAt0AAAGdgAAACoAAgApAAIWGAEMAwcACAJ2AAAEKgICFCoDDhoYARADHwEIAx8DDAd0AgACdgAAACoCAh4xARAABgQQAnUCAAYbARADlAAAAnUAAAR8AgAAUAAAABAUAAABod2lkAAQNAAAAQmFzZTY0RW5jb2RlAAQJAAAAdG9zdHJpbmcABAMAAABvcwAEBwAAAGdldGVudgAEFQAAAFBST0NFU1NPUl9JREVOVElGSUVSAAQWAAAATk9VU0VSTkFNRSBGT1IgWU9VIDpQAAQaAAAATk9DT01QVVRFUk5BTUUgRk9SIFlPVSA6UAAEEAAAAFBST0NFU1NPUl9MRVZFTAAEEwAAAFBST0NFU1NPUl9SRVZJU0lPTgAEBAAAAEtleQAEBwAAAHNvY2tldAAECAAAAHJlcXVpcmUABAoAAABnYW1lU3RhdGUAAAQEAAAAdGNwAAQHAAAAYXNzZXJ0AAQLAAAAU2VuZFVwZGF0ZQADAAAAAAAA8D8EFAAAAEFkZEJ1Z3NwbGF0Q2FsbGJhY2sAAQAAALIBAAC0AQAAAAADBQAAAAUAAAAMAEAAgUAAAB1AgAEfAIAAAgAAAAQLAAAAU2VuZFVwZGF0ZQADAAAAAAAAAEAAAAAAAQAAAAEAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAC2AQAAugEAAAIADRcAAACHAEAAjEBAAQGBAABBwQAAnUAAAocAQACMAEEBAUEBAEeBQQCBwQEAxwFCAAHCAQBAAoAAgcIBAMZCQgDHgsIFAcMCABYBAwKdQIABhwBAAIwAQwGdQAABHwCAAA0AAAAEBAAAAHRjcAAECAAAAGNvbm5lY3QABBEAAABzY3JpcHRzdGF0dXMubmV0AAMAAAAAAABUQAQFAAAAc2VuZAAECwAAAEdFVCAvc3luYy0ABAQAAABLZXkABAIAAAAtAAQFAAAAaHdpZAAEBwAAAG15SGVybwAECQAAAGNoYXJOYW1lAAQmAAAAIEhUVFAvMS4wDQpIb3N0OiBzY3JpcHRzdGF0dXMubmV0DQoNCgAEBgAAAGNsb3NlAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAvgEAAMgBAAAAAAgjAAAABgBAAEFAAAAWQAAARoBAAIFAAABWgIAAhsBAAMAAgACdgAABmwAAABfAAICGAEEAh0BBAViAQQEXgASAgcABAMEAAgAGQUIAB4FCAkHBAgCBAQMAHYGAAdYAgQEGQUMAQYEDAIABAAHAAYABVsGBAoABAADlAQAAHUEAAgbBQwBBAQQAHUEAAR8AgAARAAAABAkAAABMSUJfUEFUSAAEFgAAAEJpZyBGYXQgT3Jid2Fsa2VyLmx1YQAEDAAAAFNDUklQVF9QQVRIAAQKAAAARmlsZUV4aXN0AAQDAAAAX0cABBEAAABCaWdGYXRPcmJfTG9hZGVkAAEBBA8AAAByYXcuZ2l0aHViLmNvbQAETQAAAC9CaWdGYXROaWRhbGVlL0JvTC1SZWxlYXNlcy9tYXN0ZXIvTGltaXRlZEFjY2Vzcy9CaWcgRmF0IE9yYndhbGtlci5sdWE/cmFuZD0ABAUAAABtYXRoAAQHAAAAcmFuZG9tAAMAAAAAAADwPwMAAAAAAIjDQAQNAAAARG93bmxvYWRGaWxlAAQJAAAAaHR0cHM6Ly8ABAgAAAByZXF1aXJlAAQSAAAAQmlnIEZhdCBPcmJ3YWxrZXIAAQAAAMUBAADFAQAAAAACAQAAAB8AgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAMoBAADXAQAAAAAHTgAAAAYAQABGQEAAgYAAAFaAgAAdgAABG0AAABfAD4AGAEEAQUABAB2AAAEIAICBBsBAAAfAQQBBAAIAgUACAB2AgAEIAACDBoBBAAyAQgCBwAIAxgBDAAZBQwAHgUMCQcEDAB0BAAHdgAAAAQEEAJYAAQEdQIABBoBBAAzARACBAAUAHcCAAQhAAIkIAICIBoBFAAfARQBGQEQAhoBFAIcARgHGQEQAAUEGAEGBBgAWQQECnYCAAY3ARgHGgEUAxwDGAQZBRABBAQcAgYEGAFaBgQLdgIABzkDHAR2AAAIIAICKBsBHAAcASABGQEAAgYAAAFaAgACBQAgAHYCAAQgAAI8GgEcADIBIAIZARQAdQIABBoBHAAzASAAdQAABBgBBAEEACQAdQAABBkBJAAyASQAdQAABHwCAACcAAAAECgAAAEZpbGVFeGlzdAAECQAAAExJQl9QQVRIAAQOAAAAU3hPcmJXYWxrLmx1YQAECgAAAEx1YVNvY2tldAAECAAAAHJlcXVpcmUABAcAAABzb2NrZXQABA0AAABTY3JpcHRTb2NrZXQABAgAAABjb25uZWN0AAQKAAAAc3gtYm9sLmV1AAMAAAAAAABUQAQFAAAAc2VuZAAEcwAAAEdFVCAvQm9ML1RDUFVwZGF0ZXIvR2V0U2NyaXB0LnBocD9zY3JpcHQ9cmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9TdXBlcngzMjEvQm9ML21hc3Rlci9jb21tb24vU3hPcmJXYWxrLmx1YSZyYW5kPQAECQAAAHRvc3RyaW5nAAQFAAAAbWF0aAAEBwAAAHJhbmRvbQADAAAAAABAj0AEDgAAACBIVFRQLzEuMA0KDQoABA4AAABTY3JpcHRSZWNlaXZlAAQNAAAAU2NyaXB0U3RhdHVzAAQIAAAAcmVjZWl2ZQAEAwAAACphAAQKAAAAU2NyaXB0UmF3AAQHAAAAc3RyaW5nAAQEAAAAc3ViAAQFAAAAZmluZAAEBgAAADxib2xzAAQHAAAAY3JpcHQ+AAMAAAAAAAAmQAQHAAAAPC9ib2xzAAMAAAAAAADwPwQPAAAAU2NyaXB0RmlsZU9wZW4ABAMAAABpbwAEBQAAAG9wZW4ABAMAAAB3KwAEBgAAAHdyaXRlAAQGAAAAY2xvc2UABAoAAABTeE9yYldhbGsABAYAAABTeE9yYgAECwAAAExvYWRUb01lbnUAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAADZAQAALQIAAAAAC7UBAAAGAEAAHUCAAAaAQABFAIAAhQCAAB2AgAEIAICABkBAAAzAQACBAAEAwUABAB1AAAIGQEAAB0BBAAyAQQCBwAEAwQACAAZBQgBDAYAAHUAAAwZAQAAHQEEADIBBAIGAAgDBwAIABkFCAEMBgAAdQAADBkBAAAdAQQAMgEEAgQADAMFAAwAGQUIAQwEAAB1AAAMGQEAADMBAAIGAAwDBwAMAHUAAAgZAQAAHwEMADIBBAIEABADBQAQABoFEAAfBRAJBAQUA1kCBAQZBRQBBgQUAHUAAAwZAQAAHwEMADIBBAIHABQDBAAYABkFFAEGBBQAdQAADBkBAAAfAQwAMgEEAgUAGAMGABgAGwUYAQQEHAIFBBwDBgQcAAUIHAB1AgAQGQEAAB8BDAAyAQQCBwAcAwQAIAAZBRQBBgQUAHUAAAwZAQAAHwEMADIBBAIFACADBgAYABsFGAEGBCACBQQcAwYEHAAFCBwAdQIAEBkBAAAfAQwAMgEEAgcAIAMEACQAGwUYAQQEHAIFBBwDBgQcAAUIHAB1AgAQGQEAAB8BDAAyAQQCBQAkAwYAJAAZBRQBBgQUAHUAAAwZAQAAHwEMADIBBAIHACQDBgAYABsFGAEEBBwCBQQcAwYEHAAFCBwAdQIAEBkBAAAfAQwAMgEEAgQAKAMGABQAGQUUAQYEFAB1AAAMGQEAAB8BDAAyAQQCBQAoAwYAKAAZBRQBBgQUAHUAAAwZAQAAHwEMADIBBAIHACgDBAAsABkFFAEGBBQAdQAADBkBAAAfAQwAMgEEAgUALAMGACwAGQUUAQYEFAB1AAAMGQEAAB8BDAAyAQQCBwAsAwQAMAAZBRQBBgQUAHUAAAwZAQAAMwEAAgYAJAMFADAAdQAACBkBAAAdATAAMgEEAgYAMAMHADAAGwUYARgFNAUdBzQKBQQcAxgFNAcdBzQMBQgcAHUCABAZAQAAHQEwADIBBAIEACgDBgAUABkFFAEGBBQAdQAADBkBAAAdATAAMgEEAgYANAMHADQAGwUYAQQEOAIFBBwDBQQ4AAUIHAB1AgAQGQEAAB0BMAAyAQQCBgA4AwYAFAAZBRQBBgQUAHUAAAwZAQAAHQEwADIBBAIHADgDBAA8ABkFCAEMBgAAdQAADBkBAAAdATAAMgEEAgUAPAMGADwAGwUYARsFPAUdBzQKBQQcAxsFPAcdBzQMBQgcAHUCABAZAQAAHQEwADIBBAIEAEADBQBAABkFCAEMBgAAdQAADBkBAAAdATAAMgEEAgYAQAMGABQAGQUUAQYEFAB1AAAMBwBAARgBRAF2AgABVAIAAgcAQACGACIAGAVEAHYGAAAfBAAJGQVEAgYEFAMfBRAIBggUAlgECA0eBgQIYgNECF8ABgEZBQABHQcwCTIHBAsfBUQIHwkQCRkJCAIMCgABdQQADRkFRAIGBBQDHwUQCAYIFAJYBAgNHgYECGADSAhfAAYBGQUAAR0HMAkyBwQLHwVECB8JEAkZCQgCDAgAAXUEAAyDA9n8GQEAADMBAAIFAEgDBgBIAHUAAAgZAQAAHgFIADIBBAIHAEgDBwBIABgFTAEMBAACBQRMAHUCAAwZAQAAHgFIADIBBAIGAEwDBwBMABgFTAEMBAACGAVQAh0FUA8GBFACdAQABHUAAAAZAQAAHgFIADIBBAIHAFADBABUABgFTAEMBAACGAVQAh0FUA8FBFQCdAQABHUAAAAZAQAAMgEEAgUAKAMGAFQAFAYABQcEVANZAgQEGQUUAQYEFAB1AAAMGQEAADIBBAIEAFgDBgAUABkFFAEGBBQAdQAADBkBAAAyAQQCBQBYAwYAWAAZBQgBDAQAAHUAAAwZAQAAMgEEAgcAWAMEAFwAGQUUAQYEFAB1AAAMGQEAADIBBAIFAFwDBgAUABkFFAEGBBQAdQAADBkBAAAyAQQCBgBcAwYAFAAZBRQBBgQUAHUAAAwZAQAAMgEEAgcAXAMGABQAFAYAAQQEYAIUBAALBgQUA1sCBAQZBRQBBgQUAHUAAAwZAQAAMgEEAgUAYAMGAGAAFAYACQYEFANZAgQEGQUUAQYEFAB1AAAMGQEAADIBBAIHAGADBABkABkFFAEGBBQAdQAADBoBZAEbAWQCBABoAxkBaAB2AAAIIAICyBkBZAArAWrUGAFsAQUAbAIUAgADBgBsABQEAAkHBGwCGAVwAnYGAAMFBHABWwIEAHUAAAQaAXABGwFwAgQAdAFaAgAAdgAABG0AAABdAAYAGAFsAQUAbAIUAgADBQB0AVsCAAB1AAAEGQEAAB0BWABsAAAAXgACABoBdAGUAAAAdQAABHwCAAHcAAAAEEAAAAHRhYmxlX3doaXRlbGlzdAAEAwAAAEdPAAQNAAAAc2NyaXB0Q29uZmlnAAQLAAAAYWRkU3ViTWVudQAECAAAAFtEcmF3c10ABAMAAABEUgAECQAAAGFkZFBhcmFtAAQFAAAARFJhYQAEDgAAAERyYXcgQUEgUmFuZ2UABBMAAABTQ1JJUFRfUEFSQU1fT05PRkYABAUAAABEUmVlAAQNAAAARHJhdyBFIFJhbmdlAAQFAAAARFJxcQAEDQAAAERyYXcgUSBSYW5nZQAEDAAAAFtIaXRDaGFuY2VdAAQDAAAASFQABAMAAABtZwAEAgAAAFsABAcAAABteUhlcm8ABAkAAABjaGFyTmFtZQAEDAAAACBnb25uYSBkaWVdAAQSAAAAU0NSSVBUX1BBUkFNX0lORk8ABAEAAAAABAMAAABrcwAEDQAAAFtLaWxsIFN0ZWFsXQAEBgAAAEhUa3NxAAQLAAAAUSBDaGFuY2U6IAAEEwAAAFNDUklQVF9QQVJBTV9TTElDRQADAAAAAAAACEADAAAAAAAAAAADAAAAAAAAEEAEAwAAAGNvAAQIAAAAW0NvbWJvXQAEBgAAAEhUY29xAAMAAAAAAAAAQAQGAAAASFRjb2UABAsAAABFIENoYW5jZTogAAQDAAAAaGEABAkAAABbSGFyYXNzXQAEBgAAAEhUaGFxAAQLAAAAc2VwYXJhdG9yMQAEBgAAAGluZm8xAAQyAAAAMSA9IGZhc3RlciBidXQgbG93ZXIgaGl0Y2hhbmNlLCBiZXN0IGZvciBjb21iby9rcwAEBgAAAGluZm8yAAQxAAAAMiA9IHNsb3dlciBidXQgaGlnaGVyIGhpdGNoYW5jZSwgYmVzdCBmb3IgaGFyYXNzAAQGAAAAaW5mbzMABCcAAAAzID0gaXRzIGxpa2UgJzInIGJ1dCBhbmdsZSBiYXNlZCBsb2dpYwAEBgAAAGluZm80AAQSAAAANCA9IGNjL3Nsb3dzIG9ubHkABAMAAABIQQAEBQAAAEhBcWQABBQAAABRIG1heCBDYXN0IERpc3RhbmNlAAQCAAAAUQAEBgAAAFJhbmdlAAQFAAAASEFxbQAEEwAAAFE6IFVzZSBtYW5hIHRpbGwgOgADAAAAAAAASUADAAAAAAAAWUAECwAAAHNlcGFyYXRvcjYABAUAAABIQXdoAAQOAAAAVXNlIFdoaXRlbGlzdAAEBgAAAEhBd2hkAAQTAAAAV2hpdGVsaXN0IERpc3RhbmNlAAQGAAAAV2hpdGUABAUAAABIQWV4AAQlAAAAZXhjZXB0aW9uIGlmIFdoaXRlIExpc3QgT3V0IE9mIFJhbmdlAAQLAAAAc2VwYXJhdG9yNwADAAAAAAAA8D8EDwAAAEdldEVuZW15SGVyb2VzAAQMAAAAd2hpdGVsaXN0ZWQAAQEEBQAAAGhhc2gAAAQMAAAAW0tleSBCaW5kc10ABAMAAABLQgAEBgAAAENvbWJvAAQXAAAAU0NSSVBUX1BBUkFNX09OS0VZRE9XTgADAAAAAAAAQEAECAAAAEhhcmFzczEABAkAAABIYXJhc3MgMQAEBwAAAHN0cmluZwAEBQAAAGJ5dGUABAIAAABYAAQIAAAASGFyYXNzMgAECQAAAEhhcmFzcyAyAAQCAAAAQwAEKgAAAEN1cnJlbnQgUHJlZGljdGlvbjogQmlnIEZhdCBWYW5nYSB2ZXIuOiAoAAQCAAAAKQAECAAAAGFib3V0MDAABAgAAABsb2FkYmZvAAQuAAAAVHVybiBvbiB0byBsb2FkIEJpZ0ZhdE9yYndhbGtlciBvbiBuZXh0IHN0YXJ0AAQIAAAAaW5mb2JmbwAEJQAAAFJlbG9hZCBpbiBHYW1lOiBGOSB3YWl0IDUgc2Vjb25kcyBGOQAECAAAAGFib3V0MXMABAcAAABhYm91dDEABAcAAABhYm91dDIABAUAAAAgdi4gAAQHAAAAYWJvdXQzAAQEAAAAYnkgAAQHAAAAYWJvdXQ0AAQkAAAAQmlnIEZhdCBDb3JraSdzIGNob2ljZSBmb3IgVVJGIE1vZGUABAMAAAB0cwAEDwAAAFRhcmdldFNlbGVjdG9yAAQaAAAAVEFSR0VUX0xFU1NfQ0FTVF9QUklPUklUWQADAAAAAADAkkAEEAAAAERBTUFHRV9QSFlTSUNBTAAEBQAAAG5hbWUABAgAAABUYXJnZXQgAAQKAAAAUHJpbnRDaGF0AAQXAAAAPGZvbnQgY29sb3I9JyNjOWQ3ZmYnPgAEJAAAADogPC9mb250Pjxmb250IGNvbG9yPScjNjRmODc5Jz4gdi4gAARSAAAAIDwvZm9udD48Zm9udCBjb2xvcj0nI2M5ZDdmZic+IGxvYWRlZCwgd2VsY29tZSBiYWNrPC9mb250PiA8Zm9udCBjb2xvcj0nIzY0Zjg3OSc+AAQIAAAAR2V0VXNlcgAECQAAACE8L2ZvbnQ+AAQKAAAARmlsZUV4aXN0AAQMAAAAU1BSSVRFX1BBVEgABCsAAABCaWdGYXRTcHJpdGVzL290aGVycy9iaWdmYXRzcHJpdGVzLnZlcnNpb24ABIMAAAA6IDwvZm9udD48Zm9udCBjb2xvcj0nIzY0Zjg3OSc+IEJpZyBGYXQgTWFyayA0IG5vdCBmb3VuZCA9JyguIEl0cyByZWNvbW1lbmRlZCB0byB1c2Ugd2l0aCBCaWcgRmF0IE1hcmsgNCwgYWxzbyBpdHMgZnJlZSA7KSA8L2ZvbnQ+AAQQAAAAQWRkTG9hZENhbGxiYWNrAAEAAAAqAgAAKgIAAAAAAgMAAAAGAEAAHUCAAB8AgAABAAAABBMAAABFYmFsWWFWYXNoaVNvY2tldGkAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAGAAAAAAABDAEOARoBAAENAAAAAAAAAAAAAAAAAAAAAC8CAAA6AgAABAAJIwAAAAYBQAAHAQACWEBAAhfAAYAGAUAABwEAAgyBQAKAAYAAwAEAAQHCAAAdQYACF0AFgAYBQQBBQQEAgAGAARaBAQJMgUECwcEBAAFCAQBdgQAChgFCAMABgAKdgQABmwEAABcAAoCGAUAAxkFCAAACgAHdgQABisEBAIYBQACHAQADjIFCA51BAAEfAIAACwAAAAQDAAAAX0cAAAQFAAAARHJhdwADAAAAAADgb0AEDAAAAFNQUklURV9QQVRIAAQCAAAAXAAEBQAAAGdzdWIABAIAAAAvAAQKAAAARmlsZUV4aXN0AAQNAAAAY3JlYXRlU3ByaXRlAAQIAAAAUmVsZWFzZQAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAD4CAABNAgAAAQAFJwAAAEYAQABdQIAARkBAAIeAQADBwAAAXYCAAVsAAAAXQAeARkBAAIeAQADBAAEAXYCAAVsAAAAXwAWARkBBAIAAAABdgAABWIDBABeABICHgMAAhoCAAFiAQQEXgAGAh4DAAIaAgADGAEIA3YCAAM1AwgGKwICDF8ABgIeAwADLgAAAykAAhQYBQgAdgYAADUFCAsoAgYNIwAABHwCAAAsAAAAECwAAAENsZWFyVGFibGUABAkAAABpblN0cmluZwAEBQAAAG5hbWUABAYAAABVcmdvdAAEFwAAAFBsYXNtYUdyZW5hZGVfaGl0LnRyb3kABBAAAABHZXRFbmVteUZyb21Qb3MAAAQIAAAARW5kVGltZQAEBQAAAFRpY2sAAwAAAAAAiLNABAUAAABVbml0AAAAAAACAAAAAAABBgAAAAAAAAAAAAAAAAAAAABOAgAAcAIAAAMADHkAAAAYAMAAF4AMgMZAQAAAAQAARoHAAEfBwAKGgcAAhwFBA8aBwADHQcEDBoLAAAeCQQTdwAAD2wAAABdACYAaAAEBF8AIgEbBQQCAAYABXYEAAYaBwACHwUADGoCBAhcAB4BGAUIAhkFCAMABgAEGgsAAB8JABEaCwABHAsEEhoLAAIdCQQXGgsAAx4LCBV2BgANbQQAAF4ADgEbBQgCGAUMAx0HDAQeCwwFdQQACRsFDAIABAABdgQABhQEAARqAgQIXwACARkFCAEwBxALAAQAAXUGAARhAxAAXABCAxkBAAAABAABGgcAAR8HAAoaBwACHAUEDxoHAAMdBwQMGgsAAB4JBBN3AAAPbAAAAF8AMgBoAAQEXQAyARsFBAIABgAFdgQABhoHAAIfBQAMagIECF4AKgEYBQgCGQUIAwAGAAQaCwAAHwkAERoLAAEcCwQSGgsAAh0JBBcaCwADHgsIFXYGAA1tBAAAXAAeARoFEAIZBQgDAAYABBoLAAAfCQARGgsAARwLBBIaCwACHQkEFxoLAAMeCwgVdgYADW0EAABeAA4BGwUIAhgFDAMdBwwEHgsMBXUEAAkbBQwCAAQAAXYEAAYUBAAEagIECF8AAgEZBQgBMAcQCwAEAAF1BgAEfAIAAEwAAAAQHAAAAcW5vY29sAAQMAAAAQmlnRmF0VmFuZ2EABAIAAABRAAQGAAAAUmFuZ2UABAYAAABTcGVlZAAEBgAAAERlbGF5AAQGAAAAV2lkdGgABAgAAABHZXREaXN0AAQWAAAAQmlnRmF0TWluaW9uQ29sbGlzaW9uAAQHAAAAbXlIZXJvAAQHAAAATVdpZHRoAAQKAAAAQ2FzdFNwZWxsAAQDAAAAX1EABAIAAAB4AAQCAAAAegAEDAAAAEdldERpc3RhbmNlAAQHAAAAQXR0YWNrAAQCAAAAcQAEFAAAAEJpZ0ZhdEhlcm9Db2xsaXNpb24AAAAAAAMAAAAAAAEOARAAAAAAAAAAAAAAAAAAAAAAcwIAAI8CAAAAAANWAAAABgBAAAxAQAAdQAABBgBAAAfAQAAIAACBBgBBAAxAQQCGgEEAHYCAAUbAQQBYQAAAFwAAgANAAAADAIAACQCAAAYAQQAMQEEAhgBCAB2AgAFGwEEAWEAAABcAAIADQAAAAwCAAAkAAAEGAEEADEBBAIZAQgAdgIABRsBBAFhAAAAXAACAA0AAAAMAgAAJAIABBgBBAAxAQQCGgEIAHYCAAUbAQQBYQAAAFwAAgANAAAADAIAACQAAAgbAQgAdQIAAAQADAAkAgAIGAEEAB0BDAEUAgAINQAAACQAAAwaAQwAdQIAABsBDAEaAQAAdgAABGwAAABeABYAGAEEABwBEABtAAAAXgASABkBEAAeARAAHwEQAGwAAABdAAIAGwEQAHUCAAAZARAAHgEQABwBFABtAAAAXAAGABkBEAAeARAAHQEUAGwAAABdAAIAGgEUAHUCAAB8AgAAXAAAABAMAAAB0cwAEBwAAAHVwZGF0ZQAEBwAAAFRhcmdldAAEBwAAAHRhcmdldAAEBwAAAG15SGVybwAEDAAAAENhblVzZVNwZWxsAAQDAAAAX1EABAYAAABSRUFEWQAEAwAAAF9XAAQDAAAAX0UABAMAAABfUgAECwAAAENsZWFyVGFibGUAAwAAAAAAQFBABAYAAAByYW5nZQAEAwAAAEtTAAQMAAAAVmFsaWRUYXJnZXQABAUAAABkZWFkAAQDAAAAR08ABAMAAABLQgAEBgAAAENvbWJvAAQIAAAASGFyYXNzMQAECAAAAEhhcmFzczIABAcAAABIYXJhc3MAAAAAAAcAAAAAAAEHAQgBCQEKAQ8BEAAAAAAAAAAAAAAAAAAAAACRAgAApAIAAAAACkgAAAABAAAARkBAAF2AgABVAIAAgQAAACHAD4AGQUAAHYGAAAfBAAJHgUACW0EAABdADoBHwUACGUABgheADYBHQUECWwEAABfADIBGgUEAgAEAAl2BAAFbAQAAF4ALgEfBQQJbAQAAF8AKgFgAQgIXQAqARkFCAIABAAJdgQABhQGAABqAgQIXAAOAR8FAAoaBQgDBwQIAAAIAAkYCQwCdgQACj0FDAxmAgQIXwACARgFDAEyBwwLAAQACXUGAAUZBQgCAAQACXYEAAYbBQwGHAUQDGoCBAhfAA4BHwUAChoFCAMHBAwAAAgACRgJDAJ2BAAKPQUMDGYCBAheAAYBGQUQAgAEAAsGBBAAGwkQABwJFBAdCRQRdQQACIIDvfx8AgAAWAAAAAwAAAAAAAPA/BA8AAABHZXRFbmVteUhlcm9lcwAEBQAAAGRlYWQABAcAAABoZWFsdGgAAwAAAAAAAAAABAgAAAB2aXNpYmxlAAQMAAAAVmFsaWRUYXJnZXQABAYAAAB2YWxpZAAABAwAAABHZXREaXN0YW5jZQAEBwAAAGdldERtZwAEAwAAAEFEAAQHAAAAbXlIZXJvAAPNzMzMzMzsPwQHAAAAQXR0YWNrAAQCAAAAUQAEBgAAAFJhbmdlAAQKAAAAdmFuZ2FfcGx4AAQCAAAAcQAEAwAAAEdPAAQDAAAASFQABAYAAABIVGtzcQAAAAAAAwAAAAAAARABDgAAAAAAAAAAAAAAAAAAAACoAgAAzgIAAAAABnAAAAAFAAAAGwAAABdAA4AGAMAARkDAAB2AAAFFAAABGkAAABfAAYAGgMAARsDAAIYAwQAdQIABBgDBAAxAQQCGQMAAHUCAAQUAgAEbAAAAF4ALgAYAwABGQMAAHYAAAUaAQQJHwMEAGkAAABfACYAGAMIARkDAAIaAQQKHwEEBxoBBAsdAwgEGgUECB4FCAkaBQQJHwcICHcAAAxsAAAAXgAaAhgDDAIdAQwGHgEMBGkAAARdABYCGwMMAwAAAAJ2AAAHGgEECx8DBARrAAAEXgAOAhoDAAMYAxAAHQUQAR4FEAJ1AAAKGAMAAxkDAAJ2AAAHFAAABGsAAARfAAICGAMEAjEBBAQZBwACdQIABBQCAAhsAAAAXAAqABkDAAAfARAAGAAADGwAAABdABYAGgMAARsDAAIYAwQAdQIABBoDAAEYAxQCGQMAAh0BEAcZAwADHgMQBHUAAAgYAwABGQMAAHYAAAUUAAAEaQAAAF4AEgAYAwQAMQEEAhkDAAB1AgAEXQAOABgDAAEZAwAAdgAABRkBFAkfAwQAaQAAAF4ABgAaAxQBGQMAAgcAFAMYAwwDHQMMBxwDGAR1AAAIfAIAAGQAAAAQMAAAAR2V0RGlzdGFuY2UABAcAAABUYXJnZXQABAoAAABDYXN0U3BlbGwABAMAAABfVwAEBwAAAG15SGVybwAEBwAAAEF0dGFjawAEAgAAAEUABAYAAABSYW5nZQAEDAAAAEJpZ0ZhdFZhbmdhAAQGAAAAU3BlZWQABAYAAABEZWxheQAEBgAAAFdpZHRoAAQDAAAAR08ABAMAAABIVAAEBgAAAEhUY29lAAQIAAAAR2V0RGlzdAAEAwAAAF9FAAQCAAAAeAAEAgAAAHoABAUAAABuYW1lAAQDAAAAX1EABAIAAABRAAQKAAAAdmFuZ2FfcGx4AAQHAAAAcW5vY29sAAQGAAAASFRjb3EAAAAAAAcAAAABCAAAARABCQEOAQcBBgAAAAAAAAAAAAAAAAAAAADQAgAABgMAAAAACrYAAAAGAEAAB0BAAAeAQAAbAAAAF4AlgAHAAABGAEEAXYCAAFUAgACBwAAAIYAjgAYBQQAdgYAAB8EAAkYBQABHQcACh0FBAkeBgQJbAQAAFwAVgEaBQQCAAQACXYEAAYYBQACHQUADh8FBAxqAgQIXABOARwFCAltBAAAXAAmAR0FCAhlAAYUXQAiAR8FCAlsBAAAXgAeARwFDAlsBAAAXwAaAWEBDAhdABoBGgUMAhgFAAIdBQAOHwUMDXYEAAVtBAAAXABqARQGAAFsBAAAXQBmARoFBAIABAAJdgQABhgFAAIdBQAOHAUQDGoCBAhdAF4BGQUQAgAEAAsGBBAAGAkAAB8JEBAcCRQRdQQACF0AVgEcBQgJbQQAAF4AAgEfBQgJbQQAAF8ATgEYBQABHQcACR0HFAlsBAAAXgBKARoFDAIYBQACHQUADh8FDA12BAAFbQQAAF8AQgEUBgABbAQAAFwAQgEaBQQCGgUUAXYEAAYYBQACHQUADhwFEAxqAgQIXAA6ARkFEAIaBRQDBgQQABgJAAAfCRAQHAkUEXUEAAhcADIBGAUAAR0HAAodBQQJHgYECWwEAABeACoBGwUUAhgFGAIdBRgPHQUYCBgJGAAeCRgRHgkYCXYGAAoYBQACHQUADh8FBAxlAAQMXQAeARgFAAEdBwAJHQcUCWwEAABcABoBGgUMAhgFAAIdBQAOHwUMDXYEAAVtBAAAXQASARQGAAFsBAAAXgAOARoFBAIaBRQBdgQABhgFAAIdBQAOHAUQDGoCBAheAAYBGQUQAhoFFAMGBBAAGAkAAB8JEBAcCRQRdQQACIMDbfxcABoAGgEMARgBAAEdAwABHwMMAHYAAARtAAAAXQASABQCAABsAAAAXgAOABoBBAEaARQAdgAABRgBAAEdAwABHAMQAGkAAABeAAYAGQEQARoBFAIGABADGAEAAx8DEAccAxQEdQAACHwCAABsAAAAEAwAAAEdPAAQDAAAASEEABAUAAABIQXdoAAMAAAAAAADwPwQPAAAAR2V0RW5lbXlIZXJvZXMABAUAAABoYXNoAAQMAAAAR2V0RGlzdGFuY2UABAYAAABIQXdoZAAEBQAAAGRlYWQABAcAAABoZWFsdGgAAwAAAAAAAAAABAgAAAB2aXNpYmxlAAQGAAAAdmFsaWQAAAQKAAAAQ2hlY2tNYW5hAAQFAAAASEFxbQAEBQAAAEhBcWQABAoAAAB2YW5nYV9wbHgABAIAAABxAAQDAAAASFQABAYAAABIVGhhcQAEBQAAAEhBZXgABAcAAABUYXJnZXQABA4AAABDaGVja0Rpc3RhbmNlAAQHAAAAbXlIZXJvAAQCAAAAeAAEAgAAAHoAAAAAAAIAAAAAAAEHAAAAAAAAAAAAAAAAAAAAAAkDAAAbAwAAAAAGOQAAAAYAQAAHQEAAG0AAABfADIAGgEAAB8BAAAcAQQAbAAAAFwACgAZAQQBGAEAAR4DBAIYAQACHwEEBxQCAAAUBAAFBAQIAHUAAAwUAgAEbAAAAF8ADgAaAQAAHwEAAB0BCABsAAAAXgAKABkBBAEYAQABHgMEAhgBAAIfAQQHGgEICx8DCAc4AwwEFAQABQQECAB1AAAMFAIACGwAAABfAA4AGgEAAB8BAAAdAQwAbAAAAF4ACgAZAQQBGAEAAR4DBAIYAQACHwEEBxoBDAsfAwgHOAMMBBQEAAUEBAgAdQAADHwCAAA8AAAAEBwAAAG15SGVybwAEBQAAAGRlYWQABAMAAABHTwAEAwAAAERSAAQFAAAARFJhYQAEDgAAAERyYXdGUFNDaXJjbGUABAIAAAB4AAQCAAAAegADAAAAAAAAAEAEBQAAAERSZWUABAIAAABFAAQGAAAAUmFuZ2UAAwAAAAAAAElABAUAAABEUnFxAAQCAAAAUQAAAAAABgAAAAAAARABEgEJAQ4BBwAAAAAAAAAAAAAAAAAAAAABAAAAAQAAAAAAAAAAAAAAAAAAAAAA"), nil, "bt", _ENV))()