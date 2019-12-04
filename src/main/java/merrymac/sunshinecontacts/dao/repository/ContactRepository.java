package merrymac.sunshinecontacts.dao.repository;

import merrymac.sunshinecontacts.dao.entity.Contact;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContactRepository extends CrudRepository<Contact, Long> {
    Contact findById(Integer id);
    List<Contact>findTop5ByOrderByCreateTimestampDesc();
    Contact findTopByOrderByIdDesc();
}
