package merrymac.sunshinecontacts.repository;

import merrymac.sunshinecontacts.entity.Organization;
import org.springframework.data.repository.CrudRepository;

public interface OrgRepository extends CrudRepository<Organization, Long> {
}
