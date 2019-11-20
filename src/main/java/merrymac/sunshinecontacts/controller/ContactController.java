package merrymac.sunshinecontacts.controller;

import merrymac.sunshinecontacts.response.ActionResponse;
import merrymac.sunshinecontacts.response.ContactResponse;
import merrymac.sunshinecontacts.service.ContactService;
//import merrymac.sunshinecontacts.service.PeopleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
public class ContactController {
    @Autowired private ContactService contactService;

    @RequestMapping("/dashboard")
    public ModelAndView dashboard(Map<String, Object> model) {
        ModelAndView mav = new ModelAndView("dashboard");

        List<ContactResponse> recentOrgs = contactService.getRecentlyAddedOrgs();
        mav.addObject("recentOrgs", recentOrgs);

        List<ActionResponse> upcomingActions = contactService.getUpcomingActions();
        mav.addObject("upcomingActions", upcomingActions);

        return mav;
    }

    @RequestMapping(value="/listOrgs", method= RequestMethod.GET )
    @ResponseBody
    public List<ContactResponse> listOrgs(@RequestParam(value = "name", defaultValue = "") String name ) {
        List<ContactResponse> response;
        if (name.isEmpty() ) {
            response = contactService.listAll();
        } else {
            response = contactService.searchByAlias(name);
        }
        return response;
    }
    @GetMapping("/searchOrgs")
    public ModelAndView searchOrgs(Map<String, Object> model) {
        List<ContactResponse> response = contactService.listAll();
        ModelAndView mav = new ModelAndView("searchOrgs");
        mav.addObject("tblResults", response);
        model.get("id");

        return mav;
    }

    @GetMapping("/editOrganization")
    @ResponseBody
    public ModelAndView editOrg(@RequestParam("id") String id) {
        Long orgId = Long.parseLong(id);
        ContactResponse response = contactService.get(orgId);
        ModelAndView mav = new ModelAndView("editOrganization");
        mav.addObject("result", response);
        return mav;
    }
}