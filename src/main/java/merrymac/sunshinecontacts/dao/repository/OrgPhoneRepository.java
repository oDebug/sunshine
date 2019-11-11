package merrymac.sunshinecontacts.dao.repository;

import merrymac.sunshinecontacts.dao.entity.OrgPhone;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface OrgPhoneRepository extends CrudRepository<OrgPhone, Long> {
    List<OrgPhone> findByOrgId(Long orgId);
}
