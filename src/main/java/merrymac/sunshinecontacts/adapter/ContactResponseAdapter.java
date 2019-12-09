package merrymac.sunshinecontacts.adapter;

import merrymac.sunshinecontacts.dao.entity.*;
import merrymac.sunshinecontacts.dao.entity.Contact;
import merrymac.sunshinecontacts.response.ActionResponse;
import merrymac.sunshinecontacts.response.ContactResponse;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ContactResponseAdapter {

    public ContactResponse toContactResponse(Contact contact,
                                             List<PhoneNumber> phones,
                                             List<Address> addresses,
                                             List<Action> actions,
                                             List<Alias> aliases,
                                             List<SocialMedia> socialMedia) {

        ContactResponse response = new ContactResponse();
        response.setId(contact.getId());
        response.setName(contact.getName());
        response.setType(contact.getType());
        response.setCreateTimestamp(contact.getCreateTimestamp());
        response.setCreateUser(contact.getCreateUser());
        response.setLastUpdateTimestamp(contact.getLastUpdateTimestamp());
        response.setLastUpdateUser(contact.getLastUpdateUser());
        response.setStatusCode(contact.getStatusCode());
        response.setDeleteTimestamp(contact.getDeleteTimestamp());
        response.setDeleteUser(contact.getDeleteUser());
        response.setPhones(phones);
        response.setAddresses(addresses);
        response.setActions(actions);
        response.setAliases(aliases);
        response.setSocialMedia(socialMedia);
        response.setEmail(contact.getEmail());
        response.setNotes(contact.getNotes());
        return response;
    }

    public ActionResponse toContactActionResponse(Action action, Contact contact) {
        ActionResponse response = new ActionResponse();

        response.setActionType(action.getActionType());
        response.setStatus(action.getStatus());
        response.setCompleteDate(action.getCompleteDate());
        response.setCompleteUser(action.getCompleteUser());
        response.setCreateDate(action.getCompleteDate());
        response.setCreateUser(action.getCreateUser());
        response.setId(action.getId());
        response.setNotes(action.getNotes());
        response.setDueDate(action.getDueDate());
        response.setCreateDate(action.getCreateDate());
        response.setContact(contact);

        return response;
    }
}
