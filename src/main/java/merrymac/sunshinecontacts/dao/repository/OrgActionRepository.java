package merrymac.sunshinecontacts.dao.repository;

import merrymac.sunshinecontacts.dao.entity.OrgAction;
import merrymac.sunshinecontacts.dao.entity.Organization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

public interface OrgActionRepository extends CrudRepository<OrgAction, Long> {

    @Query("SELECT a " +
            "FROM OrgAction a " +
            "WHERE a.completed=false " +
            "AND a.dueDate BETWEEN current_date AND current_date + 5 " +
            "ORDER BY a.dueDate ASC ")
    List<OrgAction> findTop5ByOrderByDueDateAsc ();




}
