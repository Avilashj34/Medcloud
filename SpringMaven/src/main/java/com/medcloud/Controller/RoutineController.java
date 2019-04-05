package com.medcloud.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.medcloud.Dao.RoutineDao;
import com.medcloud.Model.RoutineMedicalRecord;

@Controller
public class RoutineController {

	@Autowired
	RoutineDao dao3;
	
	@RequestMapping("RoutineMedicalRecord")
	public String ShowRoutine(Model m)
	{
		m.addAttribute("command",new RoutineMedicalRecord());
		return "RoutineMedicalRecord";
	}
	
	
	@RequestMapping( value="/routineprocess", method=RequestMethod.POST)
	public String Routinesave(@ModelAttribute("routine") RoutineMedicalRecord routine)
	{
		dao3.insertroutine(routine);
		return "Home";		
	}
}
