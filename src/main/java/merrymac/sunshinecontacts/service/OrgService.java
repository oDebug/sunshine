package merrymac.sunshinecontacts.service;

import merrymac.sunshinecontacts.entity.Organization;
import merrymac.sunshinecontacts.repository.OrgRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrgService {
    @Autowired
    OrgRepository orgRepository;

    public void save(Organization organization) {
        orgRepository.save(organization);
    }

    public List<Organization> listAll() {
        return (List<Organization>) orgRepository.findAll();
    }

    public Organization get(Long id) {
        return orgRepository.findById(id).get();
    }

    public void delete(Long id) {
        orgRepository.deleteById(id);
    }
}
