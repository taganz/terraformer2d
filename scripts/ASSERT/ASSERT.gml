
// _id can be 0

function ASSERT (_exp, _id, _msg) {
	if _exp == false {
		show_message(_msg);
		LOG(LOGEVENT.ERROR_ASSERT, _id, _msg);
	}
}