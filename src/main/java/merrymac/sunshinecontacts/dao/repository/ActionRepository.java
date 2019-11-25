package merrymac.sunshinecontacts.dao.repository;

import merrymac.sunshinecontacts.dao.entity.Action;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ActionRepository extends CrudRepository<Action, Long> {

    @Query("SELECT a " +
            "FROM Action a " +
            "WHERE a.completed=false " +
            "AND a.dueDate BETWEEN current_date AND current_date + 5 " +
            "ORDER BY a.dueDate ASC ")
    List<Action> findTop5ByOrderByDueDateAsc ();

    List<Action> findByContactId(Long contactId);
}
