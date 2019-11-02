package merrymac.sunshinecontacts.controller;

import merrymac.sunshinecontacts.dao.entity.Organization;
import merrymac.sunshinecontacts.service.OrgService;
//import merrymac.sunshinecontacts.service.PeopleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
public class ContactController {
    @Autowired private OrgService orgService;
//    @Autowired private PeopleService peopleService;

    @RequestMapping("/dashboard")
    public String dashboard(Map<String, Object> model) {
        model.put("message", "HowToDoInJava Reader !!");
        return "dashboard";
    }
    @RequestMapping("/searchOrgs")
    public String searchOrgs(Map<String, Object> model) {
//        model.put("message", "HowToDoInJava Reader !!");
        return "searchOrgs";
    }
    @RequestMapping("/")
    public ModelAndView index(Map<String, Object> model) {
        List<Organization> organizations = orgService.listAll();
        ModelAndView mav = new ModelAndView("index");
        mav.addObject("listOrgs", organizations);
        return mav;
    }

}