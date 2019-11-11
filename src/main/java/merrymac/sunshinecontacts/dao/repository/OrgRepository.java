package merrymac.sunshinecontacts.dao.repository;

import merrymac.sunshinecontacts.dao.entity.Organization;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrgRepository extends CrudRepository<Organization, Long> {
    Organization findById(Integer id);
    List<Organization>findTop5ByOrderByCreateTimestampDesc();
}
