/*

   Log class 
   - Outputs info to user about game events (creature born, dead,...)
   - One specific creature can be followed for output
   

*/




//#macro LOG_ID	controller.log.log_id						// <--- deprecated

function Log() constructor{

	_filename = "";
	_file = -1;
	_line = 0;
	_lines_buffer = [];
	_heading = 
		 		  "time"
				 + CSV_SEPARATOR
		 		 + "month"
				 + CSV_SEPARATOR
		 		 + "year"
				 + CSV_SEPARATOR
				 + "EVENT"
				 + CSV_SEPARATOR
				 + "id1"
				 + CSV_SEPARATOR
				 + "name"
				 + CSV_SEPARATOR
				 + "thropic_level"
				 + CSV_SEPARATOR
				 + "specie"
				 + CSV_SEPARATOR
				 + "id2"
				 + CSV_SEPARATOR
				 + "x"
				 + CSV_SEPARATOR
				 + "y"
				 + CSV_SEPARATOR
				 + "num1"
				 + CSV_SEPARATOR
				 + "num2"
				 + CSV_SEPARATOR
				 + "txt1"
				 + CSV_SEPARATOR
				 + "txt2"
				 + CSV_SEPARATOR
				 + "txt3"
				 ;







}