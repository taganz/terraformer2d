// --- write buffer to disk
function _log_write_buffer(){

	if obj_gui.options_log {
		with controller.log {
			for (var i=0; i< min( array_length(_lines_buffer), BUFFER_LINES); i++) {
				file_text_write_string(_file, _lines_buffer[i] + "\n");
			}
		}
	}
}