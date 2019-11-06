package merrymac.sunshinecontacts.service;

import merrymac.sunshinecontacts.dao.entity.Organization;
import merrymac.sunshinecontacts.dao.repository.OrgAliasRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrgAliasService {
    @Autowired
    OrgAliasRepository orgAliasRepository;

    public List<Organization> searchByAlias(String alias) {
        return orgAliasRepository.searchByAlias(alias);
    }
}
