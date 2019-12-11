package merrymac.sunshinecontacts.dao.repository;

import merrymac.sunshinecontacts.dao.entity.Action;
import merrymac.sunshinecontacts.dao.entity.Contact;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface
ActionRepository extends CrudRepository<Action, Long> {

    @Query("SELECT a " +
            "FROM Action a " +
            "WHERE a.status <> 'Completed' " +
            "ORDER BY a.createDate desc ")
    List<Action> findTop5ByOrderByDueDateAsc ();
    Action findTopByOrderByIdDesc();
    List<Action> findByContactId(Long contactId);

    List<Action> findActionByActionTypeIn(String[] actionType);

    List<Action> findActionByContactIn(List<Contact> contactType);
}
