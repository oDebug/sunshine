package merrymac.sunshinecontacts.service;

import merrymac.sunshinecontacts.dao.entity.Alias;
import merrymac.sunshinecontacts.dao.repository.AliasRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AliasService {
    @Autowired
    AliasRepository aliasRepository;

    public Alias findById(Long id) {
        return aliasRepository.findById(id).get();
    }
    public void save(Alias alias) {
        aliasRepository.save(alias);
    }
    public void delete(Alias alias) {
        aliasRepository.delete(alias);
    }
    public List<Alias> findByContactId(Long contactId) {
        return aliasRepository.findByContactId(contactId);
    }
}
