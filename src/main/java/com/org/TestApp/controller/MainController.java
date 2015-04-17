package com.org.TestApp.controller;
 
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.org.TestApp.objects.Client;
import com.org.TestApp.objects.ScenarioDetails;
import com.org.TestApp.objects.Scenarios;
 
@Controller
@RequestMapping("/")
public class MainController {

	@Autowired
	private ScenarioDetailsService scenarioDetailService;
	
	@Autowired
	private ClientService clientService;
	
	@Autowired
	private ScenarioService scenarioService;
 
	@RequestMapping(method = RequestMethod.GET)
	public String printHomePage(ModelMap model) {
 
		
		model.addAttribute("message", "Testing Application");
		model.addAttribute("homeList", scenarioService.listScenarios());
		
		return "home"; 
	}
	
	
	@RequestMapping(value="/getTilesInfo",method = RequestMethod.GET)
	public String getTilesInfo(ModelMap model,@RequestParam(value="clientId") String client,@RequestParam(value="scenarioId") String scenarioId) {
 
		model.addAttribute("message", "Testing Application");
		model.addAttribute("homeList", scenarioService.listScenarios());
		
		return "tiles"; 
 
	}
	
	@RequestMapping(value="/getTilesDtlInfo",method = RequestMethod.GET)
	public String getTilesDtlInfo(ModelMap model,@RequestParam(value="clientId") String client,@RequestParam(value="scenarioId") String scenarioId) {
 
		model.addAttribute("message", "Testing Application");
		model.addAttribute("homeList", scenarioDetailService.listScenarioDetails(client,scenarioId));
		
		return "switch"; 
 
	}
	
	@RequestMapping(value="/executeScenarios",method = RequestMethod.POST,consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String executeScenarios(HttpServletRequest request,@RequestBody String param) {
 
		try {
			Thread.sleep(1000);
			System.out.println("MainController.executeScenarios()"+param);
			Gson gson = new Gson();
			Map map = gson.fromJson(param, LinkedHashMap.class);
			System.out.println(map);
			RunScenarios run = new RunScenarios(map);
			
			boolean status = run.execute();
			return status+"";
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "false";
		} 
	}
	

	@RequestMapping(value = "/scenarioDetails", method = RequestMethod.GET)
	public String getScenarioDetailsList(ModelMap model,HttpServletRequest request) {
		model.addAttribute("ScenarioDetailsList", scenarioDetailService.listScenarioDetails());
		model.addAttribute("ClientList", clientService.listClient());
		model.addAttribute("ScenarioList", scenarioService.listScenarios());
		
		return "scenarioDtls"; 
	}

	/*@RequestMapping(value = "/ScenarioDetails/save", method = RequestMethod.POST)
	public View createScenario(@ModelAttribute ScenarioDetails details, ModelMap model,HttpServletRequest request) {

		System.out.println("MainController.createBook()"+request.getServletPath());
		scenarioDetailService.addScenarioDetails(details);

		return new RedirectView("/TestApp/saveScenarioDetails");
	}*/
	
	
	@RequestMapping(value = "/ScenarioDetails/save", method = RequestMethod.POST)
	public String createScenarioDeatail(@ModelAttribute ScenarioDetails details, ModelMap model,HttpServletRequest request) {

		details.setKEY(details.getClientId()+details.getScenarioId()+details.getStepNo());
		scenarioDetailService.addScenarioDetails(details);
		
		return "adminFile"; 
	}
	
	
	@RequestMapping(value = "/scenario", method = RequestMethod.GET)
	public String getScenarioList(ModelMap model,HttpServletRequest request) {
		model.addAttribute("ScenarioList", scenarioService.listScenarios());
		model.addAttribute("ClientList", clientService.listClient());
		return "scenario"; 
	}
	
	
	@RequestMapping(value = "/Scenario/save", method = RequestMethod.POST)
	public String createScenario(@ModelAttribute Scenarios details, ModelMap model,HttpServletRequest request) {

		details.setKEY(details.getClientId()+details.getScenarioId());
		scenarioService.addScenarios(details);
		return "adminFile"; 
	}
	
	@RequestMapping(value = "/client", method = RequestMethod.GET)
	public String getClientList(ModelMap model,HttpServletRequest request) {
		createList();
		model.addAttribute("ClientList", clientService.listClient());
		return "client"; 
	}
	
	
	@RequestMapping(value = "/Client/save", method = RequestMethod.POST)
	public String createClient(@ModelAttribute Client details, ModelMap model,HttpServletRequest request) {

		clientService.addClient(details);
		return "adminFile"; 
	}
	
	@RequestMapping(value = "/loadClientCombo", method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List getClientList(){
		List list = new ArrayList();
		list = clientService.listClient();
		return list; 
	}
	
	@RequestMapping(value = "/loadScenarioCombo", method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List getScenarioList(@RequestParam("clientId") String client){
		return scenarioService.listScenarios(); 
	}	
	
	void createList(){
		Client details = new Client();
		details.setActiveFlag(true);
		details.setClientId("NASA");
		details.setClientName("National Aeronautics and Space Administration");
		clientService.addClient(details);
		details.setClientId("AMZ");
		details.setClientName("Amazon.in");
		clientService.addClient(details);
		details.setClientId("ZOHO");
		details.setClientName("Zoho Corporation");
		clientService.addClient(details);
		details.setClientId("FLP");
		details.setClientName("Flipkart.com");
		clientService.addClient(details);
		
		List<Client> cList = clientService.listClient();
		
		for (Client client : cList) {
			for (int i = 1; i < 4; i++) {
				Scenarios s = new Scenarios();
				//s.setClientId(client.getClientId());
				s.setKEY(client.getClientId(),client.getClientId()+""+i);
				s.setScenarioName(client.getClientId()+" Scenario "+i);
				scenarioService.addScenarios(s);
			}
		}
		
		List<Scenarios> sList = scenarioService.listScenarios();
		
		for (Scenarios scenario : sList) {
			for (int i = 1; i < 4; i++) {
				ScenarioDetails s = new ScenarioDetails();
				//s.setClientId(client.getClientId());
				s.setKEY(scenario.getClientId(),scenario.getScenarioId(),i);
				s.setStepDesc(scenario.getClientId()+" "+scenario.getScenarioName()+" Step "+i);
				scenarioDetailService.addScenarioDetails(s);
			}
		}
		
	}
}