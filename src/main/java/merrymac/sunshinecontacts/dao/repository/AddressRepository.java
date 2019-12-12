package merrymac.sunshinecontacts.dao.repository;

import merrymac.sunshinecontacts.dao.entity.Address;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AddressRepository extends CrudRepository<Address, Long> {
    List<Address> findByContactId(Long contactId);
}
