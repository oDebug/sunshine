package merrymac.sunshinecontacts.dao.repository;

import merrymac.sunshinecontacts.dao.entity.Organization;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrgAliasRepository extends CrudRepository<Organization, Long> {
    @Query("SELECT DISTINCT organization " +
            "FROM OrgAlias oa " +
            "WHERE LOCATE(:alias,oa.alias) > 0")
    List<Organization> searchByAlias(@Param("alias") String alias);
}
