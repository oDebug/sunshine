package merrymac.sunshinecontacts.service;

import merrymac.sunshinecontacts.dao.entity.OrgAction;
import merrymac.sunshinecontacts.dao.repository.OrgActionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrgActionService {
    @Autowired
    OrgActionRepository orgActionRepository;

    public List<OrgAction> getUpcomingActions() {
        List<OrgAction> results = orgActionRepository.findTop5ByOrderByDueDateAsc();
        int s = results.size();
        if (s > 5) {
            results.subList(5, s).clear();
        }
        return results;
    }
}
