package merrymac.sunshinecontacts.controller;

import merrymac.sunshinecontacts.dao.entity.Organization;
import merrymac.sunshinecontacts.service.OrgAliasService;
import merrymac.sunshinecontacts.service.OrgService;
//import merrymac.sunshinecontacts.service.PeopleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
public class ContactController {
    @Autowired private OrgService orgService;
    @Autowired private OrgAliasService orgAliasService;

//    @Autowired private PeopleService peopleService;

    @RequestMapping("/dashboard")
    public String dashboard(Map<String, Object> model) {
        model.put("message", "HowToDoInJava Reader !!");
        return "dashboard";
    }
    @RequestMapping(value="/listOrgs", method= RequestMethod.GET )
    @ResponseBody
    public ModelAndView listOrgs(@RequestParam(value = "name", defaultValue = "") String name ) {
        List<Organization> organizations;
        if (name.isEmpty() ) {
            organizations = orgService.listAll();
        } else {
            organizations = orgAliasService.searchByAlias(name);
        }
        ModelAndView mav = new ModelAndView("searchOrgs");
        mav.addObject("tblResults", organizations);
        return mav;
    }
    @GetMapping("/searchOrgs")
    public ModelAndView searchOrgs(Map<String, Object> model) {
        List<Organization> organizations = orgService.listAll();
        ModelAndView mav = new ModelAndView("searchOrgs");
        mav.addObject("tblResults", organizations);
        return mav;
    }

}