package merrymac.sunshinecontacts.dao.repository;

import merrymac.sunshinecontacts.dao.entity.SocialMedia;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SocialMediaRepository extends CrudRepository<SocialMedia, Long> {
    List<SocialMedia> findByContactId(Long contactId);
}
