package merrymac.sunshinecontacts.adapter;

import merrymac.sunshinecontacts.dao.entity.OrgAction;
import merrymac.sunshinecontacts.dao.entity.OrgAddress;
import merrymac.sunshinecontacts.dao.entity.OrgAlias;
import merrymac.sunshinecontacts.dao.entity.OrgPhone;
import merrymac.sunshinecontacts.dao.entity.Organization;
import merrymac.sunshinecontacts.response.OrgActionResponse;
import merrymac.sunshinecontacts.response.OrgResponse;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.List;

@Component
public class OrgResponseAdapter {

    public OrgResponse toOrgResponse(Organization organization,
                                     List<OrgPhone> phones,
                                     List<OrgAddress> addresses,
                                     List<OrgAction> actions,
                                     List<OrgAlias> aliases) {

        OrgResponse response = new OrgResponse();
        response.setId(organization.getId());
        response.setName(organization.getName());
        response.setType(organization.getType());
        response.setCreateTimestamp(organization.getCreateTimestamp());
        response.setCreateUser(organization.getCreateUser());
        response.setLastUpdateTimestamp(organization.getLastUpdateTimestamp());
        response.setLastUpdateUser(organization.getLastUpdateUser());
        response.setStatusCode(organization.getStatusCode());
        response.setDeleteTimestamp(organization.getDeleteTimestamp());
        response.setDeleteUser(organization.getDeleteUser());
        response.setPhones(phones);
        response.setAddresses(addresses);
        response.setActions(actions);
        response.setAliases(aliases);

        return response;
    }

    public OrgActionResponse toOrgActionResponse(OrgAction orgAction, Organization organization) {
        OrgActionResponse response = new OrgActionResponse();

        response.setActionType(orgAction.getActionType());
        response.setCompleted(orgAction.isCompleted());
        response.setCompleteDate(orgAction.getCompleteDate());
        response.setCompleteUser(orgAction.getCompleteUser());
        response.setCreateDate(orgAction.getCompleteDate());
        response.setCreateUser(orgAction.getCreateUser());
        response.setId(orgAction.getId());
        response.setNotes(orgAction.getNotes());
        response.setDueDate(orgAction.getDueDate());
        response.setCreateDate(orgAction.getCreateDate());
        response.setOrganization(organization);

        return response;
    }
}
