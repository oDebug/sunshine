package merrymac.sunshinecontacts.controller;

import merrymac.sunshinecontacts.dao.entity.Address;
import merrymac.sunshinecontacts.dao.entity.Contact;
import merrymac.sunshinecontacts.dao.entity.PhoneNumber;
import merrymac.sunshinecontacts.dao.entity.User;
import merrymac.sunshinecontacts.response.ActionResponse;
import merrymac.sunshinecontacts.response.ContactResponse;
import merrymac.sunshinecontacts.service.ContactService;
import merrymac.sunshinecontacts.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class ContactController {
    @Autowired
    private ContactService contactService;
    @Autowired
    private UserService userService;

    @RequestMapping("/dashboard")
    public ModelAndView dashboard() {
        ModelAndView mav = new ModelAndView("dashboard");

        List<ContactResponse> recentContacts = contactService.getRecentlyAddedContacts();
        mav.addObject("recentContacts", recentContacts);

        List<ActionResponse> upcomingActions = contactService.getUpcomingActions();
        mav.addObject("upcomingActions", upcomingActions);

        return mav;
    }

    @RequestMapping(value = "/listOrgs", method = RequestMethod.GET) //Return query for Organizations
    @ResponseBody
    public List<ContactResponse> listOrgs(@RequestParam(value = "name", defaultValue = "") String name) {
        List<ContactResponse> response;
        if (name.isEmpty()) {
            response = contactService.getRecentlyAddedContacts();
        } else {
            response = contactService.searchByAlias(name);
        }
        return response;
    }

    @RequestMapping(value = "/getAddress", method = RequestMethod.GET) //Return query for address
    @ResponseBody
    public ContactResponse getAddress(@RequestParam(value = "id") String id)
    {
        ContactResponse response;
        response = contactService.get(Long.parseLong(id)); //Could use a more purpose-built service response

        return response;
    }

    @GetMapping("/searchContacts")
    public ModelAndView searchContacts(Map<String, Object> model) {
//        List<ContactResponse> response = contactService.listAll();
        ModelAndView mav = new ModelAndView("searchContacts");
//        mav.addObject("tblResults", response);
        return mav;
    }

    @GetMapping("/editContact")
    @ResponseBody
    public ModelAndView editOrg(@RequestParam("id") String id) {
        Long orgId = Long.parseLong(id);
        ContactResponse response = contactService.get(orgId);
        ModelAndView mav = new ModelAndView("editContact_deprecated");
        mav.addObject("result", response);
        return mav;
    }



    @GetMapping("/reports")
    public ModelAndView Reports() {
        ModelAndView mav = new ModelAndView("reports");
        return mav;
    }


    @RequestMapping(value = "/validate", method = RequestMethod.GET)
    public ResponseEntity<Object> deleteSport(@RequestParam("userid") String userId, @RequestParam("userpass") String userPass) {
        try {
            User dbUser = userService.get(userId);
            if (dbUser.getPw().equals(userPass)) //if username + pw is valid
            {
                return new ResponseEntity<Object>(null, HttpStatus.OK);
            } else {
                return new ResponseEntity<Object>(null, HttpStatus.UNAUTHORIZED);
            }
        } catch (Exception e) {
            e.getMessage();
            return new ResponseEntity<Object>(null, HttpStatus.UNAUTHORIZED);
        }
    }

    @RequestMapping(value = "/saveContact", method = RequestMethod.POST)
    public ResponseEntity<Object> saveContact(Map<String, Object> model,
                                              HttpServletRequest request,
                                              @ModelAttribute("phones") List<PhoneNumber> phones,
                                              @ModelAttribute("addresses") List<Address> addresses) {
        Contact contact = new Contact();
        contact.setId((Long) model.get("id"));
        try {
            contactService.save(contact);
            return new ResponseEntity<Object>(HttpStatus.OK);
        } catch (Exception e) {
            e.getMessage();
            return new ResponseEntity<Object>(HttpStatus.EXPECTATION_FAILED);
        }
    }

    @GetMapping("/getContact")
    @ResponseBody
    public ContactResponse getContact(@RequestParam("id") String id) {
        try {
            Long contactId = Long.parseLong(id);
            ContactResponse response = contactService.get(contactId);
            return response;
        } catch (NumberFormatException e) {
            return null;
        }
    }

}