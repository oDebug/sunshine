package merrymac.sunshinecontacts.controller;

import merrymac.sunshinecontacts.dao.entity.Organization;
import merrymac.sunshinecontacts.dao.entity.User;
import merrymac.sunshinecontacts.response.ActionResponse;
import merrymac.sunshinecontacts.response.ContactResponse;
import merrymac.sunshinecontacts.service.ContactService;
import merrymac.sunshinecontacts.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
public class ContactController {
    @Autowired private ContactService contactService;
    @Autowired
    private OrgService orgService;
    @Autowired
    private UserService userService;
//    @Autowired private PeopleService peopleService;

    @RequestMapping("/dashboard")
    public ModelAndView dashboard()
    {
        ModelAndView mav = new ModelAndView("dashboard");

        List<ContactResponse> recentOrgs = contactService.getRecentlyAddedOrgs();
        mav.addObject("recentOrgs", recentOrgs);

        List<ActionResponse> upcomingActions = contactService.getUpcomingActions();
        mav.addObject("upcomingActions", upcomingActions);

        return mav;
    }

    @RequestMapping(value = "/listOrgs", method = RequestMethod.GET) //Return query for Organizations
    @ResponseBody
    public List<ContactResponse> listOrgs(@RequestParam(value = "name", defaultValue = "") String name ) {
        List<ContactResponse> response;
        if (name.isEmpty() ) {
            response = contactService.listAll();
        } else {
            response = contactService.searchByAlias(name);
    public List<OrgResponse> listOrgs(@RequestParam(value = "name", defaultValue = "") String name)
    {
        List<OrgResponse> response;
        if (name.isEmpty())
        {
            response = orgService.listAll();
        }
        else
        {
            response = orgService.searchByAlias(name);
        }
        return response;
    }
    @GetMapping("/searchOrgs")
    public ModelAndView searchOrgs(Map<String, Object> model)
    {
        List<OrgResponse> response = orgService.listAll();
    public ModelAndView searchOrgs(Map<String, Object> model) {
        List<ContactResponse> response = contactService.listAll();
        ModelAndView mav = new ModelAndView("searchOrgs");
        mav.addObject("tblResults", response);
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

    @RequestMapping("/validate")
    @ResponseBody
    public ModelAndView validate(@ModelAttribute("userForm") User user)
    {
        try
        {
            User dbUser = userService.get(user.getId());
            if (dbUser.getPw().equals(user.getPw())) //if username + pw is valid
            {
                return dashboard();
            }
            else
            {
                return invalidCredentials();
            }
        }
        catch (Exception e)
        {
            e.getMessage();
            return invalidCredentials();
        }
    }

    public ModelAndView invalidCredentials()
    {
        ModelAndView mav = new ModelAndView("index");
        return mav;
    }

    @RequestMapping("/addContact")
    @ResponseBody
    public void addContact(@ModelAttribute("addContactForm") Organization organization)
    {
        try
        {
            orgService.save(organization);
        }
        catch (Exception e)
        {
            e.getMessage();
        }
    }

}