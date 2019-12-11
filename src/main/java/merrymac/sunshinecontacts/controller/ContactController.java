package merrymac.sunshinecontacts.controller;

import merrymac.sunshinecontacts.dao.entity.*;
import merrymac.sunshinecontacts.request.ContactRequest;
import merrymac.sunshinecontacts.request.EditContactRequest;
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

import java.sql.Timestamp;
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

    @RequestMapping(value = "/listContacts", method = RequestMethod.GET) //Return query for Organizations
    @ResponseBody
    public List<ContactResponse> listContacts(@RequestParam(value = "name", defaultValue = "") String name) {
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
    public ContactResponse getAddress(@RequestParam(value = "id") String id) {
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

    @RequestMapping(value = "/addContact", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Object> addContact(@RequestBody ContactRequest contactRequest) {
        Contact contact = new Contact();
        Address newAddress = new Address();
        PhoneNumber newPhone = new PhoneNumber();

        try {
            contact.setId(0L);
            contact.setName(contactRequest.getName());
            contact.setType(contactRequest.getType());
            contact.setDenomination(contactRequest.getDescription());
            contact.setCreateTimestamp(new Timestamp(System.currentTimeMillis()));
            contact.setStatusCode("A");

            newAddress.setId(0L);
            newAddress.setStreet(contactRequest.getStreet());
            newAddress.setCity(contactRequest.getCity());
            newAddress.setState(contactRequest.getState());
            newAddress.setPostalCode(Long.parseLong(contactRequest.getZip()));

            newPhone.setId(0L);
            newPhone.setPhone(Long.parseLong(contactRequest.getPhone()));
            newPhone.setType(contactRequest.getPhoneType());
            newPhone.setExtension(contactRequest.getExtension());

        } catch (Exception e) {
            e.getMessage();
            return new ResponseEntity<Object>(HttpStatus.EXPECTATION_FAILED);
        }

        Contact newContact = new Contact();
        try {
            contactService.saveContact(contact);
            newContact = contactService.getLastAddedContact();

        } catch (Exception e) {
            e.getMessage();
            return new ResponseEntity<Object>(HttpStatus.EXPECTATION_FAILED);
        }
        newAddress.setContactId(newContact.getId());
        newPhone.setContactId(newContact.getId());

        try {
            contactService.saveAddress(newAddress);
        } catch (Exception e) {
            e.getMessage();
            return new ResponseEntity<Object>(HttpStatus.EXPECTATION_FAILED);
        }

        try {
            contactService.savePhone(newPhone);
        } catch (Exception e) {
            e.getMessage();
            return new ResponseEntity<Object>(HttpStatus.EXPECTATION_FAILED);
        }
        return new ResponseEntity<Object>(HttpStatus.OK);
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

    @RequestMapping(value = "/addAction", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Action> addAction(@RequestBody Action action) {
        Action newAction = null;
        try {
            Timestamp curTimestamp = new Timestamp(System.currentTimeMillis());
            action.setId(0L);
            action.setCreateDate(curTimestamp);
            if (action.getStatus().equals("Completed")) {
                action.setCompleteDate(curTimestamp);
            }
            newAction = contactService.saveAction(action);

        } catch (Exception e) {
            e.getMessage();
            return new ResponseEntity<Action>(HttpStatus.EXPECTATION_FAILED);
        }

        return new ResponseEntity<Action>(newAction, HttpStatus.OK);
    }

    @RequestMapping(value = "/updateContact", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Object> updateContact(@RequestBody EditContactRequest contact) {
        Contact saveContact;
        Long contactId;
        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        try {
            contactId = Long.parseLong(contact.getId());
            saveContact = new Contact();
            saveContact.setId(contactId);
            saveContact.setName(contact.getName());
            saveContact.setEmail(contact.getEmail());
            saveContact.setType(contact.getType());
            saveContact.setDenomination(contact.getDescription());
            saveContact.setLastUpdateTimestamp(currentTime);

            contactService.saveContact(saveContact);

            for (Address address : contact.getAddresses()) {
//                address.setContactId(contactId);
                contactService.saveAddress(address);
            }
            for (PhoneNumber phone : contact.getPhones()) {
//                phone.setContactId(contactId);
                contactService.savePhone(phone);
            }
        } catch (Exception e) {
            return new ResponseEntity<Object>(e, HttpStatus.EXPECTATION_FAILED);
        }

        ContactResponse newContact = contactService.get(contactId);
        return new ResponseEntity<Object>(newContact, HttpStatus.OK);
    }
}