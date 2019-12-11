package merrymac.sunshinecontacts.dao.repository;

import merrymac.sunshinecontacts.dao.entity.Contact;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContactRepository extends CrudRepository<Contact, Long> {
    Contact findById(Integer id);
//    List<Contact>findTop5ByOrderByCreateTimestampDesc();
    Contact findTopByOrderByIdDesc();
    List<Contact>findContactByTypeIn(String[] contactType);

    @Query(nativeQuery = true,
            value = "SELECT c.*, IF(c.last_update_timestamp IS NULL, c.create_timestamp, c.last_update_timestamp) Recent" +
                    " FROM contacts c " +
                    "ORDER BY Recent DESC limit :limit"
    )
    List<Contact> findRecentContacts(int limit);

}
