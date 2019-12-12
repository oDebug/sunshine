package merrymac.sunshinecontacts.request;

import lombok.Data;
import lombok.NoArgsConstructor;
import merrymac.sunshinecontacts.dao.entity.Address;
import merrymac.sunshinecontacts.dao.entity.Contact;
import merrymac.sunshinecontacts.dao.entity.PhoneNumber;

import java.util.List;

@Data
@NoArgsConstructor
public class EditContactRequest {
    private Contact contact;
    private List<Address> addresses;
    private List<PhoneNumber> phones;
}
