package merrymac.sunshinecontacts.dao.repository;

import merrymac.sunshinecontacts.dao.entity.OrgAddress;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface OrgAddressRepository extends CrudRepository<OrgAddress, Long> {
    List<OrgAddress> findByOrgId(Long orgId);
}
