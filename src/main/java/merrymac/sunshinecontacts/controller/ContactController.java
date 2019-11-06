package merrymac.sunshinecontacts.controller;

import merrymac.sunshinecontacts.dao.entity.OrgAction;
import merrymac.sunshinecontacts.dao.entity.Organization;
import merrymac.sunshinecontacts.service.OrgActionService;
import merrymac.sunshinecontacts.service.OrgAliasService;
import merrymac.sunshinecontacts.service.OrgService;
//import merrymac.sunshinecontacts.service.PeopleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class ContactController {
    @Autowired private OrgService orgService;
    @Autowired private OrgAliasService orgAliasService;
    @Autowired private OrgActionService orgActionService;

//    @Autowired private PeopleService peopleService;

    @RequestMapping("/dashboard")
    public ModelAndView dashboard(Map<String, Object> model) {
        ModelAndView mav = new ModelAndView("dashboard");

        List<Organization> recentOrgs = orgService.getRecentlyAddedOrgs();
        mav.addObject("recentOrgs", recentOrgs);

        List<OrgAction> upcomingActions = orgActionService.getUpcomingActions();
        mav.addObject("upcomingActions", upcomingActions);

        return mav;
    }

    @RequestMapping(value="/listOrgs", method= RequestMethod.GET )
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

    @GetMapping("/editOrganization")
    public ModelAndView editOrg(@RequestParam("id") String id) {
        Long orgId = Long.parseLong(id);
        Organization organization = orgService.get(orgId);
        ModelAndView mav = new ModelAndView("editOrganization");
        mav.addObject("result", organization);
        return mav;
    }
}