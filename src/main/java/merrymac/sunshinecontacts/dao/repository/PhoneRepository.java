package merrymac.sunshinecontacts.dao.repository;

import merrymac.sunshinecontacts.dao.entity.PhoneNumber;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PhoneRepository extends CrudRepository<PhoneNumber, Long> {
    List<PhoneNumber> findByOrgId(Long orgId);
}
