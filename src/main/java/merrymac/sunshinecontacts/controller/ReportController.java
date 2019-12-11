package merrymac.sunshinecontacts.controller;

import merrymac.sunshinecontacts.dao.entity.Action;
import merrymac.sunshinecontacts.response.ActionResponse;
import merrymac.sunshinecontacts.response.ContactResponse;
import merrymac.sunshinecontacts.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.text.ParseException;
import java.util.*;

@Controller
public class ReportController {

    @Autowired
    private ReportService reportService;

    @GetMapping("/reports")
    public ModelAndView Reports() {
        ModelAndView mav = new ModelAndView("reports");
        return mav;
    }

    @RequestMapping(value = "/actionReport", method = RequestMethod.GET)
    public ModelAndView actionReport(@RequestParam(value="actionType") String[] actionType,
                                     @RequestParam(value="contactType") String[] contactType
                                             ) {
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
          ModelAndView mav = new ModelAndView("reportsPreview");
           List<Action> results = reportService.getActionReport(actionType, contactType);


//        mav.addObject("results", results);
        mav.addObject("actionType", actionType);
        mav.addObject("contact", results);
        return mav;
    }
}
