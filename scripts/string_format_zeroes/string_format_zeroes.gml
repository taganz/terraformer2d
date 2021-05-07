// Script assets have changed for v2.3.0 see
// string_format with zeroes at the beginning
function string_format_zeroes(num, long, decimals){
	return string_replace_all(string_format(num, long, decimals), " ", "0");

}