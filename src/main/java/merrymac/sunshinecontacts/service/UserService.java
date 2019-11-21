package merrymac.sunshinecontacts.service;

import merrymac.sunshinecontacts.dao.entity.User;
import merrymac.sunshinecontacts.dao.repository.UserLoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserService
{
    @Autowired
    UserLoginRepository userLoginRepository;

    public User get(String id)
    {
        User user = userLoginRepository.findById(id).get();
        return user;
    }
}
