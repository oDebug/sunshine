package merrymac.sunshinecontacts.dao.repository;

import merrymac.sunshinecontacts.dao.entity.Action;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ActionRepository extends CrudRepository<Action, Long> {

    @Query("SELECT a " +
            "FROM Action a " +
            "WHERE a.status <> 'Completed' " +
            "ORDER BY a.createDate desc ")
    List<Action> findTop5ByOrderByDueDateAsc ();
    Action findTopByOrderByIdDesc();
    List<Action> findByContactId(Long contactId);
}
