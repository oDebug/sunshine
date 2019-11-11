package merrymac.sunshinecontacts.service;

import merrymac.sunshinecontacts.adapter.OrgResponseAdapter;
import merrymac.sunshinecontacts.dao.entity.OrgAction;
import merrymac.sunshinecontacts.dao.entity.OrgAddress;
import merrymac.sunshinecontacts.dao.entity.OrgAlias;
import merrymac.sunshinecontacts.dao.entity.OrgPhone;
import merrymac.sunshinecontacts.dao.entity.Organization;
import merrymac.sunshinecontacts.dao.repository.*;
import merrymac.sunshinecontacts.response.OrgActionResponse;
import merrymac.sunshinecontacts.response.OrgResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class OrgService {
    @Autowired
    OrgRepository orgRepository;
    @Autowired
    OrgAliasRepository orgAliasRepository;
    @Autowired
    OrgActionRepository orgActionRepository;
    @Autowired
    OrgAddressRepository orgAddressRepository;
    @Autowired
    OrgPhoneRepository orgPhoneRepository;

    @Autowired
    OrgResponseAdapter orgResponseAdapter;

    public void save(Organization organization) {
        orgRepository.save(organization);
    }

    public List<OrgResponse> searchByAlias(String alias) {
        List<Organization> organizations = orgAliasRepository.searchByAlias(alias);
        List<OrgResponse> response = new ArrayList<>();
        for (Organization org : organizations) {
            response.add(toOrgResponse(org));
        }
        return response;
    }

    public List<OrgResponse> listAll() {
        List<Organization> organizations = (List<Organization>) orgRepository.findAll();
        List<OrgResponse> response = new ArrayList<>();
        for (Organization org : organizations) {
            response.add(toOrgResponse(org));
        }
        return response;
    }

    public List<OrgResponse> getRecentlyAddedOrgs() {
        List<Organization> organizations = orgRepository.findTop5ByOrderByCreateTimestampDesc();
        List<OrgResponse> response = new ArrayList<>();
        for (Organization org : organizations) {
            response.add(toOrgResponse(org));
        }
        return response;
    }

    public OrgResponse get(Long id) {
        Organization organization = orgRepository.findById(id).get();
        OrgResponse response = toOrgResponse(organization);
        return response;
    }

    public void delete(Long id) {
        orgRepository.deleteById(id);
    }

    private OrgResponse toOrgResponse(Organization organization) {
        OrgResponse response = new OrgResponse();
        OrgResponse element;

        Long orgId = organization.getId();

        List<OrgPhone> phones = orgPhoneRepository.findByOrgId(orgId);
        List<OrgAction> actions = orgActionRepository.findByOrgId(orgId);
        List<OrgAddress> addresses = orgAddressRepository.findByOrgId(orgId);
        List<OrgAlias> aliases = orgAliasRepository.findByOrgId(orgId);

        return orgResponseAdapter.toOrgResponse(organization, phones, addresses, actions, aliases);

    }

    public List<OrgActionResponse> getUpcomingActions() {
        List<OrgAction> results = orgActionRepository.findTop5ByOrderByDueDateAsc();

        List<OrgActionResponse> response = new ArrayList<>();
        for (OrgAction action : results) {
            Organization organization = orgRepository.findById(action.getOrgId()).get();
            response.add(orgResponseAdapter.toOrgActionResponse(action, organization));
        }

        return response;
    }
}
