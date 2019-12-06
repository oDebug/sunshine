package merrymac.sunshinecontacts.request;

import lombok.Data;
import lombok.NoArgsConstructor;
import merrymac.sunshinecontacts.dao.entity.Address;
import merrymac.sunshinecontacts.dao.entity.PhoneNumber;

import java.util.List;

@Data@NoArgsConstructor
public class EditContactRequest {
    private String id;
    private String name;
    private String type;
    private String email;
    private String description;
    private List<Address> addresses;
    private List<PhoneNumber> phones;
}
