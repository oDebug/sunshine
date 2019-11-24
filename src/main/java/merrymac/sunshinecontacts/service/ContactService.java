package merrymac.sunshinecontacts.service;

import merrymac.sunshinecontacts.adapter.ContactResponseAdapter;
import merrymac.sunshinecontacts.dao.entity.*;
import merrymac.sunshinecontacts.dao.entity.Contact;
import merrymac.sunshinecontacts.dao.repository.*;
import merrymac.sunshinecontacts.response.ActionResponse;
import merrymac.sunshinecontacts.response.ContactResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class ContactService {
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

    public void save(Contact contact) {
        contactRepository.save(contact);
    }

    public List<ContactResponse> searchByAlias(String alias) {
        List<Contact> contacts = aliasRepository.searchByAlias(alias);
        List<ContactResponse> response = new ArrayList<>();
        for (Contact org : contacts) {
            response.add(toContactResponse(org));
        }
        return response;
    }

    public List<ContactResponse> listAll() {
        List<Contact> contacts = (List<Contact>) contactRepository.findAll();
        List<ContactResponse> response = new ArrayList<>();
        for (Contact org : contacts) {
            response.add(toContactResponse(org));
        }
        return response;
    }

    public List<ContactResponse> getRecentlyAddedContacts() {
        List<Contact> contacts = contactRepository.findTop5ByOrderByCreateTimestampDesc();
        List<ContactResponse> response = new ArrayList<>();
        for (Contact org : contacts) {
            response.add(toContactResponse(org));
        }
        return response;
    }

    public ContactResponse get(Long id) {
        Contact contact = contactRepository.findById(id).get();
        ContactResponse response = toContactResponse(contact);
        return response;
    }

    public void delete(Long id) {
        contactRepository.deleteById(id);
    }

    private ContactResponse toContactResponse(Contact contact) {
        ContactResponse response = new ContactResponse();
        ContactResponse element;

        Long orgId = contact.getId();

        List<PhoneNumber> phones = phoneRepository.findByOrgId(orgId);
        List<Action> actions = actionRepository.findByOrgId(orgId);
        List<Address> addresses = addressRepository.findByOrgId(orgId);
        List<Alias> aliases = aliasRepository.findByContactId(orgId);

        return contactResponseAdapter.toContactResponse(contact, phones, addresses, actions, aliases);

    }

    public List<ActionResponse> getUpcomingActions() {
        List<Action> results = actionRepository.findTop5ByOrderByDueDateAsc();

        List<ActionResponse> response = new ArrayList<>();
        for (Action action : results) {
            Contact contact = contactRepository.findById(action.getOrgId()).get();
            response.add(contactResponseAdapter.toContactActionResponse(action, contact));
        }

        return response;
    }
}
