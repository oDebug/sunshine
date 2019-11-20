package merrymac.sunshinecontacts.dao.repository;

import merrymac.sunshinecontacts.dao.entity.Alias;
import merrymac.sunshinecontacts.dao.entity.Contact;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AliasRepository extends CrudRepository<Alias, Long> {
    @Query("SELECT DISTINCT contact " +
            "FROM Alias a " +
            "WHERE LOCATE(:alias,a.alias) > 0")
    List<Contact> searchByAlias(@Param("alias") String alias);

    List<Alias> findByContactId(Long contactId);
}
