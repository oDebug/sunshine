package merrymac.sunshinecontacts.controller;

import merrymac.sunshinecontacts.response.OrgActionResponse;
import merrymac.sunshinecontacts.response.OrgResponse;
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

//    @Autowired private PeopleService peopleService;

    @RequestMapping("/dashboard")
    public ModelAndView dashboard(Map<String, Object> model) {
        ModelAndView mav = new ModelAndView("dashboard");

        List<OrgResponse> recentOrgs = orgService.getRecentlyAddedOrgs();
        mav.addObject("recentOrgs", recentOrgs);

        List<OrgActionResponse> upcomingActions = orgService.getUpcomingActions();
        mav.addObject("upcomingActions", upcomingActions);

        return mav;
    }

    @RequestMapping(value="/listOrgs", method= RequestMethod.GET )
    @ResponseBody
    public List<OrgResponse> listOrgs(@RequestParam(value = "name", defaultValue = "") String name ) {
        List<OrgResponse> response;
        if (name.isEmpty() ) {
            response = orgService.listAll();
        } else {
            response = orgService.searchByAlias(name);
        }
        return response;
    }
    @GetMapping("/searchOrgs")
    public ModelAndView searchOrgs(Map<String, Object> model) {
        List<OrgResponse> response = orgService.listAll();
        ModelAndView mav = new ModelAndView("searchOrgs");
        mav.addObject("tblResults", response);
        return mav;
    }

    @GetMapping("/editOrganization")
    @ResponseBody
    public ModelAndView editOrg(@RequestParam("id") String id) {
        Long orgId = Long.parseLong(id);
        OrgResponse response = orgService.get(orgId);
        ModelAndView mav = new ModelAndView("editOrganization");
        mav.addObject("result", response);
        return mav;
    }
}