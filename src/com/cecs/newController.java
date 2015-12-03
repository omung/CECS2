package com.cecs;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class newController {
ArrayList<String> array= new ArrayList<String>();
AdminMetaData am= new AdminMetaData();
	@RequestMapping("/list")
	public @ResponseBody ArrayList<String> getListofIntegers(@RequestParam("list") String list, Model model){
		System.out.println(list);
		array.add(list);
		model.addAttribute("array",array);
		return array;
	}
	
	
	@RequestMapping(value="/AdminStore2", method= RequestMethod.GET)
	public String Store(@RequestParam("name") String name, @RequestParam("inputType") String inputType, @RequestParam(value="min", required= false) String min,@RequestParam(value="max", required= false) String max, @RequestParam(value="minD", required= false) String minD, @RequestParam(value="maxD", required= false) String maxD,  @RequestParam(value="length", required= false) String length,  @RequestParam(value="date", required= false) String date, @RequestParam(value="date1", required= false) String date1,  @RequestParam(value="mon", required= false) String mon, Model model) throws ClassNotFoundException, SQLException{
	String str="";
	int n=0;
	if(inputType.equalsIgnoreCase("List of Integers")){
		Iterator<String> it= array.iterator();
		while(it.hasNext()){
			if(n==0){
			str= str+ it.next();
			}else{
				str= str+","+it.next();
			}
				n++;
		}
	array.clear();	
	}
	
	System.out.println(name+"  "+inputType+min+max);
	boolean isValid= am.storeAttributes(name, inputType, min, max, minD, maxD, length, date, date1, mon, str);
	if(isValid){
	return "AdminMetaData";
	}
	else{
		return "unsuccessful";
	}
	}
}
