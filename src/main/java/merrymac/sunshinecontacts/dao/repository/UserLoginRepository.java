package merrymac.sunshinecontacts.dao.repository;

import merrymac.sunshinecontacts.dao.entity.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserLoginRepository extends CrudRepository<User, String>
{

}

