package com.cecs;

import java.awt.Color;
import java.awt.Font;
import java.awt.GradientPaint;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {
	FetchFromDatabase fd = new FetchFromDatabase();
	Jdbc_conn conn = new Jdbc_conn();
	LoginService ls = new LoginService();
	Register rg = new Register();
	AdminMetaData am = new AdminMetaData();
	RetrieveTypesForAdmin rt = new RetrieveTypesForAdmin();
	RetrieveAttributes ra = new RetrieveAttributes();
	Groups ag = new Groups();
	yourGroups yg = new yourGroups();
	FetchAttributesOfSpecifiedGroup fsg = new FetchAttributesOfSpecifiedGroup();
	static String capt = "";
	String checkCaptcha;

	@RequestMapping("/loginstore")
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		System.out.println("Login controller is working");
		HttpSession session = request.getSession();
		session.setAttribute("username", username);

		String message = "Valid name";
		String fail_message = "Invalid Username or password";
		Boolean isValidLogin = ls.validateLogin(username, password);
		if (isValidLogin) {
			model.addAttribute("message", message);

			ResultSet rs1 = fd.getUserAndPassword(username, password);
			ArrayList arr = new ArrayList<String>();

			while (rs1.next()) {
				FormData f1 = new FormData();

				f1.setFirstname(rs1.getString("firstName"));
				f1.setLastname(rs1.getString("lastName"));
				f1.setUsername(rs1.getString("username"));
				f1.setPassword(rs1.getString("password"));
				f1.setDepartment(rs1.getString("department"));
				f1.setInstitution(rs1.getString("institution"));
				f1.setCity(rs1.getString("city"));
				f1.setState(rs1.getString("state"));
				f1.setCountry(rs1.getString("country"));
				f1.setEnabled(rs1.getString("enabled"));

				arr.add(f1);
				System.out.println(f1.getFirstname());
				System.out.println(f1.getLastname());
				System.out.println(f1.getUsername());
				System.out.println(f1.getPassword());
				System.out.println(f1.getDepartment());
				System.out.println(f1.getInstitution());
				System.out.println(f1.getCity());
				System.out.println(f1.getState());
				System.out.println(f1.getCountry());

			}

			model.addAttribute("arr", arr);
			return ("Profile");
		} // if ends here
		else {
			model.addAttribute("fail_message", fail_message);
			return ("login");

		} // else code ends here

	}// method login ends here

	@RequestMapping("/login")
	public String loginpage(Model model) {
		return "login";
	}

	@RequestMapping("/register")
	public String getRegistrationPage(Model model) {
		return "Registration";
	}

	@RequestMapping("/UpdateProfile")
	public String update(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model) throws ClassNotFoundException, SQLException {

		ResultSet rs1 = fd.getUserAndPassword(username, password);
		ArrayList<FormData> arr = new ArrayList<FormData>();

		while (rs1.next()) {
			FormData f1 = new FormData();

			f1.setFirstname(rs1.getString("firstName"));
			f1.setLastname(rs1.getString("lastName"));
			f1.setUsername(rs1.getString("username"));
			f1.setPassword(rs1.getString("password"));
			f1.setDepartment(rs1.getString("department"));
			f1.setInstitution(rs1.getString("institution"));
			f1.setCity(rs1.getString("city"));
			f1.setState(rs1.getString("state"));
			f1.setCountry(rs1.getString("country"));
			f1.setEnabled(rs1.getString("enabled"));

			arr.add(f1);
			System.out.println(f1.getFirstname());
			System.out.println(f1.getLastname());
			System.out.println(f1.getUsername());
			System.out.println(f1.getPassword());
			System.out.println(f1.getDepartment());
			System.out.println(f1.getInstitution());
			System.out.println(f1.getCity());
			System.out.println(f1.getState());
			System.out.println(f1.getCountry());

		}

		model.addAttribute("arr", arr);
		return ("UpdateProfile");
	}

	@RequestMapping("/UpdateUser")
	public String UpdateUser(@RequestParam("firstname") String firstname, @RequestParam("lastname") String lastname,
			@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("department") String department, @RequestParam("institution") String institution,
			@RequestParam("city") String city, @RequestParam("state") String state,
			@RequestParam("country") String country, Model model, HttpServletRequest request)
					throws ClassNotFoundException, SQLException {
		fd.updateUserInfo(firstname, lastname, username, password, department, institution, city, state, country);

		return "redirect:/Profile";
	}

	@RequestMapping("/backPage")
	public String gobackToProfile() {

		return "redirect:/Profile";
	}

	@RequestMapping("/YourGroups")
	public String YourGroups(@RequestParam("username1") String username, HttpServletRequest request, Model model)
			throws ClassNotFoundException, SQLException {

		model.addAttribute("arr", yg.getYourGroups(username));

		return "YourGroups";
	}

	@RequestMapping(value="/updateAttributesValues", method= RequestMethod.GET)
	public String updateAttributesValues(@RequestParam("value") String value, @RequestParam("combine_id") String combine_id, Principal principal,
			HttpServletRequest request, Model model) throws ClassNotFoundException, SQLException {

		String username = principal.getName(); // get logged in username
		yg.updateUserGroupsAttributesValues(username, combine_id, value);

		return "redirect:/Profile";
	}

	@RequestMapping("/Profile")
	public String Profile(Principal principal, HttpServletRequest request, Model model)
			throws ClassNotFoundException, SQLException {

		String username = principal.getName(); // get logged in username

		System.out.println("Our session user is: " + username);
		ResultSet rs1 = fd.getUser(username);
		ArrayList<FormData> arr = new ArrayList<FormData>();

		while (rs1.next()) {
			FormData f1 = new FormData();

			f1.setFirstname(rs1.getString("firstName"));
			f1.setLastname(rs1.getString("lastName"));
			f1.setUsername(rs1.getString("username"));
			f1.setPassword(rs1.getString("password"));
			f1.setDepartment(rs1.getString("department"));
			f1.setInstitution(rs1.getString("institution"));
			f1.setCity(rs1.getString("city"));
			f1.setState(rs1.getString("state"));
			f1.setCountry(rs1.getString("country"));
			f1.setEnabled(rs1.getString("enabled"));

			arr.add(f1);
			System.out.println(f1.getFirstname());
			System.out.println(f1.getLastname());
			System.out.println(f1.getUsername());
			System.out.println(f1.getPassword());
			System.out.println(f1.getDepartment());
			System.out.println(f1.getInstitution());
			System.out.println(f1.getCity());
			System.out.println(f1.getState());
			System.out.println(f1.getCountry());

		}

		model.addAttribute("arr", arr);

		return "Profile";
	}

	@RequestMapping(value = "/checkCaptcha", method = RequestMethod.GET)
	public @ResponseBody boolean checkCaptcha(@RequestParam("cappi") String cappi, Model model)
			throws ClassNotFoundException, SQLException, ServletException, IOException {
		System.out.println("Cappi: " + cappi);
		System.out.println("CheckCaptcha: " + checkCaptcha);
		boolean isValid = checkCaptcha.equalsIgnoreCase(cappi);
		if (isValid) {
			return true;
		} else {
			return false;
		}
	}// method CheckCaptcha ends here

	@RequestMapping("/")
	public String getLoginPage(Model model, HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, ServletException, IOException {

		return "index";

	}// method login ends here

	@RequestMapping("Registration")
	public String getRegistrationPage(Model model, HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, ServletException, IOException {

		return "Registration";

	}

	@RequestMapping("/captcha")
	public void getCaptcha(Model model, HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, ServletException, IOException {

		String c = processRequest(request, response);
		model.addAttribute("captcha", c);
	}

	protected String processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int width = 150;
		int height = 50;

		char data[][] = { { 'z', 'e', 't', 'c', 'o', 'd', 'e' }, { 'l', 'i', 'n', 'u', 'x' },
				{ 'f', 'r', 'e', 'e', 'b', 's', 'd' }, { 'u', 'b', 'u', 'n', 't', 'u' }, { 'j', 'e', 'e' } };

		BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

		Graphics2D g2d = bufferedImage.createGraphics();

		Font font = new Font("Georgia", Font.BOLD, 18);
		g2d.setFont(font);

		RenderingHints rh = new RenderingHints(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

		rh.put(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);

		g2d.setRenderingHints(rh);

		GradientPaint gp = new GradientPaint(0, 0, Color.red, 0, height / 2, Color.black, true);

		g2d.setPaint(gp);
		g2d.fillRect(0, 0, width, height);

		g2d.setColor(new Color(255, 153, 0));

		Random r = new Random();
		int index = Math.abs(r.nextInt()) % 5;

		String captcha = String.copyValueOf(data[index]);
		request.getSession().setAttribute("captcha", captcha);

		int x = 0;
		int y = 0;

		for (int i = 0; i < data[index].length; i++) {
			x += 10 + (Math.abs(r.nextInt()) % 15);
			y = 20 + Math.abs(r.nextInt()) % 20;
			g2d.drawChars(data[index], i, 1, x, y);
		}

		g2d.dispose();

		response.setContentType("image/png");
		OutputStream os = response.getOutputStream();
		ImageIO.write(bufferedImage, "png", os);
		os.close();
		System.out.println(captcha);
		checkCaptcha = captcha;
		return captcha;
	}

	@RequestMapping("/reg")
	public String Register(@RequestParam("firstname") String firstname, @RequestParam("lastname") String lastname,
			@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("department") String department, @RequestParam("institution") String institution,
			@RequestParam("city") String city, @RequestParam("state") String state,
			@RequestParam("country") String country, Model model, HttpServletRequest request)
					throws ClassNotFoundException, SQLException {
		String msg = "";
		Boolean valid = rg.storeRegisterData(firstname, lastname, username, password, department, institution, city,
				state, country);
		System.out.println(valid);
		if (valid) {
			return "/index";
		} else {
			model.addAttribute(msg, "Missing or Invalid details. Please check the filled entries");

			return "Registration";
		}
	}// Reg ends here

	@RequestMapping("/Admin")
	public String AdminMetaData(Model model) throws ClassNotFoundException, SQLException {
		ArrayList<String> arr = new ArrayList<String>();
		ResultSet r1 = rt.retrieveData();

		while (r1.next()) {
			arr.add(r1.getString("vartype"));

		}
		model.addAttribute("arr", arr);

		return "AdminMetaData";
	}

	@RequestMapping("/home")
	public String UserData(Model model) throws ClassNotFoundException, SQLException {

		model.addAttribute("user", fd.getUserData());
		return "home";
	}

	@RequestMapping(value = "/validateregister", method = RequestMethod.GET)
	public @ResponseBody Boolean ValidateRegister(@RequestParam("characterstic") String characteristic, Model model)
			throws ClassNotFoundException, SQLException {
		System.out.println(characteristic);
		boolean valid = am.checkRegName(characteristic);
		if (valid) {
			return true;
		}

		return false;
	}

	@RequestMapping(value = "/validatemetadata", method = RequestMethod.GET)
	public @ResponseBody Boolean ValidateMetaData(@RequestParam("characterstic") String characteristic, Model model)
			throws ClassNotFoundException, SQLException {
		System.out.println(characteristic);
		boolean valid = am.checkData(characteristic);
		if (valid) {
			return true;
		}

		return false;
	}

	@RequestMapping(value = "/GroupSubmit", method = RequestMethod.GET)
	public String AdminGroup(@RequestParam("name") String name, @RequestParam("cstics") String cstics, Model model)
			throws ClassNotFoundException, SQLException {
		System.out.println(name);
		String[] arr = cstics.split(",");
		ag.getGroupData(name, cstics);

		return "AdminGroup";

	}

	@RequestMapping("/AdminGroup")
	public String AdminGroup(Model model) throws ClassNotFoundException, SQLException {

		return "AdminGroup";

	}

	@RequestMapping(value = "/AdminGroupSearch", method = RequestMethod.GET)
	public @ResponseBody ArrayList<attributes> AdminGroupSearch(@RequestParam("search") String search, Model model)
			throws ClassNotFoundException, SQLException {
		ResultSet r1 = ra.retrieveData(search);
		ArrayList<attributes> a = new ArrayList<attributes>();

		while (r1.next()) {
			attributes art = new attributes();

			art.setMid(r1.getInt("_mid"));
			art.setName(r1.getString("name"));
			art.setInputType(r1.getString("inputType"));
			art.setMin(r1.getInt("min"));
			art.setMax(r1.getInt("max"));
			art.setMinD(r1.getInt("minD"));
			art.setMaxD(r1.getInt("maxD"));
			art.setLength(r1.getInt("length"));
			art.setDate(r1.getString("date"));
			art.setDate1(r1.getString("date1"));
			art.setMon(r1.getInt("mon"));
			art.setList(r1.getString("list"));

			a.add(art);
			System.out.println(art.getName());
		}

		return a;

	}

	@RequestMapping(value = "/validateGroup", method = RequestMethod.GET)
	public @ResponseBody boolean validateGroupName(Model model, @RequestParam("characteristic") String characteristic)
			throws ClassNotFoundException, SQLException {
		boolean isValid = am.checkGroupName(characteristic);
		String success_message = "";
		String error_message = "";
		if (isValid) {

			model.addAttribute(success_message, "Name is available");
			return true;
		} else {
			model.addAttribute(error_message, "Name is not available");
			return false;
		}
	}

	@RequestMapping("DeleteGroup")
	public String deleteGroup(Model model) {
		return "DeleteGroup";
	}

	@RequestMapping(value = "/UserGroup", method = RequestMethod.GET)
	public String userGroup(Model model) throws ClassNotFoundException, SQLException {

		model.addAttribute("arr", ag.retrieveGroupName());
		return "GroupsInfo";
	}

	@RequestMapping("MaintainGroup")
	public String MaintainGroup(Model model) {
		return "MaintainGroup";
	}

	@RequestMapping("/seeAttributes")
	public String seeAttributes(@RequestParam("id") String id, Model model)
			throws ClassNotFoundException, SQLException {

		model.addAttribute("art", fsg.getAttributes(id));

		return "seeAttributes";
	}

	@RequestMapping("/storeChar")
	public @ResponseBody boolean storeChar(@RequestParam("combine_id") String combine_id,
			@RequestParam("Characteristic") String characteristic, HttpServletRequest request, Model model)
					throws ClassNotFoundException, SQLException {

		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		fsg.storeCharasteristicValues(username, combine_id, characteristic);
		return true;

	}

	@RequestMapping("/attributesValues")
	public String attributesValues(@RequestParam("name") String name, Model model)
			throws ClassNotFoundException, SQLException {

		model.addAttribute("art", fsg.getAttributes(name));

		return "seeAttributes";
	}

	@RequestMapping(value = "/DeleteGroupSearch", method = RequestMethod.GET)
	public @ResponseBody String DeleteGroupSearch(@RequestParam("search") String search, Model model)
			throws ClassNotFoundException, SQLException {
		System.out.println(search);
		boolean isValid = ag.retrieveGroup(search);
		System.out.println(isValid);
		String error_message = "";
		String success_message = "";
		if (isValid) {
			model.addAttribute(success_message, "Group Name Deleted");
			return "DeleteGroup";
		} else {
			model.addAttribute(error_message, "Group not deleted");
			return "DeleteGroup";

		}
	}

}// class code ends here
