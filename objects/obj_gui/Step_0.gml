// room0 states

if room == Room0 {

	// states 0: selecting room, 1: configuring, 2: ready to do next_roomm
	switch(state) {
		case GUI_STATE.MENU_INPUT:
		break;
		case GUI_STATE.CONFIG_ROOM:
		break;
		case GUI_STATE.LAUNCH_SIMULATION:
			ASSERT(selected_room != -1, 0, "obj_gui, room not selected");
			room_goto(selected_room);
			break;
		default:
			ASSERT(false, 0, "obj_gui, switch state error"+string(state));
	}

	
}


// check if some creature is alive and suggest restart if not

if room != Room0 and show_escape_screen == false and controller.time.current_sim_step > 50 {
		
	gui_step_check_someone_alive();
}