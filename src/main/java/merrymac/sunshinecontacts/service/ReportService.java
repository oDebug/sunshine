package merrymac.sunshinecontacts.service;

import merrymac.sunshinecontacts.adapter.ContactResponseAdapter;
import merrymac.sunshinecontacts.dao.entity.*;
import merrymac.sunshinecontacts.dao.repository.*;
import merrymac.sunshinecontacts.response.ActionResponse;
import merrymac.sunshinecontacts.response.ContactResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Service
@Transactional
public class ReportService {
    @Autowired
    ContactRepository contactRepository;
    @Autowired
    AliasRepository aliasRepository;
    @Autowired
    ActionRepository actionRepository;
    @Autowired
    AddressRepository addressRepository;
    @Autowired
    PhoneRepository phoneRepository;
    @Autowired
    ContactResponseAdapter contactResponseAdapter;
    @Autowired
    SocialMediaRepository socialMediaRepository;

    public List<Action> getActionReport(String[] actionType, String [] contactType) {
        List<Contact> contacts = contactRepository.findContactByTypeIn(contactType);
//        List<Action> results = actionRepository.findActionByActionTypeIn(actionType);
        List<Action> results = actionRepository.findActionByActionTypeInAndContactIn(actionType, contacts);



            return results;


    }
}
