package com.medcloud.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.medcloud.Dao.BlManager;
import com.medcloud.Dao.RoutineDao;
import com.medcloud.Model.RoutineMedicalRecord;

@Controller
public class RoutineController {

	@Autowired
	RoutineDao dao3;
	
	@Autowired
	BlManager bl;
	
	RoutineMedicalRecord routine=new RoutineMedicalRecord();
	
	@RequestMapping("RoutineMedicalRecord")
	public String ShowRoutine(Model m)
	{
		return "RoutineMedicalRecord";
	}
	
	
	@RequestMapping( value="/routineprocesss", method=RequestMethod.POST)
	public String Routinesave(HttpSession session,@RequestParam("height")int height ,
			@RequestParam("weight")int weight,@RequestParam("sugar")int sugar 
			,@RequestParam("bloodpressure")int bloodpressure ,@RequestParam("pulse")int pulse,Model m ) 
	{ 
		String email=(String)session.getAttribute("patientemailsession");
		String userid=bl.getdataByEmail(email);
		Integer id=Integer.parseInt(userid);
		System.out.println("In Routine"+id+"Email is"+email );
		System.out.println("In routine "+height);
		routine.setHeight(height);
		routine.setWeight(weight);
		routine.setPulse(pulse);
		routine.setBloodpressure(bloodpressure);
		routine.setSugar(sugar);
		//routine.setDate(Calendar.getInstance().getTime());
		dao3.insertroutine(routine,2);
		return "Error";		
	}
}
