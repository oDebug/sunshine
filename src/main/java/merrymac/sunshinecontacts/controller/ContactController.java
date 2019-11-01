package merrymac.sunshinecontacts.controller;

import merrymac.sunshinecontacts.entity.Organization;
import merrymac.sunshinecontacts.service.OrgService;
import merrymac.sunshinecontacts.service.PeopleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ContactController {
    @Autowired private OrgService orgService;
//    @Autowired private PeopleService peopleService;

    @RequestMapping("/")
    public ModelAndView home() {
        List<Organization> organizations = orgService.listAll();
        ModelAndView mav = new ModelAndView("index");
        mav.addObject("listOrgs", organizations);
        return mav;
    }

}